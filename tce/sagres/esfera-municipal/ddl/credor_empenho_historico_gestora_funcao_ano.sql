DROP TABLE IF EXISTS credor_empenho_historico_gestora_funcao_ano;
CREATE TABLE credor_empenho_historico_gestora_funcao_ano (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora INTEGER,
  cd_credor VARCHAR(14),
  no_credor TEXT,
  de_Funcao TEXT,
  dt_Ano INTEGER,
  vl_total NUMERIC(12,4)
);

/*
DROP TABLE IF EXISTS credor_empenho_historico_gestora_funcao_ano;
CREATE TABLE credor_empenho_historico_gestora_funcao_ano AS
SELECT cd_ugestora
   ,cd_credor
  ,no_Credor
  ,sum((CASE WHEN dt_ano = 2015 THEN vl_Pagamento ELSE 0 END)) AS a2015
  ,sum((CASE WHEN dt_ano = 2014 THEN vl_Pagamento ELSE 0 END)) AS a2014
  ,sum((CASE WHEN dt_ano = 2013 THEN vl_Pagamento ELSE 0 END)) AS a2013
  ,sum((CASE WHEN dt_ano = 2012 THEN vl_Pagamento ELSE 0 END)) AS a2012
  ,sum((CASE WHEN dt_ano = 2011 THEN vl_Pagamento ELSE 0 END)) AS a2011
FROM (
    SELECT
        e.cd_ugestora,
        e.cd_credor,
        e.no_credor,
        e.de_funcao,
        e.dt_ano,
        (round(sum(e.vl_Empenho), 2)) AS vl_empenho
      FROM empenho e
     WHERE e.dt_Ano IN (2016)
       AND e.cd_ugestora = '201095'
     GROUP BY e.cd_ugestora
             ,e.cd_credor
             ,e.no_credor
             ,e.de_funcao
             ,e.dt_ano
)
GROUP BY cd_ugestora, cd_credor, no_Credor
ORDER BY 4 DESC;
*/