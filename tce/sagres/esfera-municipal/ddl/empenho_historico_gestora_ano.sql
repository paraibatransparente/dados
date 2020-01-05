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
      ,(ep2019 - es2019) AS e2019
      ,(ep2018 - es2018) AS e2018
      ,(ep2017 - es2017) AS e2017
      ,(ep2016 - es2016) AS e2016
      ,(ep2015 - es2015) AS e2015
      ,(ep2014 - es2014) AS e2014
      ,(ep2013 - es2013) AS e2013
      ,(ep2012 - es2012) AS e2012
      ,(ep2011 - es2011) AS e2011
      ,(ep2010 - es2010) AS e2010
      ,(ep2009 - es2009) AS e2009
      ,(ep2008 - es2008) AS e2008
      ,(ep2007 - es2007) AS e2007
      ,(ep2006 - es2006) AS e2006
      ,(ep2005 - es2005) AS e2005
      ,(ep2004 - es2004) AS e2004
      ,(ep2003 - es2003) AS e2003
  FROM (
    SELECT
      ug.cd_ugestora,
      ug.cd_tipo_unidade_gestora,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2019
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2019,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2019
         AND e.cd_ugestora = ug.cd_ugestora) AS es2019,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2018
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2018,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2018
         AND e.cd_ugestora = ug.cd_ugestora) AS es2018,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2017
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2017,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2017
         AND e.cd_ugestora = ug.cd_ugestora) AS es2017,
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
             AND e.cd_ugestora = ug.cd_ugestora) AS es2011,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2010
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2010,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2010
         AND e.cd_ugestora = ug.cd_ugestora) AS es2010,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2009
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2009,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2009
         AND e.cd_ugestora = ug.cd_ugestora) AS es2009,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2008
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2008,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2008
         AND e.cd_ugestora = ug.cd_ugestora) AS es2008,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2007
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2007,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2007
         AND e.cd_ugestora = ug.cd_ugestora) AS es2007,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2006
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2006,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2006
         AND e.cd_ugestora = ug.cd_ugestora) AS es2006,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2005
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2005,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2005
         AND e.cd_ugestora = ug.cd_ugestora) AS es2005,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2004
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2004,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2004
         AND e.cd_ugestora = ug.cd_ugestora) AS es2004,
      (SELECT sum(e.vl_Empenho)
       FROM empenho e
       WHERE e.dt_Ano = 2003
         AND e.cd_ugestora = ug.cd_ugestora) AS ep2003,
      (SELECT sum(e.vl_Estorno)
       FROM estorno e
       WHERE e.dt_Ano = 2003
         AND e.cd_ugestora = ug.cd_ugestora) AS es2003
    FROM unidade_gestora ug
   -- WHERE ug.cd_municipio IN ('095', '050', '040', '171', '135', '025', '211', '046')
);
