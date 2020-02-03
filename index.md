Requirements:
- [git](https://git-scm.com/) (May already be installed, if running `git --help` gives an error, [install git](https://www.atlassian.com/git/tutorials/install-git))
- [pandoc](https://pandoc.org/) - (Probably not already installed, [install pandoc](https://pandoc.org/installing.html))
Steps:
1. Clone this repo, e.g. `git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus; cd ~/faes-biof/syllabus`
2. Rename [the syllabus template markdown file (template.md)](/template.md) to README.md, e.g. `mv template.md README.md`
3. Fill in the new README.md file using your favorite text editor
4. Run `pandoc template.md -o template.docx --reference-doc=reference.docx`
5. Move the README.md 

Example:
```
git clone https://github.com/faes-biof/syllabus ~/faes-biof/syllabus
cd ~/faes-biof/syllabus
mv template.md README.md
pandoc README.md -o 2020-spring-biof309.docx --reference-doc=reference.docx
```




