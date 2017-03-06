CREATE INDEX IF NOT EXISTS idx_empenho_cd_ugestora ON empenho (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_empenho_dt_Ano ON empenho (dt_Ano);
CREATE INDEX IF NOT EXISTS idx_empenho_cd_municipio ON empenho (cd_municipio);

CREATE INDEX IF NOT EXISTS idx_estorno_cd_ugestora ON estorno (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_estorno_dt_Ano ON estorno (dt_Ano);
CREATE INDEX IF NOT EXISTS idx_estorno_cd_municipio ON estorno (cd_municipio);

DROP TABLE IF EXISTS empenho_historico_gestora_ano;
CREATE TABLE empenho_historico_gestora_ano AS
SELECT cd_ugestora
      ,cd_tipo_unidade_gestora
      ,(ep2016 - es2016) AS e2016
      ,(ep2015 - es2015) AS e2015
      ,(ep2014 - es2014) AS e2014
      ,(ep2013 - es2013) AS e2013
      ,(ep2012 - es2012) AS e2012
      ,(ep2011 - es2011) AS e2011
  FROM (
    SELECT
      ug.cd_ugestora,
      ug.cd_tipo_unidade_gestora,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2016
             AND e.cd_ugestora = ug.cd_ugestora) AS ep2016,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2016
             AND e.cd_ugestora = ug.cd_ugestora) AS es2016,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2015
             AND e.cd_ugestora = ug.cd_ugestora) AS ep2015,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2015
             AND e.cd_ugestora = ug.cd_ugestora) AS es2015,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2014
             AND e.cd_ugestora = ug.cd_ugestora) AS ep2014,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2014
             AND e.cd_ugestora = ug.cd_ugestora) AS es2014,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2013
             AND e.cd_ugestora = ug.cd_ugestora) AS ep2013,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2013
             AND e.cd_ugestora = ug.cd_ugestora) AS es2013,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2012
             AND e.cd_ugestora = ug.cd_ugestora) AS ep2012,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2012
             AND e.cd_ugestora = ug.cd_ugestora) AS es2012,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2011
             AND e.cd_ugestora = ug.cd_ugestora) AS ep2011,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2011
             AND e.cd_ugestora = ug.cd_ugestora) AS es2011
    FROM unidade_gestora ug
   WHERE ug.cd_municipio IN ('095', '050', '040', '171', '135', '025', '211', '046')
);
