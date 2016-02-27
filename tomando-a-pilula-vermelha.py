# -*- coding: utf-8 -*-
import os
from subprocess import call

"""
Script de importação de dados

Como funciona:
1 - Servidor de dados do órgão público é acessado e os arquivos são baixados
2 - Os arquivos baixados são transformados em bases de dados sqlite3 http://sqlite.org

@author Diego Nobre <dcnobre@gmail.com>
@since 27/02/2016

# Órgãos implementados
## Órgão: TCE-PB (Tribunal de Contas do Estado da Paraiba)
##-> Origem: http://portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb/
"""

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

print bcolor.BOLD + "### INFORME O ÓRGÃO QUE TERÁ OS DADOS IMPORTADOS ###" + bcolor.ENDC
print "# 1 - Tribunal de Contas do Estado da Paraíba (TCE-PB) [tamanho aprox. 20 GB]"
print bcolor.FAIL + "# X - Tribunal de Contas da União (não implementado)" + bcolor.ENDC
print bcolor.FAIL + "# X - Câmara dos Deputados (não implementado)" + bcolor.ENDC
print bcolor.FAIL + "# X - Senado Federal (não implementado)" + bcolor.ENDC
print "# 0 - TODOS [tamanho aprox. 20 GB]"
print bcolor.WARNING + "#-> Exitem itens não implementados. Acesse http://github.com/paraibatransparente/dados e colabore!" + bcolor.ENDC

opcao = input('#-> Informe opção:')

if opcao in [1,0]:
    print bcolor.OKBLUE + "### INICIANDO IMPORTAÇÃO DOS DADOS DO TRIBUNAL DE CONTAS DA PARAÍBA ###" + bcolor.ENDC
    print bcolor.UNDERLINE + "###########################################################" + bcolor.ENDC
    print bcolor.UNDERLINE + "###-> ESFERA MUNICIPAL - Iniciando download de arquivos ###" + bcolor.ENDC
    path_esfera_municipal = 'tce/sagres/esfera-municipal/'

    if not os.path.exists(path_esfera_municipal):
        os.mkdirs(path_esfera_municipal)

    print bcolor.BOLD + "#-> Receita Orçamentária" + bcolor.ENDC
    call(["wget", "http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Receita_Orcamentaria_Esfera_Municipal.txt.gz", "-P", path_esfera_municipal])

    print bcolor.BOLD + "#-> Estornos" + bcolor.ENDC
    #urllib.urlretrieve("http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Estornos_Esfera_Municipal.txt.gz", filename=path_esfera_municipal+"TCE-PB-SAGRES-Estornos_Esfera_Municipal.txt.gz")
    call(["wget", "http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Estornos_Esfera_Municipal.txt.gz", "-P", path_esfera_municipal])

    print bcolor.BOLD + "#-> Empenhos" + bcolor.ENDC
    call(["wget", "http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Empenhos_Esfera_Municipal.txt.gz", "-P", path_esfera_municipal])

    print bcolor.BOLD + "#-> Pagamentos" + bcolor.ENDC
    call(["wget", "http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Pagamentos_Esfera_Municipal.txt.gz", "-P", path_esfera_municipal])

    print bcolor.BOLD + "#-> Folha de Pessoal" + bcolor.ENDC
    call(["wget", "http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Folha_Pessoal_Esfera_Municipal.txt.gz", "-P", path_esfera_municipal])

    # ESFERA ESTADUAL
    print bcolor.UNDERLINE + "##########################################################" + bcolor.ENDC
    print bcolor.UNDERLINE + "###-> ESFERA ESTADUAL - Iniciando download de arquivos ###" + bcolor.ENDC
    path_esfera_estadual = 'tce/sagres/esfera-estadual/'

    if not os.path.exists(path_esfera_estadual):
        os.mkdirs(path_esfera_estadual)

    print bcolor.BOLD + "#-> Receita Orçamentária" + bcolor.ENDC
    call(["wget", "http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Receita_Orcamentaria_Esfera_Estadual.txt.gz", "-P", path_esfera_estadual])
    print bcolor.BOLD + "#-> Empenhos" + bcolor.ENDC
    call(["wget", "http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Empenhos_Esfera_Estadual.txt.gz", "-P", path_esfera_estadual])
    print bcolor.BOLD + "#-> Folha de Pessoal" + bcolor.ENDC
    call(["wget", "http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Folha_Pessoal_Esfera_Estadual.txt.gz", "-P", path_esfera_estadual])

    print bcolor.OKBLUE + "#-> Iniciando criação da base de dados SQLITE" + bcolor.ENDC
    execfile(os.getcwd()+'/tce/sagres/criar-banco-de-dados.py')
else:
    print bcolor.FAIL + "Opção inválida: " + bcolor.ENDC, opcao
    exit()
