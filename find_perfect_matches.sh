#!/bin/bash

# Get arguments (query and subject file)
query_file="$1"
subject_file="$2"
output_file="$3"

# Run BLAST using the subject file as the database
blastn -query "$query_file" -subject "$subject_file" -task blastn-short -outfmt "6 sseqid pident length mismatch slen qlen" -out temp_blast.txt

# Count perfect matches
awk ' ($2 == 100 && $3 == $6 && $4 == 0)' temp_blast.txt > $output_file


# Print number of perfect matches

wc -l < $output_file
