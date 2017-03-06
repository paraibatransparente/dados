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

print "# criando estrutura da tabela credor_empenho_historico_gestora_funcao_ano"
cursor = conexao.cursor()
cursor_insert = conexao.cursor()
cursor.executescript(open(os.getcwd()+'/ddl/credor_empenho_historico_gestora_funcao_ano.sql').read())

ano = sys.argv[1]

cursor = conexao.cursor()
cursor2 = conexao.cursor()
cursor_insert = conexao.cursor()

print "# loop sobre os gestora/função (~ 10 min)"
for unidade in (cursor.execute('''
    SELECT DISTINCT dt_Ano, cd_ugestora
      FROM pagamento_historico_gestora_funcao_ano
     WHERE dt_Ano >= ?
     ORDER BY dt_ano DESC, cd_ugestora
 ''', (ano, ))):
    print str(unidade[0]) + ' | ' + str(unidade[1])
    for item in (cursor2.execute('''
        SELECT
          e.cd_ugestora,
          e.cd_credor,
          e.no_credor,
          e.de_funcao,
          e.dt_ano,
          (round(sum(e.vl_Empenho), 2)) AS vl_empenho
        FROM empenho e
        WHERE e.dt_Ano IN (?)
              AND e.cd_ugestora = ?
        GROUP BY e.cd_ugestora
                ,e.cd_credor
                ,e.no_credor
                ,e.de_funcao
                ,e.dt_ano''', (ano, unidade[1], ) )):
        cursor_insert.executemany('INSERT INTO credor_empenho_historico_gestora_funcao_ano VALUES (NULL, ?, ?, ?, ?, ?, ?)', (item, ))
    conexao.commit()
    cursor_insert.close()
    cursor2.close()

conexao.commit()
cursor.close()

print "Fechando conexão ao banco"
conexao.close()
