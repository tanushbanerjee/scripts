#!/bin/bash
function help_command() {
    echo "compiler.sh [OPTION]... FILE WANTED TO BE COMPILED"
    echo ""
    echo "Options: "
    echo "-g, --groff           for compiling groff files"
    echo "-gpdf, --groffpdf     for compiling groff files to pdf files, for TOC support"
    echo "-lt, --latex          for compiling latex files"
    echo "-cpp                  for compiling c++ files"
}

case "$1" in 
    -h) help_command;;
    --help) help_command;;
    -cpp) g++ "$2";;
    -lt) latexmk -pdf "$2";;
    --latex) latexmk -pdf "$2";;
    -g) eqn -Tpdf "$2" | groff -ms -Tpdf > output.pdf;;
    --groff) eqn -Tpdf "$2" | groff -ms -Tpdf > output.pdf;;
    --groffpdf) pdfroff -mspdf index.ms > output.pdf;;
    -gpdf) pdfroff -mspdf index.ms > output.pdf;;
esac
