#!/bin/bash
# Arena markers
april_vision marker_generator SINGLE \
    --bottom_margin 50 \
    --marker_size 150 --range 0-27 \
    --description_format "Student Robotics - Arena - #{marker_id}" --all_filename "arena_markers.pdf"
# Green tokens
april_vision marker_generator SINGLE \
    --marker_size 80 --range 100-119 \
    --description_format "Student Robotics - Green token - #{marker_id}" --all_filename "green_tokens.pdf"
april_vision marker_generator TILE \
    --num_rows 3 --num_columns 2 --repeat 6 --page_size A3 \
    --left_margin 10 --top_margin 10 --row_padding 20 --column_padding 20 \
    --marker_size 80 --range 100-119 \
    --description_format "Student Robotics - Green token - #{marker_id}" --all_filename "green_tokens_a3.pdf"
# Orange tokens
april_vision marker_generator SINGLE \
    --marker_size 80 --range 120-139 \
    --description_format "Student Robotics - Orange token - #{marker_id}" --all_filename "orange_tokens.pdf"
april_vision marker_generator TILE \
    --num_rows 3 --num_columns 2 --repeat 6 --page_size A3 \
    --left_margin 10 --top_margin 10 --row_padding 20 --column_padding 20 \
    --marker_size 80 --range 120-139 \
    --description_format "Student Robotics - Orange token - #{marker_id}" --all_filename "orange_tokens_a3.pdf"
# Magenta tokens
april_vision marker_generator SINGLE \
    --marker_size 80 --range 140-159 \
    --description_format "Student Robotics - Magenta token - #{marker_id}" --all_filename "magenta_tokens.pdf"
april_vision marker_generator TILE \
    --num_rows 3 --num_columns 2 --repeat 6 --page_size A3 \
    --left_margin 10 --top_margin 10 --row_padding 20 --column_padding 20 \
    --marker_size 80 --range 140-159 \
    --description_format "Student Robotics - Magenta token - #{marker_id}" --all_filename "magenta_tokens_a3.pdf"
# Yellow tokens
april_vision marker_generator SINGLE \
    --marker_size 80 --range 160-179 \
    --description_format "Student Robotics - Yellow token - #{marker_id}" --all_filename "yellow_tokens.pdf"
april_vision marker_generator TILE \
    --num_rows 3 --num_columns 2 --repeat 6 --page_size A3 \
    --left_margin 10 --top_margin 10 --row_padding 20 --column_padding 20 \
    --marker_size 80 --range 160-179 \
    --description_format "Student Robotics - Yellow token - #{marker_id}" --all_filename "yellow_tokens_a3.pdf"
# Pillars
april_vision marker_generator SINGLE \
    --marker_size 80 --range 195-199 \
    --description_format "Student Robotics - Pillar - #{marker_id}" --all_filename "pillar_markers.pdf"
april_vision marker_generator TILE \
    --num_rows 2 --num_columns 2 --repeat 4 --page_size A3 \
    --left_margin 20 --top_margin 20 --row_padding 40 --column_padding 40 \
    --marker_size 80 --range 195-199 \
    --description_format "Student Robotics - Pillar - #{marker_id}" --all_filename "pillar_markers_a3.pdf"

echo "Collate all the non-A3 marker sheets into a single PDF"
# pdfunite arena_markers.pdf green_tokens.pdf orange_tokens.pdf magenta_tokens.pdf yellow_tokens.pdf pillar_markers.pdf SR2025_markers_a4.pdf
echo "Collate the A3 marker sheets with the arena markers into a single PDF"
# pdfunite arena_markers.pdf green_tokens_a3.pdf orange_tokens_a3.pdf magenta_tokens_a3.pdf yellow_tokens_a3.pdf pillar_markers_a3.pdf SR2025_markers.pdf
