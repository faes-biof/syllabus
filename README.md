Requirements:
- [git](https://git-scm.com/) - May already be installed, if running `git --help` gives an error, [install git](https://www.atlassian.com/git/tutorials/install-git)
- [pandoc](https://pandoc.org/) - Probably not already installed, [install pandoc](https://pandoc.org/installing.html)
- a course repo on [GitHub](https://github.com/) - For more on how to create a GitHub repo, visit [this webpage](https://help.github.com/en/github/getting-started-with-github/create-a-repo)

Initial setup:
1. Clone this repo, e.g.
- `git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus`
2. Run [0_edit_scripts.sh](0_edit_scripts.sh) to modify the YEAR, SEMESTER, and COURSE_CODE variables in
- [1_clone_course_repo.sh](1_clone_course_repo.sh),
- [2_copy_syllabus_template.sh](2_copy_syllabus_template.sh),
- [3_make_docx.sh](3_make_docx.sh),
- [4_push_syllabus.sh](4_push_syllabus.sh),
- [5_symlink_readme.sh](5_symlink_readme.sh), and
- [6_push_logo_and_refdoc.sh](6_push_logo_and_refdoc.sh):
- `bash 0_edit_scripts`
3. Clone your course repo if you haven't already:
- `bash ~/faes-biof/syllabus/1_clone_course_repo.sh`
4. Run [2_copy_syllabus_template.sh](2_copy_syllabus_template.sh):
- `bash ~/faes-biof/syllabus/2_copy_syllabus_template.sh`
5. `cd` into your course repo and edit the [syllabus template markdown file](template.md) using your favorite text editor, e.g.
- `vim template.md`
6. Run [3_make_docx.sh](3_make_docx.sh):
- `bash ~/faes-biof/syllabus/3_make_docx.sh`
7. Run [4_push_syllabus.sh](4_push_syllabus.sh):
- `bash ~/faes-biof/syllabus/4_push_syllabus.sh`
8. Repeat steps 5-7 as needed.
OPTIONAL: Symlink your syllabus markdown file to README.md, e.g.
- `ln -s 2020-spring-biof309-syllabus.md README.md`
- `git add README.md`
- `git commit -m "Replace current readme with syllabus"`
- `git push`
OPTIONAL: Add the FAES logo and reference docx to your course repo, e.g.
- `git add faes300.png reference.docx`
- `git commit -m "Add FAES logo, syllabus template, and reference docx"`
- `git push`

[1_clone_course_repo.sh](1_clone_course_repo.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
git clone https://github.com/$COURSE_CODE/$SEMESTER$YEAR ~/$COURSE_CODE/$SEMESTER$YEAR
```

[2_copy_syllabus_template.sh](2_copy_syllabus_template.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
cp ~/faes-biof/syllabus/template.md $SYLLABUS_NAME.md
cp ~/faes-biof/syllabus/faes300.png ~/faes-biof/syllabus/reference.docx .
```

[3_make_docx.sh](3_make_docx.sh):

```sh
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

[4_push_syllabus.sh](4_push_syllabus.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
git add $SYLLABUS_NAME.md $SYLLABUS_NAME.docx
git commit -m "Add FAES syllabus template in md and docx format"
git push
```

[5_symlink_readme.sh](5_symlink_readme.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
ln -s $SYLLABUS_NAME.md README.md
git add README.md
git commit -m "Replace current readme with syllabus"
git push
```

[6_push_logo_and_refdoc.sh](6_push_logo_and_refdoc.sh):

```sh
git add faes300.png reference.docx
git commit -m "Add FAES logo and reference docx"
git push
```
