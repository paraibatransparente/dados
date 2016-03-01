DROP TABLE IF EXISTS pagamento_historico_gestora_ano;
CREATE TABLE pagamento_historico_gestora_ano AS
SELECT ug.cd_ugestora AS cd_ugestora
      ,ug.cd_tipo_unidade_gestora AS cd_tipo_unidade_gestora
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2003) AS '2003'
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2004) AS '2004'
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2005) AS '2005'
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2006) AS '2006'
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2007) AS '2007'
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2008) AS '2008'
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2009) AS '2009'
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2010) AS '2010'
      ,(SELECT round(sum(vl_Pagamento), 2)
          FROM pagamento
         WHERE cd_UGestora = ug.cd_UGestora
           AND dt_Ano = 2011) AS '2011'
      ,(SELECT round(sum(vl_Pagamento), 2)
        FROM pagamento
        WHERE cd_UGestora = ug.cd_UGestora
          AND dt_Ano = 2012) AS '2012'
      ,(SELECT round(sum(vl_Pagamento), 2)
        FROM pagamento
        WHERE cd_UGestora = ug.cd_UGestora
          AND dt_Ano = 2013) AS '2013'
      ,(SELECT round(sum(vl_Pagamento), 2)
        FROM pagamento
        WHERE cd_UGestora = ug.cd_UGestora
          AND dt_Ano = 2014) AS '2014'
  FROM unidade_gestora ug
 -- WHERE ug.cd_tipo_unidade_gestora = '201'
 GROUP BY ug.de_ugestora;
