DROP TABLE IF EXISTS unidade_gestora;
CREATE TABLE unidade_gestora (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora VARCHAR(6),
  de_ugestora TEXT,
  ds_link TEXT
);
