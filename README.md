# Dados

Dados abertos disponibilizados pelos órgãos de controle federal, estadual e
municipal. Existe uma quantidade enorme de informação pública disponível na
internet para download.

São dados dos três poderes (Executivo, Legislativo e Judiciário) que passaram a
ser disponibilizados abertamente com a promulgação da Lei da Transparência
[Lei Complementar 131/2009](http://www.planalto.gov.br/ccivil_03/leis/lcp/lcp131.htm).

## Tomando a pílula

Nós criamos um script mágico que realiza a importação destes dados chamado: [tomando-a-pilula-vermelha.py](tomando-a-pilula-vermelha.py)

Você poderá criar combinações de dados oriundos de diferentes órgãos dos três
poderes certifique-se de possuir espaço suficiente em disco antes de realizar o
download. Iremos procurar informar o tamanho aproximado de cada download.

### Requisitos

 * Python >= 2.7 [python.org](https://www.python.org/)
 * SQLite 3 [sqlite.org](https://www.sqlite.org/)

```bash
sudo apt-get install python
```

### Dados que já são importados

#### Tribunal de Contas do Estado da Paraíba

`Origem: [portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb](http://portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb)`

 * [x] Esfera Estadual;
 * [x] Esfera Municipal;

#### Controladoria Geral da União - Governo Federal

`Origem: [transparencia.gov.br/downloads](http://transparencia.gov.br/downloads)`

 * [ ] Despesas
 * [ ] Receitas
 * [ ] Convênios
 * [ ] Sanções
 * [ ] Servidores

#### Tribunal Superior Eleitoral
 * [ ] Prestação de contas de campanha;
 * [ ] Votação nominal por UF e município;
 * [ ] Filiações partidárias;

#### Congresso Nacional
 * [ ] Senado Federal
 * [ ] Câmara dos Deputados
   * [ ] Deputados [WebService Deputados](http://www2.camara.leg.br/transparencia/dados-abertos/dados-abertos-legislativo/webservices/deputados)
   * [ ] Órgãos
   * [ ] Proposições
   * [ ] Sessões/Reuniões
   * [ ] Cota Parlamentar [Download dos Arquivos](http://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/dados-abertos-cota-parlamentar)

## Contribuição

 Ajude a implementar a importação destes dados.
