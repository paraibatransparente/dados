# Repositório de Dados Abertos
Dados abertos disponibilizados pelos órgãos de controle federais, estaduais e municipais

## Requisitos
 * Python >= 2.7 [python.org](https://www.python.org/)
 * SQLite 3 [sqlite.org](https://www.sqlite.org/)

```sh
sudo apt-get install python
```
## Passo 1 - Tomando a pílula vermelha
Se você chegou até aqui já deve saber que existe uma quantidade enorme de informação pública disponível na Internet para download. 
São dados dos três poderes (Executivo, Legislativo e Judiciário) que passaram a ser disponibilizados abertamente com a promulgação da Lei da Transparência [Lei Complementar 131/2009](http://www.planalto.gov.br/ccivil_03/leis/lcp/lcp131.htm).

> Nós criamos um script mágico que realiza a importação destes dados chamado: [tomando-a-pilula-vermelha.py](https://github.com/paraibatransparente/dados/blob/master/tomando-a-pilula-vermelha.py)

Você poderá criar combinações de dados oriundos de diferentes órgãos dos três poderes
Certifique-se de possuir espaço suficiente em disco antes de realizar o download.
Iremos procurar informar o tamanho aproximado de cada download

> Ajude a implementar a importação destes dados.
Acompanhe abaixo que dados já são importados

## Tribunal de Contas do Estado da Paraíba
 * Origem: http://portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb/
 * [x] Esfera Estadual;
 * [x] Esfera Municipal;

## Controladoria Geral da União - Governo Federal
 * Origem: http://transparencia.gov.br/downloads/
 * [ ] Despesas
 * [ ] Receitas
 * [ ] Convênios
 * [ ] Sanções
 * [ ] Servidores

## Tribunal Superior Eleitoral
 * [ ] Prestação de contas de campanha;
 * [ ] Votação nominal por UF e município;
 * [ ] Filiações partidárias;

## Congresso Nacional
 * [ ] Senado Federal
 * [ ] Câmara dos Deputados
   * [ ] Deputados [WebService Deputados](http://www2.camara.leg.br/transparencia/dados-abertos/dados-abertos-legislativo/webservices/deputados)
   * [ ] Órgãos
   * [ ] Proposições
   * [ ] Sessões/Reuniões
   * [ ] Cota Parlamentar [Download dos Arquivos](http://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/dados-abertos-cota-parlamentar)
