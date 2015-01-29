#!/bin/bash

# Monta arquivo formatado, apenas com codigo do autor
# Proximo script para formatar o arquivo de autores: json_parser_authors.sh

# Arquivos:
# ol_dump_works_2013-07-31.txt - http://openlibrary.org/data/ol_dump_works_latest.txt.gz

# Dependecias:
# jq - http://stedolan.github.io/jq/

LANG=en_EN.utf-8;

i=1;
time while read p; do
	json=$(echo $p |awk '{$1=$2=$3=$4=""; print $0}');
	#cod=$(echo $json |jq -r '.key' |cut -c 11-17 |tr -d 'W');
	tit=$(echo $json |jq -a -r '.title' |sed 's/[À-ú]//g' |cut -c -45);
	auc=$(echo $json |jq -r '.authors[].author.key');
	#auc=$(echo $json |jq -r '.authors[].author.key' |cut -d"/" -f3);
	edi=$(echo $json |jq -r '.revision');
	ano=$(echo $json |jq -r '.created.value' |cut -c -4);
	if [ -n "$tit" ]; then
		aut=$auc;
		printf "%07d%-45s%-30s%c%4d\r\n" "$i" "$tit" "$aut" "$edi" "$ano";
		i=$(($i+1));
	fi
	if [ $i -ge 3000000 ]; then
		break;
	fi
done < /media/d/ol_dump_works_2013-07-31.txt > /media/d/ol_dump_formated.txt

#real	822m0.195s
#user	42m8.644s
#sys	67m53.344s

# faltou uma linha
# echo "3000000Art treasures of the world                   /authors/OL952990A            22009" >> /media/d/ol_dump_formated.txt

# remove linha invalidas
# sed -i '/^\/.*\/.*$/d' ol_dump_formated.txt

# ordenar arquivo por codigo autor para nao ficar sequencial
# sort -k 1.62,1.82 ol_dump_formated.txt > ol_dump_formated_sorted.txt

