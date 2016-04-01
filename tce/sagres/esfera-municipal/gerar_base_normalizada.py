from subprocess import call

tabelas = [
    'funcao',
    'municipio',
    'tipo_unidade_gestora',
    'unidade_gestora',
    'receita_historico_gestora_ano',
    'empenho_historico_gestora_ano',
    'pagamento_historico_gestora_ano',
    'pagamento_historico_gestora_elemento_ano',
    'pagamento_historico_gestora_funcao_ano',
    ]

for tabela in tabelas:
    cmd_dump = "\".dump '"+tabela+"'\""
    comando = "sqlite3 esfera-municipal.db " + cmd_dump + " >> esfera-municipal-normalizada.db.sql"
    print comando
    #call([comando])
