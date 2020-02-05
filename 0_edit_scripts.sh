find ~/faes-biof/syllabus -type f -name '*.sh' ! -name '0_*.sh' -exec sed -i.bak '
    s/<year>/YEAR/;
    s/<semester>/SEMESTER/;
    s/<course_code>/COURSE_CODE/
    '
