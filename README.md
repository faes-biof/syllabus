<div align="center">
<h1>FAES Syllabus</h1>
</div>

### Goal
Enable FAES instructors to easily maintain a syllabus in multiple different formats:
- markdown
- html
- docx (Microsoft Word)
- pdf

### Summary
- Edit a syllabus markdown file
- Produce html, docx, and pdf syllabi by running shell scripts (md -> docx, html, pdf)
- Push the latest syllabus to GitHub with a shell script (local repo -> remote repo)

### File conversion
Markdown is a popular and versatile markup language that provides a simple syntax in addition to all of the power of HTML (HyperText Markup Language).
Markdown files can be converted into HTML, Microsoft Word, and pdf files using [pandoc](https://pandoc.org/).

### Don't edit output files!
Round trip conversion (e.g. docx <-> md) with pandoc is possible but maintaining formatting can be a challenge.
Microsoft Word does not work well with version control systems (e.g. [git](https://git-scm.com/)) or programmatic workflows.
If you would like to programmatically access changes and comments in a Word doc, take a look at these projects:
- [redoc](https://github.com/noamross/redoc#redoc---reversible-reproducible-documents)
- [officer](https://github.com/davidgohel/officer#officer-r-package)
- [officedown](https://github.com/davidgohel/officedown#usage)
- [python-docx](https://python-docx.readthedocs.io/)

### Requirements
- A course repo on [GitHub](https://github.com/) - For more on how to create a GitHub repo, [visit this webpage](https://help.github.com/en/github/getting-started-with-github/create-a-repo).
- [git](https://git-scm.com/) - May already be installed, if running `git --help` gives an error, [install git](https://www.atlassian.com/git/tutorials/install-git).
- [pandoc](https://pandoc.org/) - Needed for all file conversions, probably not already installed, [install pandoc](https://pandoc.org/installing.html).
- [L<sup>A</sup>T<sub>E</sub>X](https://www.latex-project.org/) - Needed to make a PDF version of the syllabus, probably not already installed, [install L<sup>A</sup>T<sub>E</sub>X](https://www.latex-project.org/get/#tex-distributions).

### Initial setup
1. Clone and cd into this repo:
- `git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus`
- `cd ~/faes-biof/syllabus`
2. Edit the 3 uppercase words (YEAR, SEMESTER, and COURSE_CODE) in [0_edit_scripts.sh](0_edit_scripts.sh), e.g.
- `sed -i.bak 's/YEAR/2020/;s/SEMESTER/spring/;s/COURSE_CODE/biof309/' 0_edit_scripts.sh`
3. Run the first 3 scripts with a for loop:
- `for file in {0..2}*.sh; do bash $file; done`
4. Edit edit the syllabus template markdown file in your course repo using your favorite text editor, e.g.
- `vim ~/biof309/spring2020/2020-spring-biof309-syllabus.md`
5. Run the next 4 scripts with a for loop:
- `for file in {3..6}*.sh; do bash $file; done`

Repeat steps 4-5 whenever you want to update the syllabus.

#### Trouble with L<sup>A</sup>T<sub>E</sub>X?
If you are having trouble installing L<sup>A</sup>T<sub>E</sub>X, you can skip the [5_make_pdf.sh](5_make_pdf.sh) script:
- `for file in {3..5}*.sh 6*.sh; do bash $file; done`, or
- `for file in {3..5}*.sh {6..8}*.sh; do bash $file; done`

#### Optional steps
- Use [7_push_others.sh](7_push_others.sh) to add the FAES logo file, L<sup>A</sup>T<sub>E</sub>X header, and reference.docx to your course repo.
- Use [8_symlink_readme.sh](8_symlink_readme.sh) to create a symbolic link (symlink) called README.md to your syllabus markdown file.
- **WARNING**: [8_symlink_readme.sh](8_symlink_readme.sh) will **overwrite your current README.md** if one exists.

### What do the scripts do?
- [0_edit_scripts.sh](0_edit_scripts.sh) modifies the YEAR, SEMESTER, and COURSE_CODE variables in
    - [1_clone_course.sh](1_clone_course.sh),
    - [2_copy_template.sh](2_copy_template.sh),
    - [3_make_docx.sh](3_make_docx.sh),
    - [4_make_htm.sh](4_make_htm.sh),
    - [5_make_pdf.sh](5_make_pdf.sh),
    - [6_push_syllabus.sh](6_push_syllabus.sh),
    - [7_push_others.sh](7_push_others.sh), and
    - [8_symlink_readme.sh](8_symlink_readme.sh)
- [1_clone_course.sh](1_clone_course.sh) clones your course repo (skip this step if it is already cloned)
- [2_copy_template.sh](2_copy_template.sh) copies the following files to your course repo:
    - syllabus template (renamed to YEAR-SEMESTER-COURSE_CODE-syllabus.md),
    - FAES logo,
    - reference.docx, and
    - header.tex
- [3_make_doc.sh](3_make_doc.sh) creates a docx version of your syllabus using [pandoc](https://pandoc.org/)
- [4_make_htm.sh](4_make_htm.sh) creates an html version of your syllabus using [pandoc](https://pandoc.org/)
- [5_make_pdf.sh](4_make_pdf.sh) creates a pdf version of your syllabus using [pandoc](https://pandoc.org/)
- [6_push_syllabus.sh](4_push_syllabus.sh) adds, commits, and pushes the markdown and docx versions of your syllabus to your course repo
- [7_push_others.sh](7_push_others.sh) pushes the FAES logo and reference docx to your course repo, e.g.
- [8_symlink_readme.sh](8_symlink_readme.sh) **overwrites your current README.md** by symlinking your syllabus markdown file to README.md

### What's in the scripts?

[0_edit_scripts.sh](0_edit_scripts.sh):

```sh
# using find -exec sed
find ~/faes-biof/syllabus -type f -name '*.sh' ! -name '0_*.sh' -exec sed -i.bak '
    s/<year>/YEAR/;
    s/<semester>/SEMESTER/;
    s/<course_code>/COURSE_CODE/
    '
```

```sh
# using find | xargs | sed
find ~/faes-biof/syllabus -type f -name '*.sh' ! -name '0_*.sh' -print0 | xargs -0 sed -i.bak '
    s/<year>/YEAR/;
    s/<semester>/SEMESTER/;
    s/<course_code>/COURSE_CODE/
    '
```

```sh
# using only sed
sed -i.bak '
    s/<year>/YEAR/;
    s/<semester>/SEMESTER/;
    s/<course_code>/COURSE_CODE/
    ' ~/faes-biof/syllabus/{1..6}*.sh
```

[1_clone_course.sh](1_clone_course.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
git clone https://github.com/$COURSE_CODE/$SEMESTER$YEAR ~/$COURSE_CODE/$SEMESTER$YEAR
```

[2_copy_template.sh](2_copy_template.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/faes-biof/syllabus/
cp template.md ~/$COURSE_CODE/$SEMESTER$YEAR/$SYLLABUS_NAME.md
cp faes300.png reference.docx header.tex ~/$COURSE_CODE/$SEMESTER$YEAR/
```

[3_make_doc.sh](3_make_doc.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
sed '
    s/^<div align="center">/::: {custom-style="center"}/;
    s/^<\/div>/:::/;
    s/^<img src="/![](/;
    s/" width="200">/){width="4cm"}/
    s/^- /#### /;
    s/^  - /##### /;
    s/^    - /###### /;
    ' $SYLLABUS_NAME.md | pandoc -o $SYLLABUS_NAME.docx --reference-doc=reference.docx
```

[4_make_htm.sh](4_make_htm.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
sed '
    s/align="/style="text-align:/
    ' $SYLLABUS_NAME.md | pandoc -o $SYLLABUS_NAME.docx --reference-doc=reference.docx
```

[5_make_pdf.sh](5_make_pdf.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
sed '
    s/^<div align="center">/\\begin{center}/;
    s/^<\/div>/\\end{center}/;
    s/<img src="/\\includegraphics[width=4cm]{/;
    s/" width="200">/}/
    ' $SYLLABUS_NAME.md | pandoc -o $SYLLABUS_NAME.docx --reference-doc=reference.docx
```

[6_push_syllabus.sh](6_push_syllabus.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
cd ~/$COURSE_CODE/$SEMESTER$YEAR
git add $SYLLABUS_NAME.md $SYLLABUS_NAME.docx $SYLLABUS_NAME.html $SYLLABUS_NAME.pdf
git commit -m "Add FAES syllabus template in md, docx, html, and pdf format"
git push
```

[7_push_others.sh](7_push_others.sh):

```sh
git add faes300.png reference.docx header.tex
git commit -m "Add FAES logo, reference docx, and header.tex"
git push
```

[8_symlink_readme.sh](8_symlink_readme.sh):

```sh
YEAR=<year>
SEMESTER=<semester>
COURSE_CODE=<course_code>
SYLLABUS_NAME=$YEAR-$SEMESTER-$COURSE_CODE-syllabus
ln -s $SYLLABUS_NAME.md README.md
git add README.md
git commit -m "Replace current readme with syllabus symlink"
git push
```

