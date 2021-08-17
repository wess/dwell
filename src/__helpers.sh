#!/usr/bin/env bash

#
# __helpers.sh
# dwell
# 
# Author: Wess Cope (me@wess.io)
# Created: 08/17/2021
# 
# Copywrite (c) 2021 Wess.io
#


define(){ IFS='\n' read -r -d '' ${1} || true; }

