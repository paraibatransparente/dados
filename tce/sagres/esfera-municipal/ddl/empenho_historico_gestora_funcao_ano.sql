DROP TABLE IF EXISTS empenho_historico_gestora_funcao_ano;
CREATE TABLE empenho_historico_gestora_funcao_ano (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora INTEGER,
  de_funcao TEXT,
  dt_Ano INTEGER,
  vl_total NUMERIC(12,4)
);

/*
CREATE TABLE empenho_historico_gestora_funcao_ano AS
SELECT e.cd_ugestora, e.de_funcao, e.dt_ano, sum(e.vl_Empenho) AS vl_total
  FROM empenho e
 WHERE e.dt_Ano = 2016
   AND e.cd_ugestora = '201095'
 GROUP BY e.cd_ugestora, e.de_funcao, e.dt_ano

SELECT *
 FROM empenho_historico_gestora_funcao_ano
WHERE dt_Ano = 2016
  AND cd_ugestora = '201095';
*/
