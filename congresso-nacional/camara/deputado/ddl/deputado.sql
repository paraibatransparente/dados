-- Arquivo origem: http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados
DROP TABLE IF EXISTS deputado;
CREATE TABLE deputado (
  ide_cadastro INTEGER PRIMARY KEY NOT NULL,
  condicao VARCHAR(50) NOT NULL,
  nome VARCHAR(200) NOT NULL,
  nome_parlamentar VARCHAR(200) NOT NULL,
  url_foto TEXT,
  sexo VARCHAR(20),
  uf VARCHAR(2),
  partido VARCHAR(10),
  gabinete VARCHAR(10),
  anexo VARCHAR(10),
  fone TEXT,
  email TEXT
);
