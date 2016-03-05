-- Arquivo origem: http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterLideresBancadas
DROP TABLE IF EXISTS bancada;
CREATE TABLE bancada (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  sigla VARCHAR (100) NOT NULL,
  nome TEXT
);
