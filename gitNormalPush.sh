rm -f ghostdriver.log
git add .
git commit . -m "$1"
git push -u search master
