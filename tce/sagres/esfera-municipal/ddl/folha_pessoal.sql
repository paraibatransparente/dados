DROP TABLE IF EXISTS folha_pessoal;
CREATE TABLE folha_pessoal (
  cd_UGestora INTEGER,
  de_ugestora TEXT,
  de_cargo TEXT,
  de_tipocargo TEXT,
  cd_CPF VARCHAR(11),
  dt_MesAnoReferencia VARCHAR(6),
  no_Servidor TEXT,
  de_UOrcamentaria TEXT
);
