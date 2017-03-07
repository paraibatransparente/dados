CREATE INDEX IF NOT EXISTS idx_receita_orcamentaria_cd_ugestora ON receita_orcamentaria (cd_ugestora);
CREATE INDEX IF NOT EXISTS idx_receita_orcamentaria_dt_ano ON receita_orcamentaria (dt_ano);
CREATE INDEX IF NOT EXISTS idx_receita_orcamentaria_cd_municipio ON receita_orcamentaria (cd_municipio);
CREATE INDEX IF NOT EXISTS idx_receita_orcamentaria_de_atualizacaoreceita ON receita_orcamentaria (de_atualizacaoreceita);

DROP TABLE IF EXISTS receita_historico_gestora_ano;
CREATE TABLE receita_historico_gestora_ano AS
SELECT ug.cd_ugestora AS cd_ugestora
      ,ug.cd_tipo_unidade_gestora AS cd_tipo_unidade_gestora
      ,(SELECT round(sum(ro.vl_lancamentoOrc), 2)
        FROM receita_orcamentaria ro
        WHERE ro.cd_UGestora = ug.cd_UGestora
          AND ro.de_atualizacaoreceita = 'Lançamento de receita'
          AND ro.dt_Ano = 2011) AS r2011
      ,(SELECT round(sum(ro.vl_lancamentoOrc), 2)
        FROM receita_orcamentaria ro
        WHERE ro.cd_UGestora = ug.cd_UGestora
          AND ro.de_atualizacaoreceita = 'Lançamento de receita'
          AND ro.dt_Ano = 2012) AS r2012
      ,(SELECT round(sum(ro.vl_lancamentoOrc), 2)
        FROM receita_orcamentaria ro
        WHERE ro.cd_UGestora = ug.cd_UGestora
          AND ro.de_atualizacaoreceita = 'Lançamento de receita'
          AND ro.dt_Ano = 2013) AS r2013
      ,(SELECT round(sum(ro.vl_lancamentoOrc), 2)
        FROM receita_orcamentaria ro
        WHERE ro.cd_UGestora = ug.cd_UGestora
          AND ro.de_atualizacaoreceita = 'Lançamento de receita'
          AND ro.dt_Ano = 2014) AS r2014
      ,(SELECT round(sum(ro.vl_lancamentoOrc), 2)
        FROM receita_orcamentaria ro
        WHERE ro.cd_UGestora = ug.cd_UGestora
          AND ro.de_atualizacaoreceita = 'Lançamento de receita'
          AND ro.dt_Ano = 2015) AS r2015
      ,(SELECT round(sum(ro.vl_lancamentoOrc), 2)
        FROM receita_orcamentaria ro
        WHERE ro.cd_UGestora = ug.cd_UGestora
          AND ro.de_atualizacaoreceita = 'Lançamento de receita'
          AND ro.dt_Ano = 2016) AS r2016
  FROM unidade_gestora ug
 -- WHERE ug.cd_municipio IN ('095', '050', '040', '171', '135', '025', '211', '046')
 GROUP BY ug.de_ugestora;
