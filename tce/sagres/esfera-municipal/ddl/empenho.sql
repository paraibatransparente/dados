DROP TABLE IF EXISTS empenho;
CREATE TABLE empenho (
  cd_ugestora INTEGER,
  de_ugestora TEXT,
  dt_Ano INTEGER,
  de_UOrcamentaria TEXT,
  de_Funcao TEXT,
  de_Subfuncao TEXT,
  de_Programa TEXT,
  de_Acao TEXT,
  de_CatEconomica TEXT,
  de_NatDespesa TEXT,
  de_Modalidade TEXT,
  de_Elemento TEXT,
  de_tipolicitacao TEXT,
  nu_Licitacao VARCHAR(9),
  nu_Empenho VARCHAR(10),
  dt_empenho DATE,
  vl_Empenho NUMERIC(12,4),
  cd_credor VARCHAR(14),
  no_Credor TEXT,
  de_Historico TEXT,
  nu_Obra VARCHAR(8)
);
