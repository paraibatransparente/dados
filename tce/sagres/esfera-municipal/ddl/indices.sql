-- https://www.sqlite.org/lang_createindex.html
-- CREDOR
CREATE INDEX IF NOT EXISTS idx_credor_cd_credor ON credor (cd_credor);
-- TABELA EMPENHO
CREATE INDEX IF NOT EXISTS idx_empenho_cd_ugestora ON empenho (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_empenho_dt_Ano ON empenho (dt_Ano);
CREATE INDEX IF NOT EXISTS idx_empenho_nu_Licitacao ON empenho (nu_Licitacao);
CREATE INDEX IF NOT EXISTS idx_empenho_nu_Empenho ON empenho (nu_Empenho);
CREATE INDEX IF NOT EXISTS idx_empenho_dt_empenho ON empenho (dt_empenho);
CREATE INDEX IF NOT EXISTS idx_empenho_cd_credor ON empenho (cd_credor);
CREATE INDEX IF NOT EXISTS idx_empenho_nu_Obra ON empenho (nu_Obra);
CREATE INDEX IF NOT EXISTS idx_empenho_cd_municipio ON empenho (cd_municipio);

-- INDICES TEMPORÁRIOS
CREATE INDEX IF NOT EXISTS idx_empenho_de_funcao ON empenho (de_funcao);
CREATE INDEX IF NOT EXISTS idx_empenho_de_Elemento ON empenho (de_Elemento);
CREATE INDEX IF NOT EXISTS idx_empenho_de_tipolicitacao ON empenho (de_tipolicitacao);

CREATE INDEX IF NOT EXISTS idx_empenho_de_Subfuncao ON empenho (de_Subfuncao);
CREATE INDEX IF NOT EXISTS idx_empenho_de_Programa ON empenho (de_Programa);
CREATE INDEX IF NOT EXISTS idx_empenho_de_Acao ON empenho (de_Acao);
CREATE INDEX IF NOT EXISTS idx_empenho_de_CatEconomica ON empenho (de_CatEconomica);
CREATE INDEX IF NOT EXISTS idx_empenho_de_NatDespesa ON empenho (de_NatDespesa);
CREATE INDEX IF NOT EXISTS idx_empenho_de_Modalidade ON empenho (de_Modalidade);


-- ESTORNO
CREATE INDEX IF NOT EXISTS idx_estorno_cd_ugestora ON estorno (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_estorno_dt_Ano ON estorno (dt_Ano);
CREATE INDEX IF NOT EXISTS idx_estorno_nu_Empenho ON estorno (nu_Empenho);
CREATE INDEX IF NOT EXISTS idx_estorno_dt_estorno ON estorno (dt_estorno);
CREATE INDEX IF NOT EXISTS idx_estorno_cd_municipio ON estorno (cd_municipio);
-- FOLHA PESSOAL
CREATE INDEX IF NOT EXISTS idx_folha_pessoal_cd_ugestora ON folha_pessoal (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_folha_pessoal_cd_CPF ON folha_pessoal (cd_CPF);
CREATE INDEX IF NOT EXISTS idx_folha_pessoal_dt_MesAnoReferencia ON folha_pessoal (dt_MesAnoReferencia);
CREATE INDEX IF NOT EXISTS idx_folha_pessoal_cd_municipio ON folha_pessoal (cd_municipio);
-- TABELA PAGAMENTO
CREATE INDEX IF NOT EXISTS idx_pagamento_cd_UGestora ON pagamento (cd_UGestora);
CREATE INDEX IF NOT EXISTS idx_pagamento_dt_ano ON pagamento (dt_ano);
CREATE INDEX IF NOT EXISTS idx_pagamento_nu_Empenho ON pagamento (nu_Empenho);
CREATE INDEX IF NOT EXISTS idx_pagamento_dt_pagamento ON pagamento (dt_pagamento);
CREATE INDEX IF NOT EXISTS idx_pagamento_cd_municipio ON pagamento (cd_municipio);
-- RECEITA ORÇAMENTÁRIA
CREATE INDEX IF NOT EXISTS idx_receita_orcamentaria_cd_ugestora ON receita_orcamentaria (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_receita_orcamentaria_dt_ano ON receita_orcamentaria (dt_ano);
CREATE INDEX IF NOT EXISTS idx_receita_orcamentaria_dt_mesano ON receita_orcamentaria (dt_mesano);
CREATE INDEX IF NOT EXISTS idx_receita_orcamentaria_cd_municipio ON receita_orcamentaria (cd_municipio);
-- UNIDADE GESTORA
CREATE INDEX IF NOT EXISTS idx_unidade_gestora_cd_ugestora ON unidade_gestora (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_unidade_gestora_cd_municipio ON unidade_gestora (cd_municipio);
