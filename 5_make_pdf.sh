YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
sed '
    s/^<div align="center">/\\begin{center}/;
    s/^<\/div>/\\end{center}/
    ' $SYLLABUS_NAME.md | pandoc -o $SYLLABUS_NAME.pdf
