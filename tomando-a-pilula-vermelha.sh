#!/bin/bash
# script de importação de dados
# Órgão: TCE-PB (Tribunal de Contas do Estado da Paraiba)
# Origem: http://portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb/

# download dos dados
echo "Iniciando download dos dados (Esfera Municipal e Estadual)"
tce/sagres/dados-abertos-esfera-municipal.sh
tce/sagres/dados-abertos-esfera-estadual.sh
