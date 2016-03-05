-- Arquivo origem: http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterPartidosCD
DROP TABLE IF EXISTS partido.sql;
CREATE TABLE partido (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  id_partido VARCHAR(10) NOT NULL,
  sigla_partido VARCHAR(10) NOT NULL,
  nome_partido VARCHAR(100) NOT NULL,
  data_criacao DATE,
  data_extincao DATE
);
