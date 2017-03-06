python = `which python`

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
	@echo "    - criar-bd-municipal"
	@echo "    - criar-bd-estadual"
	@echo "    - limpar"
	@echo

criar-bd-municipal:
	$(python) criar-banco-de-dados.py municipal

criar-bd-estadual:
	$(python) criar-banco-de-dados.py estadual

limpar:
	@rm -rf \
		esfera-municipal/*.db \
		esfera-estadual/*.db
	@echo "$(cblue)Os arquivos SQLite gerados foram removidos!$(endc)"
