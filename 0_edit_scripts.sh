find ~/faes-biof/syllabus -type f -name '*.sh' -print0 | xargs -0 sed -i.bak '
    s/<year>/2020/;
    s/<semester>/spring/;
    s/<course_code>/biof309/
    '
