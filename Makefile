python = `which python`

cblue  = \033[94m
endc   = \033[0m
bold   = \033[1m

help:
	@echo
	@echo "$(bold)SCRIPT DE IMPORTAÇÃO DE DADOS$(endc)"
	@echo "$(cblue)"
	@echo "  Como funciona?"
	@echo "    1 - Os arquivos são baixados do servidor do orgão público"
	@echo "    2 - Os dados são transformados em bases de dados sqlite3"
	@echo "$(endc)"
	@echo "  Opções:"
	@echo
	@echo "    - tomar-pilula-vermelha"
	@echo "    - limpar"
	@echo

tomar-pilula-vermelha:
	$(python) setup.py
	$(python) tce/sagres/criar-banco-de-dados.py municipal

limpar:
	@rm -rf \
		tce/sagres/esfera-municipal/*.gz \
		tce/sagres/esfera-municipal/*.gz.* \
		tce/sagres/esfera-municipal/*.txt \
		tce/sagres/esfera-municipal/*.txt.* \
		tce/sagres/esfera-estadual/*.gz \
		tce/sagres/esfera-estadual/*.gz.* \
		tce/sagres/esfera-estadual/*.txt \
		tce/sagres/esfera-estadual/*.txt.*
	@echo "$(cblue)Os dados baixados foram removidos!$(endc)"
