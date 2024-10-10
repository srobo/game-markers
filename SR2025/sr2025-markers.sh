#!/bin/bash
# Arena markers
april_vision marker_generator SINGLE \
    --bottom_margin 50 \
    --marker_size 150 --range 0-27 \
    --description_format "Student Robotics - Arena - #{marker_id}" --all_filename "arena_markers.pdf"
# Green pallets
april_vision marker_generator SINGLE \
    --marker_size 80 --range 100-119 \
    --description_format "Student Robotics - Green Pallet - #{marker_id}" --all_filename "green_pallets.pdf"
april_vision marker_generator TILE \
    --num_rows 3 --num_columns 2 --repeat 6 --page_size A3 \
    --left_margin 10 --top_margin 10 --row_padding 20 --column_padding 20 \
    --marker_size 80 --range 100-119 \
    --description_format "Student Robotics - Green Pallet - #{marker_id}" --all_filename "green_pallets_a3.pdf"
# Orange pallets
april_vision marker_generator SINGLE \
    --marker_size 80 --range 120-139 \
    --description_format "Student Robotics - Orange Pallet - #{marker_id}" --all_filename "orange_pallets.pdf"
april_vision marker_generator TILE \
    --num_rows 3 --num_columns 2 --repeat 6 --page_size A3 \
    --left_margin 10 --top_margin 10 --row_padding 20 --column_padding 20 \
    --marker_size 80 --range 120-139 \
    --description_format "Student Robotics - Orange Pallet - #{marker_id}" --all_filename "orange_pallets_a3.pdf"
# Magenta pallets
april_vision marker_generator SINGLE \
    --marker_size 80 --range 140-159 \
    --description_format "Student Robotics - Magenta Pallet - #{marker_id}" --all_filename "magenta_pallets.pdf"
april_vision marker_generator TILE \
    --num_rows 3 --num_columns 2 --repeat 6 --page_size A3 \
    --left_margin 10 --top_margin 10 --row_padding 20 --column_padding 20 \
    --marker_size 80 --range 140-159 \
    --description_format "Student Robotics - Magenta Pallet - #{marker_id}" --all_filename "magenta_pallets_a3.pdf"
# Yellow pallets
april_vision marker_generator SINGLE \
    --marker_size 80 --range 160-179 \
    --description_format "Student Robotics - Yellow Pallet - #{marker_id}" --all_filename "yellow_pallets.pdf"
april_vision marker_generator TILE \
    --num_rows 3 --num_columns 2 --repeat 6 --page_size A3 \
    --left_margin 10 --top_margin 10 --row_padding 20 --column_padding 20 \
    --marker_size 80 --range 160-179 \
    --description_format "Student Robotics - Yellow Pallet - #{marker_id}" --all_filename "yellow_pallets_a3.pdf"
# Hi-rises
april_vision marker_generator SINGLE \
    --marker_size 80 --range 195-199 \
    --description_format "Student Robotics - Hi-rise - #{marker_id}" --all_filename "hirise_markers.pdf"
april_vision marker_generator TILE \
    --num_rows 2 --num_columns 2 --repeat 4 --page_size A3 \
    --left_margin 20 --top_margin 20 --row_padding 40 --column_padding 40 \
    --marker_size 80 --range 195-199 \
    --description_format "Student Robotics - Hi-rise - #{marker_id}" --all_filename "hirise_markers_a3.pdf"

echo "Collate all the non-A3 marker sheets into a single PDF"
# pdfunite arena_markers.pdf green_pallets.pdf orange_pallets.pdf magenta_pallets.pdf yellow_pallets.pdf hirise_markers.pdf SR2025_markers_a4.pdf
echo "Collate the A3 marker sheets with the arena markers into a single PDF"
# pdfunite arena_markers.pdf green_pallets_a3.pdf orange_pallets_a3.pdf magenta_pallets_a3.pdf yellow_pallets_a3.pdf hirise_markers_a3.pdf SR2025_markers.pdf
