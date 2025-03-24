#!/bin/bash

if [ ! -d site ]; then
    mkdir site
fi

cd use-cases

for file in ../library/*.docx
do
    output=$(basename """$file""" .docx).md
    pandoc -f docx -t markdown "$file" -o "${output}" --extract-media ./
    # remove {width=...} from images
    sed -i 's/\(.*\){width=.*}/\1/g' "${output}"    
done

