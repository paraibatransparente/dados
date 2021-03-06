DROP TABLE IF EXISTS pagamento_historico_gestora_elemento_ano;
CREATE TABLE pagamento_historico_gestora_elemento_ano (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora INTEGER,
  de_elemento TEXT,
  dt_Ano INTEGER,
  vl_total NUMERIC(12,4)
);

/*
CREATE TABLE pagamento_historico_gestora_elemento_ano AS
SELECT e.cd_ugestora, e.de_elemento, p.dt_ano, (round(sum(p.vl_Pagamento), 2)) AS vl_total
  FROM empenho e
  JOIN pagamento p on p.cd_UGestora = e.cd_ugestora
    and p.dt_Ano = e.dt_Ano
    and p.nu_Empenho = e.nu_Empenho
 WHERE e.dt_Ano = 2013
   AND e.cd_ugestora = '201095'
 GROUP BY e.cd_ugestora, e.de_elemento, p.dt_ano;

SELECT *
 FROM pagamento_historico_gestora_elemento_ano
WHERE dt_Ano = 2013
  AND cd_ugestora = '201095';
*/
