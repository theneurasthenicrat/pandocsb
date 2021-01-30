FROM debian
MAINTAINER Sylvain Bouveret <Sylvain.Bouveret@grenoble-inp.fr>

#Install pandoc and latex package
RUN apt-get update -y \
   && apt-get install -y \
    texlive-latex-base \
    texlive-xetex  \
    texlive-science texlive-science-doc \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-latex-recommended \
    texlive-lang-french \
    latexmk \
    latex-mk \
    latex-make \
    pandoc  \
    fontconfig \
    lmodern \
    inkscape pdf2svg make
WORKDIR /usr/local
#Install plantuml and chamilotools
RUN apt-get install -y git python-pip python3-pip plantuml python3
RUN pip install pandocfilters \
    && pip install pandoc-plantuml-filter \
    && pip3 install sphinx recommonmark \
    && pip3 install mkdocs plantuml-markdown
RUN pip install pandoc-latex-environment
RUN apt-get install -y minify
RUN apt-get install -y rsync
