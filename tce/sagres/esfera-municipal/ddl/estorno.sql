DROP TABLE IF EXISTS estorno;
CREATE TABLE estorno (
  cd_UGestora INTEGER,
  de_ugestora TEXT,
  dt_Ano INTEGER,
  de_UOrcamentaria TEXT,
  nu_Empenho INTEGER,
  nu_Estorno INTEGER,
  dt_estorno DATE,
  vl_Estorno NUMERIC(12,4)
);
