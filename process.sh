#!/bin/bash

# Run the command to ignore the files listed
# echo -e "oprint.txt\ndid-these.txt"" >> .git/info/exclude

BRANCH_NAME=`git branch | grep \* | tr -d '* '`

# clean up if found
rm -f oprint.txt && git status

read -e -p "HAVE YOU MANUALLY COMMITTED YOUR FILES? - *carefully study the above statements*: " choice

cat > oprint.txt << EOF
$(cat did-these.txt)
$BRANCH_NAME: $(TZ=Africa/Lagos date -u +"%Y-%m-%d %T %z")
EOF

if [[ "$choice" == [Nn]* ]]; then
	echo "You need to manually add the necessary files"
else
	if [[ "$choice" == [Yy]* ]]; then
	  # Do essential git jobs
		git config user.name "Chukwudi Nwachukwu"
		git config user.email "theichux@gmail.com"
		git commit --verbose --message="$( cat oprint.txt )" && rm -f oprint.txt

		printf "\n$(date +'%Y-%m-%d %T'),000 INFO \x1b[32mCode was committed\x1b[0m\n"
		printf "$(date +'%Y-%m-%d %T'),000 INFO \x1b[31mYou can now push the code\x1b[0m\n\n"
	fi
fi