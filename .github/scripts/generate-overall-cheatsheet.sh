#!/bin/bash

readonly OVERALL_CHEATSHEET="./Overall-Cheatsheet.md"

rm $OVERALL_CHEATSHEET

echo "<!-- START doctoc -->" >> $OVERALL_CHEATSHEET
echo "<!-- END doctoc -->" >> $OVERALL_CHEATSHEET

for file in ./*Cheatsheet.md; do
  echo "Adding ${file} to overall Cheatsheet"
  first_table_line_number=$(echo "`cat $file`" | grep -n "| Description" | cut -d: -f1 | head -n 1)
  start=$(printf '+%d' $((first_table_line_number - 2)))
  cat "$file" | tail -n $start >> $OVERALL_CHEATSHEET
done