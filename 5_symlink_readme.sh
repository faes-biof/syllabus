YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
cd ~/$COURSE_CODE/$SEMESTER$YEAR
ln -s $SYLLABUS_NAME.md README.md
git add README.md
git commit -m "Replace current readme with syllabus"
git push
