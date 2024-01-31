#!/bin/bash
MAX_DAYS=30

rm -rf .git
git init
cat  <<EOF > README.md
# Time Traveler

Want to improve your GitHub vanity metrics ?
Run `run.sh`
It will create a commit for every day for the last $MAX_DAYS days.

## Commits for the last $MAX_DAYS

EOF
git add .
git commit -m "Initial commit"

days=$(seq $MAX_DAYS | tac)
for day in $days ;
do 
    date="$day days ago"
    message="message was committed $day days ago"
    echo "- This: $message" >> README.md
    git add .
    git commit --date "$date" -m "$message"
done
git log --oneline | tac

cat <<EOF

# Now push to GitHub with something like...

git remote add origin https://github.com/xxxx/xxxx
git push -u origin main
EOF
