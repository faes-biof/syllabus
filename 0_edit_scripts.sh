find ~/faes-biof/syllabus -type f -name '*.sh' ! -name '0_*.sh' -print0 | xargs -0 sed -i.bak '
    s/<year>/YEAR/;
    s/<semester>/SEMESTER/;
    s/<course_code>/COURSE_CODE/
    '
