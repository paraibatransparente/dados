DROP TABLE IF EXISTS folha_pessoal;
CREATE TABLE folha_pessoal (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_UGestora INTEGER, -- campo numérico, inteiro, contendo o identificador da unidade gestora;
  de_ugestora TEXT, -- campo texto para o nome da unidade gestora;
  de_cargo TEXT, -- campo texto para o nome do cargo;
  de_tipocargo TEXT, -- campo texto para o tipo do cargo;
  cd_CPF VARCHAR(11), -- campo texto contendo o CPF do servidor, com mascaramento nos 3 primeiros dígitos e nos 2 últimos;
  dt_MesAnoReferencia VARCHAR(6), -- campo texto contendo o mês e ano, na forma MMYYYY;
  no_Servidor TEXT, -- campo texto contendo o nome do servidor;
  vl_vantagens NUMERIC(12,4), -- campo monetário, contendo o valor do salário bruto, sendo o ponto(.) o separador decimal;
  de_UOrcamentaria TEXT -- campo texto para o nome da unidade orçamentária;
);
