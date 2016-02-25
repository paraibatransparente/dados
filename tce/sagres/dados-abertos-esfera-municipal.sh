#!/bin/bash
# script de importação de dados
# Órgão: TCE-PB (Tribunal de Contas do Estado da Paraiba)
# Origem: http://portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb/

echo "###-> ESFERA MUNICIPAL - Iniciando download de arquivos"
mkdir esfera-municipal
echo "###-> Receita Orçamentária"
wget http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Receita_Orcamentaria_Esfera_Municipal.txt.gz -P esfera-municipal/
echo "###-> Empenhos"
wget http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Empenhos_Esfera_Municipal.txt.gz -P esfera-municipal/
echo "###-> Pagamentos"
wget http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Pagamentos_Esfera_Municipal.txt.gz -P esfera-municipal/
echo "###-> Estornos"
wget http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Estornos_Esfera_Municipal.txt.gz -P esfera-municipal/
echo "###-> Folha de Pessoal"
get http://dados.tce.pb.gov.br/TCE-PB-SAGRES-Folha_Pessoal_Esfera_Municipal.txt.gz -P esfera-municipal/

gunzip esfera-municipal/*.gz
