Requirements:
- [git](https://git-scm.com/) (May already be installed, if running `git --help` gives an error, [install git](https://www.atlassian.com/git/tutorials/install-git))
- [pandoc](https://pandoc.org/) - (Probably not already installed, [install pandoc](https://pandoc.org/installing.html))

Steps:
1. Clone this repo, e.g. `git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus; cd ~/faes-biof/syllabus`
2. Clone your course repo, e.g. `git clone https://github.com/biof309/spring2020 ~/biof309/spring2020`
3. Rename [the syllabus template markdown file (template.md)](/template.md) to `<year>-<semester>-<code>.md`, e.g. `mv template.md 2020-spring-biof309.md`
4. Fill in the new markdown file using your favorite text editor, e.g. `vim 2020-spring-biof309.md`
5. Run `pandoc 2020-spring-biof309.md -o template.docx --reference-doc=reference.docx`
6. Copy both new files to your course repo, e.g. `cp 2020-spring-biof309.md 2020-spring-biof309.docx ~/biof309/spring2020`
7. Go to your course repo, e.g. `cd ~/biof309/spring2020`
8. Symlink the markdown file to README.md, e.g. `ln 2020-spring-biof309.md README.md`
9. Push the markdown files to github, e.g. `git add 2020-spring-biof309.md README.md && git commit -m "update syllabus using FAES template" && git push`

Example:
```
git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus
git clone https://github.com/biof309/spring2020 ~/biof309/spring2020
cd ~/faes-biof/syllabus
mv template.md 2020-spring-biof309.md
vim 2020-spring-biof309.md
pandoc 2020-spring-biof309.md -o 2020-spring-biof309.docx --reference-doc=reference.docx
cp 2020-spring-biof309.md 2020-spring-biof309.docx ~/biof309/spring2020
cd ~/biof309/spring2020
ln 2020-spring-biof309.md README.md
git add 2020-spring-biof309.md README.md
git commit -m "update syllabus using FAES template"
git push
```




