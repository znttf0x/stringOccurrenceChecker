#!/bin/bash

# Receives a list of strings ($1) and outputs all strings that are NOT in the file ($2)

# Checks given arguments
if [ -z "$1" ]; then
	echo "Receives a wordlist (\$1) and outputs which strings are <not> contained in the file (\$2)."
	exit
elif [ ! -f "$1" ] && [ ! -f "$2" ];then
	echo "Both arguments should be files."
	exit
fi

# Compares given files
for word in $(cat $1); do
	if ! grep -q $word $2; then
		out+="${word};"
	fi
done

# Prints result on the terminal
echo $out | \
	sed 's/;/\n/g' | \
	sed '/^$/d' | \
	sort -u
unset $out