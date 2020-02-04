sed '
    s/^<div align="center">/::: {custom-style="center"}/;
    s/^<\/div>/:::/;
    s/^<img src="/!\[\](/;
    s/" width="200">$/){width="4cm"}/
    s/^- /#### /;
    s/^  - /##### /;
    s/^    - /###### /;
    ' template.md | pandoc -o test.docx --reference-doc=reference.docx
