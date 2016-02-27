DROP TABLE IF EXISTS empenho;
CREATE TABLE empenho (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora_pb INTEGER,
  de_ugestora_pb TEXT,
  dt_Ano INTEGER,
  de_UnidOrcamentaria TEXT,
  de_Funcao TEXT,
  de_Subfuncao TEXT,
  de_Programa TEXT,
  de_Acao TEXT,
  de_CatEconomica TEXT,
  de_NatDespesa TEXT,
  de_Modalidade TEXT,
  de_Elemento TEXT,
  de_tipoLicitacao TEXT,
  nu_Empenho VARCHAR(10),
  dt_empenho DATE,
  vl_Empenho NUMERIC(12,4),
  vl_Pagto NUMERIC(12,4),
  de_Historico TEXT,
  cd_Credor VARCHAR(14),
  no_Credor TEXT
);
