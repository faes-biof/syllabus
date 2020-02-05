YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
ln -fs $SYLLABUS_NAME.md README.md
git add README.md
git commit -m "Replace current readme with syllabus symlink"
git push
