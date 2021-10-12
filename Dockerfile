FROM ubuntu:hirsute
MAINTAINER Sylvain Bouveret <Sylvain.Bouveret@grenoble-inp.fr>

RUN apt-get update -y
# Following line is necessary (otherwise the install gets stuck)
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata
# Install latex package
RUN apt-get install -y \
    texlive-latex-base \
    texlive-xetex  \
    texlive-science \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-latex-recommended \
    texlive-lang-french \
    texlive-extra-utils \
    texlive-luatex \
    latexmk \
    latex-mk \
    latex-make
RUN apt-get install -y \
    fontconfig \
    lmodern \
    inkscape pdf2svg make
# Install pandoc (version 2.14)
RUN apt-get install -y wget
RUN wget https://github.com/jgm/pandoc/releases/download/2.14.2/pandoc-2.14.2-1-amd64.deb && dpkg -i pandoc-2.14.2-1-amd64.deb
RUN rm pandoc-2.14.2-1-amd64.deb
#
WORKDIR /usr/local
# Install plantuml and chamilotools
RUN apt-get install -y git python3-pip plantuml python3
RUN pip3 install pandocfilters \
    && pip3 install pandoc-plantuml-filter \
    && pip3 install sphinx recommonmark \
    && pip3 install mkdocs plantuml-markdown \
    && pip3 install panflute
RUN pip3 install pandoc-latex-environment
RUN apt-get install -y minify
RUN apt-get install -y rsync
