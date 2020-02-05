YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
cd ~/$COURSE_CODE/$SEMESTER$YEAR
git add faes300.png reference.docx header.tex
git commit -m "Add FAES logo, reference docx, and header.tex"
git push
