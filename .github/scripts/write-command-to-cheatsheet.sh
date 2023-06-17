#!/bin/bash

section_start_line_number=$(echo "$(<./${CHEATSHEET}-Cheatsheet.md)" | grep -wn "# ${SECTION}" | cut -d: -f1)
command_line_number=$((section_start_line_number + 4))

if [[( "$section_line_number" == 0 ) || -z "$section_line_number" ]]; then 
  echo "Could not find section ${SECTION} in file ${CHEATSHEET}-Cheatsheet.md"
  exit 1
fi

sed -i "${command_line_number}i | ${DESC} | ${COMMAND} |" "./${CHEATSHEET}-Cheatsheet.md"