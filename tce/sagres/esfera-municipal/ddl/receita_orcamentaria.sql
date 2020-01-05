DROP TABLE IF EXISTS receita_orcamentaria;
CREATE TABLE receita_orcamentaria (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_ugestora INTEGER, -- campo numérico, inteiro, contendo o identificador da unidade gestora;
  de_ugestora TEXT, -- campo texto contendo o nome da unidade gestora;
  dt_ano INTEGER, -- campo numérico, inteiro, contendo o ano;
  cd_receitaOrcUg INTEGER, -- campo texto contendo o código da receita/unidade gestora;
  de_receitaOrcUg TEXT, -- campo texto para a descrição;
  tp_atualizacaoreceita, TEXT, -- código para a atualização/lançamento da receita;
  de_atualizacaoreceita TEXT, -- campo texto para a descrição da atualização;
  vl_lancamentoOrc NUMERIC(12,4), -- campo monetário, contendo o valor do lançamento, sendo o ponto(.) o separador decimal;
  dt_mesano VARCHAR(6) -- campo texto contendo o mês e ano, na forma MMYYYY;
);
