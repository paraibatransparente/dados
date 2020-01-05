DROP TABLE IF EXISTS estorno;
CREATE TABLE estorno (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_UGestora INTEGER, -- campo numérico, inteiro, contendo o identificador da unidade gestora;
  de_ugestora TEXT, -- campo texto, para o nome da unidade gestora;
  dt_Ano INTEGER, -- campo numérico, inteiro, contendo o ano;
  de_UOrcamentaria TEXT, -- campo texto para o nome da unidade orçamentária;
  nu_Empenho INTEGER, -- campo texto para o número do empenho;
  nu_Estorno INTEGER, -- campo texto para o número do estorno;
  dt_estorno DATE, -- campo data, com o formato DD/MM/YYYY;
  vl_Estorno NUMERIC(12,4) -- campo monetário, contendo o valor do estorno, sendo o ponto(.) o separador decimal;
);
