#!/bin/bash

# Completa arquivo com nome do autor

time while read p; do
	auc=$(echo "$p"| cut -c 53-82);
	aucc=$(echo "$auc"| tr -d ' ' |cut -d"/" -f3);
	if [ -n "$aucc" ]; then
		#aut=$auc;
	        #aut=$(grep -m 1 "$aucc" /media/d/ol_dump_authors_sorted_2013-08-31.txt |awk '{$1=$2=$3=$4=""; print $0}' |jq -r '.name' | sed 's/[À-ú]//g'| cut -c -30);
		#aut=$(printf "%-30s" "$aut");
	#	time aut=$(awk -O -v cauthor=$auc '{if ($2 == cauthor){ $1=$2=$3=$4=""; print $0; exit; }}' /media/d/ol_dump_authors_sorted_2013-08-31.txt |jq -r '.name' | sed 's/[À-ú]//g'| cut -c -30);
	#	auc=$(echo $p |awk '{$1=$2=$3=$4=""; print $0}' |jq -r '.authors[].author.key' |cut -d"/" -f3);
	#	time aut=$(search_bin $auc);
		#aut=$(awk -O -v LIN="$(search_bin2 $auc)" '{if (NR == LIN){ $1=$2=$3=$4=""; print $0; exit; }}' /media/d/ol_dump_authors_sorted_2013-08-31.txt |jq -r '.name' | sed 's/[À-ú]//g'| cut -c -30);
	        aut=$(grep -m 1 "$aucc" /media/d/ol_dump_authors.txt |awk -F\; '{print $2}' |sed 's/[^a-zA-Z0-9\ ]//g');
		aut=`printf "%-30s" "$aut"`;
		echo "$p" |sed "s#$auc#$aut#g";
	else
		echo "$p";
	fi
done < /media/d/ol_dump_formated_sorted.txt > /media/d/ol_dump_formated_final.txt

#real	5499m5.839s
#user	3200m42.896s
#sys	1805m23.408s

