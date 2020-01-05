DROP TABLE IF EXISTS folha_pessoal;
CREATE TABLE folha_pessoal (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  de_poder TEXT, -- campo texto contendo o nome do Poder ou Órgão;
  de_OrgaoLotacao TEXT, -- campo texto contendo o lugar onde o servidor está lotado;
  no_cargo TEXT, -- campo texto para o nome do cargo;
  tp_cargo TEXT, -- campo texto para o tipo do cargo;
  nu_cpf VARCHAR(11), -- campo texto contendo o CPF do servidor, com mascaramento nos 3 primeiros dígitos e nos 2 últimos;
  no_Servidor TEXT, -- campo texto contendo o nome do servidor;
  dt_mesano VARCHAR(6), -- campo texto contendo o mês e ano, na forma MMYYYY;
  dt_Admissao DATE, -- campo data, com o formato DD/MM/YYYY;
  vl_vantagens NUMERIC(12,4) -- campo monetário, contendo o valor do salário bruto, sendo o ponto(.) o separador decimal;
);
