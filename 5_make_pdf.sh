YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
cat pdf.yml $SYLLABUS_NAME.md | sed '
    s/^<div align="center">/\\begin{center}/;
    s/^<\/div>/\\end{center}/;
    s/<img src="/\\includegraphic[width=4cm]{/;
    s/" width="200">/}/
    ' | pandoc -o $SYLLABUS_NAME.pdf
