#!/bin/bash

echo -e "\n## Compile Adventures"
echo -e   "#####################\n"
for adv in *.alan; do
	echo "Compiling: $adv"
	alan --include ../_core-verbs/ $adv
done

echo -e "\n## Run Tests Scripts"
echo -e   "####################\n"
for a3c in *.a3c; do
	echo -e "=> Testing \"$a3c\":"
	for a3s in *.a3s; do
		a3t="${a3s%.a3s}.a3t"
		echo "   \"$a3s\""
		arun -r $a3c < $a3s > $a3t
	done
done
