#!/bin/bash

INPUT_DIR="20220213_25800"
TEMP_DIR="20220213_25800_wo_header"
OUTPUT_FILE="merged_wo_header_20220213_25800.tsv"

rm -rf $TEMP_DIR
mkdir $TEMP_DIR

# Remove header in each file
for path in $(ls -v ./$INPUT_DIR/*.txt); do
    file=$(basename "$path")
    echo "$file"
    tail -n +2 "$INPUT_DIR/$file" > "$TEMP_DIR/$file"
done

# Extract the header from the last file
head -n 1 "$INPUT_DIR/$file" > "$TEMP_DIR/header"

# Join files with a header on top
cat $TEMP_DIR/header ./$TEMP_DIR/*.txt > ./$OUTPUT_FILE

# You can then compress the resulted TSV file:
# tar -czvf  merged_wo_header_20220213_25800.tsv.tar.gz  merged_wo_header_20220213_25800.tsv
