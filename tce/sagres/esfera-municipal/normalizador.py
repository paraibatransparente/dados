# -*- coding: utf-8 -*-
import sqlite3 # biblioteca necessária para trabalhar com sqlite3
import os

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

cursor.close()
cursor_insert.close()
conexao.commit()

print "# criando estrutura da tabela CREDOR"
cursor = conexao.cursor()
cursor_insert = conexao.cursor()
cursor.executescript(open(os.getcwd()+'/ddl/credor.sql').read())

print "# loop sobre os credores da tabela empenho"
for credor in (cursor.execute('SELECT DISTINCT cd_credor, no_credor FROM empenho')):
    #print str(credor[0]) + ";" + credor[1]
    cursor_insert.executemany('INSERT INTO credor VALUES (NULL, ?, ?)', (credor, ))

cursor.close()
cursor_insert.close()
conexao.commit()

conexao.close()
