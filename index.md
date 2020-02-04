Requirements:
- [git](https://git-scm.com/) - May already be installed, if running `git --help` gives an error, [install git](https://www.atlassian.com/git/tutorials/install-git)
- [pandoc](https://pandoc.org/) - Probably not already installed, [install pandoc](https://pandoc.org/installing.html)
- a course repo on [GitHub](https://github.com/) - For more on how to create a GitHub repo, visit [this webpage](https://help.github.com/en/github/getting-started-with-github/create-a-repo)

Initial setup:
1. Clone this repo, e.g.
- `git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus`
2. Modify the YEAR, SEMESTER, and COURSE_CODE variables in
- [1_clone_course_repo.sh](clone_course_repo.sh),
- [2_copy_syllabus_template.sh](copy_syllabus_template.sh),
- [3_make_docx.sh](make_docx.sh), and
- [4_push_syllabus.sh](push_syllabus.sh), e.g.
- `find ~/faes-biof/syllabus -type f -name '*.sh' | xargs sed -I{} 's/<year>/2020/;s/<semester>/spring/;s/<course_code>/biof309/' {} > {}`
3. Clone your course repo if you haven't already:
- `bash ~/faes-biof/syllabus/1_clone_course_repo.sh`
4. Run [2_copy_syllabus_template.sh](2_copy_syllabus_template.sh):
- `bash ~/faes-biof/syllabus/2_copy_syllabus_template.sh`
5. Edit the new markdown file in to your course repo using your favorite text editor, e.g.
- `vim 2020-spring-biof309-syllabus.md`
6. Run [3_make_docx.sh](3_make_docx.sh):
- `bash ~/faes-biof/syllabus/3_make_docx.sh`
7. Run [4_push_syllabus.sh](4_push_syllabus.sh):
- `bash ~/faes-biof/syllabus/4_push_syllabus.sh`
8. Repeat steps 5-6 as needed.
OPTIONAL: Symlink your syllabus markdown file to README.md, e.g.
- `ln -s 2020-spring-biof309-syllabus.md README.md`
OPTIONAL: Add the FAES logo, syllabus template, and reference docx to your course repo, e.g.
- `git add faes300.png template.md reference.docx`
- `git commit -m "Add FAES logo, syllabus template, and reference docx"`
- `git push`

[1_clone_course_repo.sh](clone_course_repo.sh):

```
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
git clone https://github.com/$COURSE_CODE/$SEMESTER$YEAR ~/$COURSE_CODE/$SEMESTER$YEAR
cd ~/$COURSE_CODE/$SEMESTER$YEAR
```

[2_copy_syllabus_template.sh](copy_syllabus_template.sh):

```
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
cd ~/$COURSE_CODE/$SEMESTER$YEAR
cp ~/faes-biof/syllabus/template.md ~/faes-biof/syllabus/faes300.png ~/faes-biof/syllabus/reference.docx .
```

[3_make_docx.sh](make_docx.sh):

```
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
sed '
    s/^<div align="center">/::: {custom-style="center"}/;
    s/^<\/div>/:::/;
    s/^<img src="/!\[\](/;
    s/" width="200">$/){width="4cm"}/
    s/^- /#### /;
    s/^  - /##### /;
    s/^    - /###### /;
    ' template.md | pandoc -o $SYLLABUS_NAME.docx --reference-doc=reference.docx
```

[4_push_syllabus.sh](push_syllabus.sh):

```
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
git add $SYLLABUS_NAME.md $SYLLABUS_NAME.docx
git commit -m "Add FAES syllabus template in md and docx format"
git push
```
