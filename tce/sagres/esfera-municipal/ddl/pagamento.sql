DROP TABLE IF EXISTS pagamento;
CREATE TABLE pagamento (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_UGestora INTEGER, -- campo numérico, inteiro, contendo o identificador da unidade gestora;
  de_ugestora TEXT, -- campo texto, para o nome da unidade gestora;
  dt_Ano INTEGER, -- campo numérico, inteiro, contendo o ano;
  de_UOrcamentaria TEXT, -- campo texto para o nome da unidade orçamentária;
  nu_Empenho VARCHAR(10), -- campo texto contendo o número do empenho;
  nu_Parcela INTEGER, -- campo texto para o número da parcela;
  vl_Pagamento NUMERIC(12,4), -- campo monetário, contendo o valor do pagamento, sendo o ponto(.) o separador decimal;
  dt_pagamento DATE, -- campo data, com o formato DD/MM/YYYY;
  cd_conta TEXT, -- campo texto contendo o número da conta;
  cd_agencia TEXT, -- campo texto contendo o número da agência;
  nu_chequepag INTEGER, -- campo texto para o número do cheque;
  vl_retencao NUMERIC(12,4), -- campo monetário, contendo o valor da retenção, sendo o ponto(.) o separador decimal;
  tp_contabancaria TEXT, -- tipo da conta bancária;
  de_contabancaria TEXT, -- descrição do tipo da conta bancária;
  de_conta TEXT -- descrição da conta;
);
