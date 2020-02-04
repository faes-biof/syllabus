YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
cp ~/faes-biof/syllabus/template.md $SYLLABUS_NAME.md
cp ~/faes-biof/syllabus/faes300.png ~/faes-biof/syllabus/reference.docx .
