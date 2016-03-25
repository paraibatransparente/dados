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
  FROM unidade_gestora ug
-- WHERE ug.cd_tipo_unidade_gestora = '201'
 GROUP BY ug.de_ugestora;
