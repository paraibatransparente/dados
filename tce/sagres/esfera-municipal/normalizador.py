# -*- coding: utf-8 -*-
import sqlite3 # biblioteca necessária para trabalhar com sqlite3
import os
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

print "# criando estrutura da tabela UNIDADE_GESTORA"
cursor = conexao.cursor()
cursor_insert = conexao.cursor()
cursor.executescript(open(os.getcwd()+'/ddl/unidade_gestora.sql').read())

print "# loop sobre as unidades gestoras da tabela empenho"
for unidade in (cursor.execute('SELECT DISTINCT cd_ugestora, de_ugestora FROM empenho')):
    #print str(unidade[0]) + ";" + unidade[1]
    cursor_insert.executemany('INSERT INTO unidade_gestora VALUES (NULL, ?, ?)', (unidade, ))

conexao.commit()
cursor.close()
cursor_insert.close()

print "# criando estrutura da tabela CREDOR"
cursor = conexao.cursor()
cursor_insert = conexao.cursor()
cursor.executescript(open(os.getcwd()+'/ddl/credor.sql').read())

print "# loop sobre os credores da tabela empenho"
for credor in (cursor.execute('SELECT DISTINCT cd_credor, no_credor FROM empenho')):
    #print str(credor[0]) + ";" + credor[1]
    cursor_insert.executemany('INSERT INTO credor VALUES (NULL, ?, ?)', (credor, ))

conexao.commit()
cursor.close()
cursor_insert.close()

print "Criando tabela de municipios"
cursor = conexao.cursor()
cursor.executescript(open(os.getcwd()+'/ddl/municipio.sql').read())
cursor.close()

print "Alimentando campo ds_link da tabela municipio"
cursor = conexao.cursor()
cursor_upd = conexao.cursor()
for municipio in (cursor.execute('SELECT cd_municipio, de_municipio FROM municipio')):
    print remover_acentos(municipio[1]).lower().replace(" ", "-")
    cursor_upd.execute('UPDATE municipio SET ds_link = ? WHERE cd_municipio = ?', (remover_acentos(municipio[1]).lower().replace(" ", "-"), municipio[0], ))

conexao.commit()
cursor_upd.close()
cursor.close()

print "# script SQL normalizador"
cursor = conexao.cursor()
cursor.executescript(open(os.getcwd()+'/ddl/normalizador.sql').read())
cursor.close()

print "Criando INDICES"
cursor = conexao.cursor()
cursor.executescript(open(os.getcwd()+'/ddl/indices.sql').read())
cursor.close()

print "Fechando conexão ao banco"
conexao.close()
