#!/bin/bash

if [ ! -d site ]; then
    mkdir site
fi

cd use-cases

for file in ../library/*.docx
do
    pandoc -f docx -t markdown "$file" -o "$(basename """$file""" .docx).markdown" --extract-media ./
done

