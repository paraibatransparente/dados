-- https://www.sqlite.org/lang_createindex.html
CREATE INDEX IF NOT EXISTS idx_pagamento_dt_ano ON pagamento (dt_ano);
