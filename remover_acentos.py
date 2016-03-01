# -*- coding: utf-8 -*-
from unicodedata import normalize
import sqlite3

'''
@see http://wiki.python.org.br/RemovedorDeAcentos

Devolve cópia de uma str substituindo os caracteres
acentuados pelos seus equivalentes não acentuados.

ATENÇÃO: carateres gráficos não ASCII e não alfa-numéricos,
tais como bullets, travessões, aspas assimétricas, etc.
são simplesmente removidos!

    >>> remover_acentos('[ACENTUAÇÃO] ç: áàãâä! éèêë? íì&#297;îï, óòõôö; úù&#361;ûü.')
    '[ACENTUACAO] c: aaaaa! eeee? iiiii, ooooo; uuuuu.'

'''
def remover_acentos(txt, codif='utf-8'):
    return normalize('NFKD', txt.decode(codif)).encode('ASCII','ignore')

# abrindo conexão com o banco de Dados
conexao = sqlite3.connect('tce/sagres/esfera-municipal/esfera-municipal.db')
# configuração necessária para trabalhar com unicode
conexao.text_factory = str

print "Alimentando campo ds_link da tabela funcao"
cursor = conexao.cursor()
cursor_upd = conexao.cursor()
for municipio in (cursor.execute('SELECT id, de_Funcao FROM funcao')):
    print remover_acentos(municipio[1]).lower().replace(" ", "-")
    cursor_upd.execute('UPDATE funcao SET ds_link = ? WHERE id = ?', (remover_acentos(municipio[1]).lower().replace(" ", "-"), municipio[0], ))

conexao.commit()
cursor_upd.close()
cursor.close()
