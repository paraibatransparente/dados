#!/bin/bash
# script de importação de dados
# Órgão: TCE-PB (Tribunal de Contas do Estado da Paraiba)
# Origem: http://portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb/

echo "###-> Esfera ESTADUAL - Iniciando download dos arquivos"
mkdir esfera-estadual
echo "###-> Receita Orçamentária"
wget http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Receita_Orcamentaria_Esfera_Estadual.txt.gz -P esfera-estadual/
echo "###-> Empenhos"
wget http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Empenhos_Esfera_Estadual.txt.gz -P esfera-estadual/
echo "###-> Folha de Pessoal"
wget http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Folha_Pessoal_Esfera_Estadual.txt.gz -P esfera-estadual/

gunzip esfera-estadual/*.gz
