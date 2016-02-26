DROP TABLE IF EXISTS receita_orcamentaria;
CREATE TABLE receita_orcamentaria (
  cd_ugestora INTEGER,
  de_ugestora TEXT,
  dt_ano INTEGER,
  de_receitaOrcUg TEXT,
  de_atualizacaoreceita TEXT,
  vl_lancamentoOrc NUMERIC(12,4),
  dt_mesano VARCHAR(6)
);
