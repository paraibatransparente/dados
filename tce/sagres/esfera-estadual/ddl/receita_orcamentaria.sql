DROP TABLE IF EXISTS receita_orcamentaria;
CREATE TABLE receita_orcamentaria (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cd_Receita TEXT, -- campo texto para o código da receita;
  de_Receita TEXT, -- campo texto para a descrição;
  de_AtualizacaoReceita TEXT, -- campo texto para a descrição da atualização;
  dt_MesAno VARCHAR(6), -- campo texto contendo o mês e o ano, na forma MMYYYY;
  vl_LancamentoOrc NUMERIC(12,4), -- campo monetário, contendo o valor do lançamento, sendo o ponto(.) o separador decimal;
  dt_ano INTEGER -- campo numérico, inteiro, contendo o ano;
);
