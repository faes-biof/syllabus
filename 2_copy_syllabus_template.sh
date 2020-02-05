YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/faes-biof/syllabus/
cp template.md ~/$COURSE_CODE/$SEMESTER$YEAR/$SYLLABUS_NAME.md
cp faes300.png reference.docx header.tex ~/$COURSE_CODE/$SEMESTER$YEAR/
