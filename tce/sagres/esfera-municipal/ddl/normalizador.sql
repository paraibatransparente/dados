-- SCRIPT NORMALIZADOR
-- CRIAÇÃO DO CAMPO id para FUNCAO
/*
ALTER TABLE empenho ADD funcao_id INTEGER;
UPDATE empenho SET funcao_id = (SELECT f.id FROM funcao f WHERE f.de_Funcao = de_Funcao);
*/

-- CRIAÇÃO DO CAMPO TIPO DE UNIDADE GESTORA
ALTER TABLE unidade_gestora ADD cd_tipo_unidade_gestora VARCHAR(3);
UPDATE unidade_gestora SET cd_tipo_unidade_gestora = SUBSTR(cd_ugestora, 1, 3);

-- CRIAÇÃO DO CAMPO MUNICIPIO A PARTIR DA UNIDADE GESTORA
ALTER TABLE unidade_gestora ADD cd_municipio VARCHAR(3);
UPDATE unidade_gestora SET cd_municipio = SUBSTR(cd_ugestora, 4, 6);

-- ALTER TABLE receita_orcamentaria ADD cd_municipio VARCHAR(3);
UPDATE receita_orcamentaria SET cd_municipio = SUBSTR(cd_ugestora, 4, 6);

-- ALTER TABLE estorno ADD cd_municipio VARCHAR(3);
UPDATE estorno SET cd_municipio = SUBSTR(cd_ugestora, 4, 6);

ALTER TABLE empenho ADD cd_municipio VARCHAR(3);
UPDATE empenho SET cd_municipio = SUBSTR(cd_ugestora, 4, 6);

ALTER TABLE pagamento ADD cd_municipio VARCHAR(3);
UPDATE pagamento SET cd_municipio = SUBSTR(cd_ugestora, 4, 6);

ALTER TABLE folha_pessoal ADD cd_municipio VARCHAR(3);
UPDATE folha_pessoal SET cd_municipio = SUBSTR(cd_ugestora, 4, 6);

