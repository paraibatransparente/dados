python = `which python`
sqlite = `which sqlite3`

cblue  = \033[94m
endc   = \033[0m
bold   = \033[1m

help:
	@echo
	@echo "$(bold)SCRIPT DE CRIAÇÃO DE BASE DE DADOS$(endc)"
	@echo "$(cblue)"
	@echo "  Como funciona?"
	@echo "    1 - É necessário ter realizado o download dos arquivos do TCE-PB"
	@echo "    2 - Os dados são transformados em bases de dados sqlite3"
	@echo "$(endc)"
	@echo "  Opções:"
	@echo
	@echo "    - normalizar"
	@echo

normalizar:
	$(python) normalizador.py
	$(python) normalizador_funcao.py 2003
	$(python) normalizador_elemento.py 2003
	$(python) normalizador_credor_empenho_gestora_funcao.py 2003
