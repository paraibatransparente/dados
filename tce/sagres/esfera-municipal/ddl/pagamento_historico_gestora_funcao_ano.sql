DROP TABLE IF EXISTS pagamento_historico_gestora_funcao_ano;
CREATE TABLE pagamento_historico_gestora_funcao_ano (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora INTEGER,
  de_funcao TEXT,
  dt_Ano INTEGER,
  vl_total_gestora_funcao_ano NUMERIC(12,4)
);

/*
CREATE TABLE pagamento_historico_gestora_funcao_ano AS
SELECT e.cd_ugestora, e.de_funcao, p.dt_ano, sum(p.vl_Pagamento) AS vl_total_gestora_funcao_ano
  FROM empenho e
  JOIN pagamento p on p.cd_UGestora = e.cd_ugestora
       AND p.dt_Ano = e.dt_Ano
       AND p.nu_Empenho = e.nu_Empenho
 WHERE e.dt_Ano = 2016
   AND e.cd_ugestora = '201095'
 GROUP BY e.cd_ugestora, e.de_funcao, p.dt_ano

SELECT *
 FROM pagamento_historico_gestora_funcao_ano
WHERE dt_Ano = 2013
  AND cd_ugestora = '201095';
*/
