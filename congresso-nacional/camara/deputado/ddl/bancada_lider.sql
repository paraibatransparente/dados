-- Arquivo origem: http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterLideresBancadas
DROP TABLE IF EXISTS bancada_lider;
CREATE TABLE bancada_lider (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  bancada_id INTEGER NOT NULL,
  is_lider BOOLEAN DEFAULT FALSE,
  nome VARCHAR(200) NOT NULL,
  ide_cadastro INTEGER NOT NULL,
  partido VARCHAR(10) NOT NULL,
  uf VARCHAR(2) NOT NULL
  FOREIGN KEY bancada_id REFERENCES bancada (id)
);
