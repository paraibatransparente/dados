# -*- coding: utf-8 -*-
import sqlite3 # biblioteca necessária para trabalhar com sqlite3
import gzip # bilioteca para trabalhar com arquivos compactados
import os

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

def transformar(conexao, arquivo, tabela):
    print bcolor.OKBLUE + "###-> TRANSFORMANDO ARQUIVO" + bcolor.ENDC, arquivo
    print "# O arquivo irá gerar a tabela", tabela

    print "# criando cursor para manipulação do banco de dados"
    cursor = conexao.cursor()

    print "# criando estrutura da tabela", tabela
    cursor.executescript(open('tce/sagres/esfera-municipal/ddl/'+tabela+'.sql').read())

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
    for linha in gzip.open('tce/sagres/esfera-municipal/'+arquivo, 'rb'):
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

# conectando ao banco de dados
try:
    conexao = conectar('tce/sagres/esfera-municipal/esfera-municipal.db')
except Exception as e:
    print "Erro ao conectar:", e
    exit()

# iniciando transformação dos arquivos
try:
    transformar(conexao, 'TCE-PB-SAGRES-Receita_Orcamentaria_Esfera_Municipal.txt.gz', 'receita_orcamentaria')
    transformar(conexao, 'TCE-PB-SAGRES-Empenhos_Esfera_Municipal.txt.gz', 'empenho')
    transformar(conexao, 'TCE-PB-SAGRES-Pagamentos_Esfera_Municipal.txt.gz', 'pagamento')
    transformar(conexao, 'TCE-PB-SAGRES-Estornos_Esfera_Municipal.txt.gz', 'estorno')
    transformar(conexao, 'TCE-PB-SAGRES-Folha_Pessoal_Esfera_Municipal.txt.gz', 'folha_pessoal')
except Exception as e:
    print "Erro ao transformar arquivo:", e
    exit()

# fechando conexão ao banco
conexao.close()
