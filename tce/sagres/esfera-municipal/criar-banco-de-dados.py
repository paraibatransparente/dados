# -*- coding: utf-8 -*-
import sqlite3 # biblioteca necessária para trabalhar com sqlite3

print "Criando tabela de estornos"
# leitura do arquivo de estornos
estornos = open('TCE-PB-SAGRES-Estornos_Esfera_Municipal.txt')
cont_linhas = 1

# abrindo conexão com o banco de Dados
conn = sqlite3.connect('esfera-municipal.db')
# configuração necessária para trabalhar com unicode
conn.text_factory = str

# criando cursor para manipulação do banco de dados
cur = conn.cursor()

# lendo arquivo texto com estrutura da tabela de estornos
ddl_estorno = open('ddl/estorno.sql').read()
cur.execute('DROP TABLE IF EXISTS estorno;')
cur.execute(ddl_estorno)

for linha in estornos:
    if cont_linhas > 1: # pulando o cabeçalho do arquivo
        # transformando linhas em lista de valores para inserir no banco
        colunas = linha.strip().split("|")
        # inserindo dados no banco
        cur.executemany('INSERT INTO estorno VALUES (?, ?, ?, ?, ?, ?, ?, ?)', (colunas, ))
    # incrementando contador de linhas
    cont_linhas = cont_linhas + 1

print "Total de linhas lidas:", cont_linhas - 1
cur.execute('SELECT count(1) FROM estorno')
qt_linhas = cur.fetchone()
print "Total de linhas inseridas:", qt_linhas[0]
