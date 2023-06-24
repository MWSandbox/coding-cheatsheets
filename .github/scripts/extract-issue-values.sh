#!/bin/bash

extract_value() {
  start_tag=$1
  end_tag=$2

  echo "$ISSUE_DESC" | grep -o -P "(?<=$start_tag).*(?=$end_tag)"
}

cheatsheet=$(extract_value '\{CHEATSHEET\}' '\{\/CHEATSHEET\}')
section=$(extract_value '\{SECTION\}' '\{\/SECTION\}')
command=$(extract_value '\{COMMAND\}' '\{\/COMMAND\}')
desc=$(extract_value '\{DESC\}' '\{\/DESC\}')

#escape | in command string
command="${command//|/\\|}"
echo $command

echo "################### EXTRACTED VALUES ###################"
echo "Cheatsheet: ${cheatsheet}."
echo "Section: ${section}."
echo "Command: ${command}."
echo "Desc: ${desc}."

echo "CHEATSHEET=${cheatsheet}" >> $GITHUB_ENV
echo "SECTION=${section}" >> $GITHUB_ENV
echo "COMMAND=${command}" >> $GITHUB_ENV
echo "DESC=${desc}" >> $GITHUB_ENV