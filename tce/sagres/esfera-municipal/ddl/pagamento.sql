DROP TABLE IF EXISTS pagamento;
CREATE TABLE pagamento (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_UGestora INTEGER,
  de_ugestora TEXT,
  dt_Ano INTEGER,
  de_UOrcamentaria TEXT,
  nu_Empenho VARCHAR(10),
  nu_Parcela INTEGER,
  vl_Pagamento NUMERIC(12,4),
  dt_pagamento DATE
);
