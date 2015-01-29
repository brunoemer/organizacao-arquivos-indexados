#!/bin/bash

time while read p; do
	len=$(echo "$p"| wc -c);
	#echo "$len";
	if [ $len -le 88 ]; then
		printf "%-87s\r\n" "$p";
	else
		echo "$p";
	fi
done < /media/d/ol_dump_formated_final.txt > /media/d/tmp.txt


