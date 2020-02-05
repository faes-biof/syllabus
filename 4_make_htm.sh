YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
sed '
    s/align=">/style="text-align:/
    ' $SYLLABUS_NAME.md | pandoc -o $SYLLABUS_NAME.html
