# -*- coding: utf-8 -*-
import sqlite3 # biblioteca necessária para trabalhar com sqlite3
import gzip # bilioteca para trabalhar com arquivos compactados
import os
import sys

"""
Classe utilizada para colorir saída do terminal
@see http://stackoverflow.com/questions/287871/print-in-terminal-with-colors-using-python
"""
class bcolor:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def conectar(path_banco):
    # abrindo conexão com o banco de Dados
    conexao = sqlite3.connect(path_banco)
    # configuração necessária para trabalhar com unicode
    conexao.text_factory = str

    return conexao

def transformar(conexao, esfera, arquivo, tabela):
    print bcolor.OKBLUE + "###-> TRANSFORMANDO ARQUIVO" + bcolor.ENDC, arquivo
    print "# O arquivo irá gerar a tabela", tabela

    print "# criando cursor para manipulação do banco de dados"
    cursor = conexao.cursor()

    print "# criando estrutura da tabela", tabela
    cursor.executescript(open(os.getcwd()+'/esfera-'+esfera+'/ddl/'+tabela+'.sql').read())

    # lendo quantidade de colunas da tabela
    # @see https://pagehalffull.wordpress.com/2012/11/14/python-script-to-count-tables-columns-and-rows-in-sqlite-database/
    tableInfo = "PRAGMA table_info(%s)" % tabela
    cursor.execute(tableInfo)
    qt_colunas_tabela = len(cursor.fetchall()) - 1

    # texto do INSERT na tabela
    # exemplo: INSERT INTO estorno VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    tx_insert = 'INSERT INTO '+tabela+' VALUES (NULL, '
    for i in range(qt_colunas_tabela):
        if i != max(range(qt_colunas_tabela)):
            tx_insert = tx_insert + '?, '
        else:
            tx_insert = tx_insert + '?)'

    print bcolor.UNDERLINE + "# iniciando leitura do arquivo..." + bcolor.ENDC
    cont_linhas = 1
    for linha in gzip.open(os.getcwd()+'/esfera-'+esfera+'/'+arquivo, 'rb'):
        if cont_linhas > 1: # pulando o cabeçalho do arquivo
            # transformando linhas em lista de valores para inserir no banco
            colunas = linha.strip().split("|")

            # inserindo dados no banco
            cursor.executemany(tx_insert, (colunas, ))
        # incrementando contador de linhas
        cont_linhas = cont_linhas + 1

    # salvando alterações
    conexao.commit()

    linhas_lidas = cont_linhas - 2 # remove cabeçalho e ultimo add do loop
    #print "Total de linhas lidas:", linhas_lidas
    cursor.execute('SELECT count(1) FROM '+tabela)
    qt_linhas = cursor.fetchone()
    #print "Total de linhas inseridas:", qt_linhas[0]

    if qt_linhas[0] != linhas_lidas:
        print bcolor.WARNING + "#-> O total de linhas lidas ("+linhas_lidas+") não bate com as inseridas ("+qt_linhas[0]+")" + bcolor.ENDC + '\n'
    else:
        print bcolor.OKGREEN + "#-> Arquivo transformando com sucesso!" + bcolor.ENDC + '\n'

# parâmetro passado via linha de comando
esfera = sys.argv[1]
if esfera not in ['municipal', 'estadual']:
    print "Esfera invalida! Informe esfera estadual ou municipal em letras minusculas"
    exit()

# conectando ao banco de dados
try:
    conexao = conectar(os.getcwd()+'/esfera-'+esfera+'/esfera-'+esfera+'.db')
except Exception as e:
    print "Erro ao conectar:", e
    exit()

list_esfera_municipal = [
    ['TCE-PB-SAGRES-Receita_Orcamentaria_Esfera_Municipal.txt.gz', 'receita_orcamentaria'],
    ['TCE-PB-SAGRES-Empenhos_Esfera_Municipal.txt.gz', 'empenho'],
    ['TCE-PB-SAGRES-Pagamentos_Esfera_Municipal.txt.gz', 'pagamento'],
    ['TCE-PB-SAGRES-Estornos_Esfera_Municipal.txt.gz', 'estorno'],
    ['TCE-PB-SAGRES-Folha_Pessoal_Esfera_Municipal.txt.gz', 'folha_pessoal']
]

list_esfera_estadual = [
    ['TCE-PB-SAGRES-Receita_Orcamentaria_Esfera_Estadual.txt.gz', 'receita_orcamentaria'],
    ['TCE-PB-SAGRES-Empenhos_Esfera_Estadual.txt.gz', 'empenho'],
    ['TCE-PB-SAGRES-Folha_Pessoal_Esfera_Estadual.txt.gz', 'folha_pessoal']
]

# iniciando transformação dos arquivos
try:
    if esfera == 'municipal':
        for arquivo in list_esfera_municipal:
            transformar(conexao, esfera, arquivo[0], arquivo[1])
    else:
        for arquivo in list_esfera_estadual:
            transformar(conexao, esfera, arquivo[0], arquivo[1])
except Exception as e:
    print "Erro ao transformar arquivo:", e
    exit()

# fechando conexão ao banco
conexao.close()
