#!/bin/bash

# Monta arquivo formato codigo_autor;nome_autor
# Proximo script para completar arquivo final com nome: json_parser_authors_final.sh

# Arquivos:
# ol_dump_authors_2013-08-31.txt - http://openlibrary.org/data/ol_dump_authors_latest.txt.gz

# ordenar arquivo de autores
# sort -k2 ol_dump_authors_2013-08-31.txt > ol_dump_authors_sorted_2013-08-31.txt

# Dependecias:
# jq - http://stedolan.github.io/jq/

LANG=en_EN.utf-8;

time while read p; do
	auc=$(echo "$p"| awk '{print $2}' |cut -d"/" -f3);
	aut=$(echo "$p"| awk '{$1=$2=$3=$4=""; print $0}' |jq -r '.name' | sed 's/[À-ú;0-9]//g'| cut -c -30);
	echo "$auc;$aut";
done < /media/d/ol_dump_authors_sorted_2013-08-31.txt > /media/d/ol_dump_authors.txt

#real	1039m2.780s
#user	79m32.644s
#sys	120m3.248s

