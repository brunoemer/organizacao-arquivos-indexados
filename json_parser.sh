#!/bin/bash

# Dependecias:
# jq - http://stedolan.github.io/jq/

LANG=en_EN.utf-8;

lines=( ${array[@]} `awk '{print $2}' /media/d/ol_dump_authors_sorted_2013-08-31.txt |cut -d"/" -f3` );
inicio=1;
final=$(echo "${#lines[@]}");
final=$(($final-1));
function search_bin(){
	local busca=$1;
	while [ $inicio -le $final ]; do
		meio=$((($inicio+$final)/2))
   		if [ "${lines[$meio]}" == "$busca" ]; then
			echo $meio;
			break;
		elif [[ "${busca}" > "${lines[$meio]}" ]];then
			inicio=$(($meio+1));
		else
			final=$(($meio-1));
		fi
	done
}
#line=$(search_bin "/authors/OL4236338A");
#echo $line;
#exit;

startt="Start: "$(date +"%F %T");
i=1;
while read p; do
	json=$(echo $p |awk '{$1=$2=$3=$4=""; print $0}');
	#cod=$(echo $json |jq -r '.key' |cut -c 11-17 |tr -d 'W');
	tit=$(echo $json |jq -a -r '.title' |sed 's/[À-ú]//g' |cut -c -45);
	auc=$(echo $json |jq -r '.authors[].author.key' |cut -d"/" -f3);
	edi=$(echo $json |jq -r '.revision');
	ano=$(echo $json |jq -r '.created.value' |cut -c -4);
	if [ -n "$tit" ]; then
		#aut=$auc;
		#aut=$(awk -O -v cauthor=$auc '{if ($2 == cauthor){ $1=$2=$3=$4=""; print $0; exit; }}' /media/d/ol_dump_authors_sorted_2013-08-31.txt |jq -r '.name' | sed 's/[À-ú]//g'| cut -c -30);
		#aut=$(sed "$(search_bin $auc)!d" /media/d/ol_dump_authors_sorted_2013-08-31.txt |awk '{$1=$2=$3=$4=""; print $0}' |jq -r '.name' | sed 's/[À-ú]//g'| cut -c -30);
		aut=$(awk -O -v LIN="$(search_bin $auc)" '{if (NR == LIN){ $1=$2=$3=$4=""; print $0; exit; }}' /media/d/ol_dump_authors_sorted_2013-08-31.txt |jq -r '.name' | sed 's/[À-ú]//g'| cut -c -30);
		#aut=$(search_bin $auc);
		printf "%07d%-45s%-30s%c%4d\r\n" "$i" "$tit" "$aut" "$edi" "$ano"; #>> /media/d/ol_dump_format.txt;
	fi
	if [ $i -ge 3000 ]; then
		break;
	fi
	i=$(($i+1));
done < /media/d/ol_dump_works_2013-07-31.txt #> /media/d/ol_dump_formated.txt

echo $startt;
echo "Stop:  "$(date +"%F %T");

exit;

# verifica codigo repetidos
# head -n 3000000 ol_dump_works_2013-07-31.txt |awk '{$1=$2=$3=$4=""; print $0}' |jq -r '.key' |cut -c 10-16 |tr -d 'W' |sort |uniq -c |sort -k 1
