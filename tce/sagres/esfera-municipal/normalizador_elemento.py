# -*- coding: utf-8 -*-
import sqlite3 # biblioteca necessária para trabalhar com sqlite3
import os
import sys
from unicodedata import normalize

"""
Script responsável pela normalização das tabelas da ESFERA MUNICIPAL

@author Diego Nobre
@since 27/02/2016
"""

def conectar(path_banco):
    # abrindo conexão com o banco de Dados
    conexao = sqlite3.connect(path_banco)
    # configuração necessária para trabalhar com unicode
    conexao.text_factory = str

    return conexao

'''
Devolve cópia de uma str substituindo os caracteres
acentuados pelos seus equivalentes não acentuados.

ATENÇÃO: carateres gráficos não ASCII e não alfa-numéricos,
tais como bullets, travessões, aspas assimétricas, etc.
são simplesmente removidos!

    >>> remover_acentos('[ACENTUAÇÃO] ç: áàãâä! éèêë? íì&#297;îï, óòõôö; úù&#361;ûü.')
    '[ACENTUACAO] c: aaaaa! eeee? iiiii, ooooo; uuuuu.'

'''
def remover_acentos(txt, codif='utf-8'):
    return normalize('NFKD', txt.decode(codif)).encode('ASCII','ignore')

print "# conectando ao banco de dados"
try:
    conexao = conectar(os.getcwd()+'/esfera-municipal.db')
except Exception as e:
    print "Erro ao conectar:", e
    exit()

print "# criando estrutura da tabela pagamento_historico_gestora_elemento_ano"
cursor = conexao.cursor()
cursor_insert = conexao.cursor()
cursor.executescript(open(os.getcwd()+'/ddl/pagamento_historico_gestora_elemento_ano.sql').read())

ano = sys.argv[1]

cursor = conexao.cursor()
cursor_insert = conexao.cursor()
print "# loop sobre os empenhos"
#for unidade in (cursor.execute('''SELECT DISTINCT dt_ano, cd_ugestora FROM empenho WHERE dt_ano >= ? AND cd_municipio IN ('095', '050', '040', '171', '135', '025', '211', '046') ORDER BY dt_ano DESC''', (ano, ))):
for unidade in (cursor.execute('''SELECT DISTINCT dt_ano, cd_ugestora FROM empenho WHERE dt_ano >= ? ORDER BY dt_ano DESC''', (ano, ))):
    print str(unidade[0]) + ";" + str(unidade[1])
    cursor2 = conexao.cursor()
    cursor_insert = conexao.cursor()
    for item in (cursor2.execute('''SELECT e.cd_ugestora, e.de_elemento, p.dt_ano, sum(p.vl_Pagamento) AS vl_total
                   FROM empenho e
                   JOIN pagamento p on p.cd_UGestora = e.cd_ugestora
                    and p.dt_Ano = e.dt_Ano
                    and p.nu_Empenho = e.nu_Empenho
                 WHERE e.dt_Ano = ?
                   AND e.cd_ugestora = ?
                 GROUP BY e.cd_ugestora, e.de_elemento, p.dt_ano''', (unidade[0], unidade[1], ) )):
        cursor_insert.executemany('INSERT INTO pagamento_historico_gestora_elemento_ano VALUES (NULL, ?, ?, ?, ?)', (item, ))
    conexao.commit()
    cursor_insert.close()
    cursor2.close()

conexao.commit()
cursor.close()

print "Fechando conexão ao banco"
conexao.close()
