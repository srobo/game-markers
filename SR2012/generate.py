#!/usr/bin/env python

import sys

# add libkoki/tools to path to allow inclusion of markergen
sys.path.insert(0, "libkoki/tools/")
from markergen import *

# DIMENSIONS

ARENA_WIDTH        = 250 # mm
TOKEN_WIDTH        = 100 # mm
BUCKET_WIDTH       = 100 # mm
ROBOT_WIDTH        = 100 # mm

ARENA_MARGIN_LEFT  = 5 # mm
ARENA_MARGIN_TOP   = 5 # mm
TOKEN_MARGIN_LEFT  = 5 # mm
TOKEN_MARGIN_TOP   = 5 # mm
BUCKET_MARGIN_LEFT = 5 # mm
BUCKET_MARGIN_TOP  = 5 # mm
ROBOT_MARGIN_LEFT  = 5 # mm
ROBOT_MARGIN_TOP   = 5 # mm

A4_WIDTH           = 210 # mm
A4_HEIGHT          = 297 # mm

A3_WIDTH           = 297 # mm
A3_HEIGHT          = 420 # mm


# FILE NAMES

SET_A_DIR          = "marker_set_a/"
SET_B_DIR          = "marker_set_b/"

ARENA_PREFIX       = "arena-"
TOKEN_PREFIX       = "token-"
BUCKET_SIDE_PREFIX = "bucket-side-"
BUCKET_END_PREFIX  = "bucket-end-"
ROBOT_PREFIX       = "robot-"


# DESCRIPTIONS

ARENA_DESC       = "ARENA"
TOKEN_DESC       = "TOKEN"
BUCKET_SIDE_DESC = "BUCKET SIDE"
BUCKET_END_DESC  = "BUCKET END"
ROBOT_DESC       = "ROBOT"



def dir_from_code(code):

    if code >= 0 and code < 100:
        return SET_A_DIR

    elif code >= 100 and code < 200:
        return SET_B_DIR

    else:
        return None



def desc_from_code(code):

    if code >= 100:
        code -= 100

    if code <= 27:
        return ARENA_DESC

    elif code <= 31:
        return ROBOT_DESC

    elif code <= 71:
        return TOKEN_DESC

    elif code <= 75:
        return BUCKET_SIDE_DESC

    elif code <= 79:
        return BUCKET_END_DESC

    else:
        return None


def prefix_from_code(code):

    if code >= 100:
        code -= 100

    if code <= 27:
        return ARENA_PREFIX

    elif code <= 31:
        return ROBOT_PREFIX

    elif code <= 71:
        return TOKEN_PREFIX

    elif code <= 75:
        return BUCKET_SIDE_PREFIX

    elif code <= 79:
        return BUCKET_END_PREFIX

    else:
        return None



def paper_size_from_code(code):

    if code >= 100:
        code -= 100

    if code <= 27:
        return "A3"

    else:
        return "A4"



def marker_width_from_code(code):

    if code >= 100:
        code -= 100

    if code <= 27:
        return ARENA_WIDTH

    else:
        return TOKEN_WIDTH # same for all others, currently


def margins_from_code(code):

    if code >= 100:
        code -= 100

    if code <= 27:
        return (ARENA_MARGIN_LEFT, ARENA_MARGIN_TOP)

    elif code <= 31:
        return (ROBOT_MARGIN_LEFT, ROBOT_MARGIN_TOP)

    elif code <= 71:
        return (TOKEN_MARGIN_LEFT, TOKEN_MARGIN_TOP)

    elif code <= 75:
        return (BUCKET_MARGIN_LEFT, BUCKET_MARGIN_TOP)

    elif code <= 79:
        return (BUCKET_MARGIN_LEFT, BUCKET_MARGIN_TOP)

    else:
        return None




def gen_generic(num, four_up=True):

    paper_size = paper_size_from_code(num)
    width = 0
    height = 0

    if paper_size == "A4":
        width = A4_WIDTH
        height = A4_HEIGHT

    elif paper_size == "A3":
        width = A3_WIDTH
        height = A3_HEIGHT


    s = get_pdf_surface(mm_to_pt(width),
                        mm_to_pt(height),
                        "%s%s%03d.pdf" % (dir_from_code(num), prefix_from_code(num), num))

    marker_width = marker_width_from_code(num)
    margins = margins_from_code(num)
    margin_left = margins[0]
    margin_top = margins[1]

    if four_up:

        render_marker(s, num,
                      mm_to_pt(marker_width),
                      mm_to_pt(margin_left),
                      mm_to_pt(margin_top),
                      desc_from_code(num))

        render_marker(s, num,
                      mm_to_pt(marker_width),
                      mm_to_pt(margin_left) + mm_to_pt(marker_width),
                      mm_to_pt(margin_top),
                      desc_from_code(num))

        render_marker(s, num,
                      mm_to_pt(marker_width),
                      mm_to_pt(margin_left),
                      mm_to_pt(margin_top) + mm_to_pt(marker_width),
                      desc_from_code(num))

        render_marker(s, num,
                      mm_to_pt(marker_width),
                      mm_to_pt(margin_left) + mm_to_pt(marker_width),
                      mm_to_pt(margin_top) + mm_to_pt(marker_width),
                      desc_from_code(num))

    else:

        render_marker(s, num,
                      mm_to_pt(marker_width),
                      mm_to_pt((width  - marker_width) / 2),
                      mm_to_pt((height - marker_width) / 2),
                      desc_from_code(num))


    finish_surface(s)


def gen_arena():
    for i in range(0, 28):
        gen_generic(i, False)
        gen_generic(i+100, False)


def gen_robot():
    for i in range(28, 32):
        gen_generic(i)
        gen_generic(i+100)


def gen_token():
    for i in range(32, 72):
        gen_generic(i)
        gen_generic(i+100)


def gen_bucket_side():
    for i in range(72, 76):
        gen_generic(i)
        gen_generic(i+100)


def gen_bucket_end():
    for i in range(76, 80):
        gen_generic(i)
        gen_generic(i+100)



def gen_all():

    gen_arena()
    gen_robot()
    gen_token()
    gen_bucket_side()
    gen_bucket_end()



if __name__ == '__main__':
    gen_all()
