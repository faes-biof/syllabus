Requirements:
- [git](https://git-scm.com/) - May already be installed, if running `git --help` gives an error, [install git](https://www.atlassian.com/git/tutorials/install-git)
- [pandoc](https://pandoc.org/) - Probably not already installed, [install pandoc](https://pandoc.org/installing.html)
- a course repo on [GitHub](https://github.com/) - For more on how to create a GitHub repo, visit [this webpage](https://help.github.com/en/github/getting-started-with-github/create-a-repo)

Steps:
1. Clone this repo and cd into it, e.g.
- `git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus`
- `cd ~/faes-biof/syllabus`
2. Clone your course repo, e.g.
- `git clone https://github.com/biof309/spring2020 ~/biof309/spring2020`
3. Copy and rename [the syllabus template markdown file (template.md)](/template.md) along with reference.docx to your course repo, e.g.
- `cp template.md ~/biof309/spring2020/2020-spring-biof309-syllabus.md`
- `cp reference.docx ~/biof309/spring2020/`
4. Go to your course repo and fill in the new markdown file using your favorite text editor, e.g.
- `cd ~/biof309/spring2020/`
- `vim 2020-spring-biof309-syllabus.md`
5. Use pandoc to convert your syllabus markdown file to docx format
- `pandoc 2020-spring-biof309-syllabus.md -o 2020-spring-biof309-syllabus.docx --reference-doc=reference.docx`
6. Symlink your syllabus markdown file to README.md, e.g.
- `ln 2020-spring-biof309-syllabus.md README.md`
7. Push the new files to github, e.g.
- `git add 2020-spring-biof309-syllabus.md 2020-spring-biof309-syllabus.docx README.md`
- `git commit -m "update syllabus using FAES template"`
- `git push`
8. Send the docx file to FAES and any students that ask for a Word doc. If any changes need to be made, edit the markdown file and then rerun pandoc to create the docx file.

Example:
```
git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus
cd ~/faes-biof/syllabus
git clone https://github.com/biof309/spring2020 ~/biof309/spring2020
cp template.md ~/biof309/spring2020/2020-spring-biof309-syllabus.md
cp reference.docx ~/biof309/spring2020/
cd ~/biof309/spring2020
vim 2020-spring-biof309.md
pandoc 2020-spring-biof309-syllabus.md -o 2020-spring-biof309-syllabus.docx --reference-doc=reference.docx
ln 2020-spring-biof309.md README.md
git add 2020-spring-biof309.md README.md
git commit -m "update syllabus using FAES template"
git push
```




