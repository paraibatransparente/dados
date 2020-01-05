DROP TABLE IF EXISTS empenho;
CREATE TABLE empenho (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora INTEGER, -- campo numérico, inteiro, contendo o identificador da unidade gestora;
  de_ugestora TEXT, -- campo texto, para o nome da unidade gestora;
  dt_Ano INTEGER, -- campo numérico, inteiro, para o ano;
  de_uorcamentaria TEXT, -- campo texto para o nome da unidade orçamentária;
  de_Funcao TEXT, -- campo texto para a função;
  de_Subfuncao TEXT, -- campo texto para a subfunção;
  de_Programa TEXT, -- campo texto para o programa;
  de_Acao TEXT, -- campo texto para a ação;
  de_CatEconomica TEXT, -- campo texto para a categoria econômica;
  de_NatDespesa TEXT, -- campo texto para natureza da despesa;
  de_Modalidade TEXT, -- campo texto para a modalidade;
  cd_Elemento TEXT, -- campo texto para o código do elemento;
  de_Elemento TEXT, -- campo texto para o elemento;
  cd_subElemento TEXT, -- campo texto para o código do subelemento, relativo ao ano;
  de_subElemento TEXT, -- campo texto para o subelemento, relativo ao ano;
  de_tipoLicitacao TEXT, -- campo texto para o tipo de licitação;
  nu_licitacao TEXT, -- campo texto para o número da licitação;
  nu_Empenho VARCHAR(10), -- campo texto para o número do empenho;
  dt_empenho DATE, -- campo data, com o formato YYYY-MM-DD;
  vl_Empenho NUMERIC(12,4), -- campo monetário, contendo o valor do empenho, sendo o ponto(.) o separador decimal;
  cd_Credor VARCHAR(14), -- campo texto contendo o CPF ou CNPJ do credor;
  no_Credor TEXT, -- campo texto contendo o nome do credor;
  de_Historico TEXT, -- campo texto para o histórico;
  vl_Pagto NUMERIC(12,4) -- campo monetário, contendo o valor do pagamento, sendo o ponto(.) o separador decimal;
);
