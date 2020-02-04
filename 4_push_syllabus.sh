YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
git add $SYLLABUS_NAME.md $SYLLABUS_NAME.docx
git commit -m "Add FAES syllabus template in md and docx format"
git push
