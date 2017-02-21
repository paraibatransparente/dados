DROP TABLE IF EXISTS receita_orcamentaria;
CREATE TABLE receita_orcamentaria (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_Receita TEXT,
  de_Receita TEXT,
  de_AtualizacaoReceita TEXT,
  dt_MesAno VARCHAR(6),
  vl_LancamentoOrc NUMERIC(12,4),
  dt_ano INTEGER
);
