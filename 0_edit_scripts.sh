sed -i.bak '
    s/<year>/YEAR/;
    s/<semester>/SEMESTER/;
    s/<course_code>/COURSE_CODE/
    ' ~/faes-biof/syllabus/{1..6}*.sh
