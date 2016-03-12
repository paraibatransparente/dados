# Dados

Existe uma quantidade enorme de dados públicos disponibilizados para dowmnload
pelos orgãos de controle federal, estadual e municipal. São dados dos três
poderes (executivo, legislativo e judiciário) que passaram a ser
disponibilizados abertamente com a promulgação da
[Lei da Transparência][lei-131/2009].

Criamos o script **tomando-a-pilula-vermelha** que realiza a importação destes
dados. É possível pode criar combinações de dados oriundos de diferentes órgãos
dos três poderes.


## Tomando a pílula vermelha

![](docs/images/matriz-pill.jpg)

Certifique-se de possuir espaço suficiente em disco antes de realizar o
download. Iremos procurar informar o tamanho aproximado de cada download.

### Requisitos

 * [Python][python] >= 2.7
 * [SQLite 3][sqllite]


### Executando

```bash
python tomando-a-pilula-vermelha
```


## Dados que já são importados

Ajude a implementar a importação destes dados.

**Tribunal de Contas do Estado da Paraíba**

*Origem: [portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb][sagres-tcepb]*

 * [x] Esfera Estadual;
 * [x] Esfera Municipal;

**Controladoria Geral da União - Governo Federal**

*Origem: [transparencia.gov.br/downloads][transparencia]*

 * [ ] Despesas
 * [ ] Receitas
 * [ ] Convênios
 * [ ] Sanções
 * [ ] Servidores

**Tribunal Superior Eleitoral**
 * [ ] Prestação de contas de campanha;
 * [ ] Votação nominal por UF e município;
 * [ ] Filiações partidárias;

**Congresso Nacional**
 * [ ] Senado Federal
 * [ ] Câmara dos Deputados
   * [ ] [Deputados][deputados]
   * [ ] Órgãos
   * [ ] Proposições
   * [ ] Sessões/Reuniões
   * [ ] [Cota Parlamentar][cota-parlamentar]


## Licença

[Licença MIT](LICENSE)


[lei-131/2009]: http://www.planalto.gov.br/ccivil_03/leis/lcp/lcp131.htm
[python]: https://www.python.org
[sqllite]: https://www.sqlite.org
[sagres-tcepb]: http://portal.tce.pb.gov.br/dados-abertos-do-sagres-tcepb
[transparencia]: http://transparencia.gov.br/downloads
[deputados]: http://www2.camara.leg.br/transparencia/dados-abertos/dados-abertos-legislativo/webservices/deputados
[cota-parlamentar]: http://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/dados-abertos-cota-parlamentar
