#!/bin/bash

files=$(find -type f);

for file in $files; do
	seperator=$(awk -F"/" '{print NF-1}' <<< "${file}");
	if [[ $seperator > 1 ]]; then
		newFileName=${file//'/'/'+'};
		newFileName=${newFileName//'.+'/'./'};
		cp $file $newFileName
		echo "Copy and rename file: $file";
	fi
done

echo "Finish";
