DROP TABLE IF EXISTS credor_historico_gestora_funcao_ano;
CREATE TABLE credor_historico_gestora_funcao_ano (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora INTEGER,
  cd_credor VARCHAR(14),
  no_credor TEXT,
  de_Funcao TEXT,
  dt_Ano INTEGER,
  vl_total NUMERIC(12,4)
);

/*
DROP TABLE IF EXISTS credor_historico_gestora_funcao_ano;
CREATE TABLE credor_historico_gestora_funcao_ano AS
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
    p.dt_ano,
    (round(sum(p.vl_Pagamento), 2)) AS vl_pagamento
  FROM empenho e
    JOIN pagamento p ON p.cd_UGestora = e.cd_ugestora
                        AND p.dt_Ano = e.dt_Ano
                        AND p.nu_Empenho = e.nu_Empenho
  WHERE e.dt_Ano IN (2015, 2014, 2013, 2012, 2011)
    AND e.cd_ugestora = '101095'
    AND e.de_Funcao = 'Comunicações'
  GROUP BY e.cd_ugestora
    ,e.cd_credor
    ,e.no_credor
    ,p.dt_ano
)
GROUP BY cd_ugestora, cd_credor, no_Credor
ORDER BY 4 DESC;
*/
