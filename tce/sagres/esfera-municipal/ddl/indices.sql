-- https://www.sqlite.org/lang_createindex.html
-- CREDOR
CREATE INDEX IF NOT EXISTS idx_credor_cd_credor ON credor (cd_credor);

-- UNIDADE GESTORA
CREATE INDEX IF NOT EXISTS idx_unidade_gestora_cd_ugestora ON unidade_gestora (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_unidade_gestora_cd_municipio ON unidade_gestora (cd_municipio);
CREATE INDEX IF NOT EXISTS idx_unidade_gestora_cd_tipo_unidade_gestora ON unidade_gestora (cd_tipo_unidade_gestora);
