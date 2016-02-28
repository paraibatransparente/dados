-- https://www.sqlite.org/lang_createindex.html
-- EMPENHO
CREATE INDEX IF NOT EXISTS idx_empenho_cd_ugestora_pb ON credor (cd_ugestora_pb);
CREATE INDEX IF NOT EXISTS idx_empenho_dt_Ano ON credor (dt_Ano);
CREATE INDEX IF NOT EXISTS idx_empenho_nu_Empenho ON credor (nu_Empenho);
CREATE INDEX IF NOT EXISTS idx_empenho_dt_empenho ON credor (dt_empenho);
CREATE INDEX IF NOT EXISTS idx_empenho_cd_Credor ON credor (cd_Credor);
