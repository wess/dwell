#!/usr/bin/env bash

#
# __echo.sh
# dwell
# 
# Author: Wess Cope (me@wess.io)
# Created: 08/17/2021
# 
# Copywrite (c) 2021 Wess.io
#

COLOR_RESET="\033[0m"
DARK_GRAY="\033[1;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
CHECK_MARK="✔"
CROSS_MARK="✖"
ARROW_MARK="→"
WARNING_MARK="⚠"
INFO_MARK="ℹ"
CIRCLE_MARK="◯"

__colorize() {
  local color=$1
  local text=$@

  echo -e "${color}${text}${COLOR_RESET}"
}

darkgray() {
  while read data; do
    __colorize ${DARK_GRAY} ${data}${COLOR_RESET}
  done
}

red() {
  while read data; do
    __colorize ${RED} ${data}${COLOR_RESET}
  done
}

green() {
  while read data; do
    __colorize ${GREEN} ${data}${COLOR_RESET}
  done
}

yellow() {
  while read data; do
    __colorize ${YELLOW} ${data}${COLOR_RESET}
  done
}

blue() {
  while read data; do
    __colorize ${BLUE} ${data}${COLOR_RESET}
  done
}

purple() {
  while read data; do
    __colorize ${PURPLE} ${data}${COLOR_RESET}
  done
}

cyan() {
  while read data; do
    __colorize ${CYAN} ${data}${COLOR_RESET}
  done
}

success() {
  while read data; do
    echo -e "${GREEN}${CHECK_MARK} $data${COLOR_RESET}"
  done
}

warning() {
  while read data; do
    echo -e "${YELLOW}${WARNING_MARK} $data${COLOR_RESET}"
  done
}

error() {
  while read data; do
    echo -e "${RED}${CROSS_MARK} $data${COLOR_RESET}"
  done
}

muted() {
  while read data; do
    echo -e "${DARK_GRAY}${CIRCLE_MARK} $data${COLOR_RESET}"
  done
}

info() {
  while read data; do
    echo -e "${BLUE}${INFO_MARK} $data${COLOR_RESET}"
  done
}

status() {
  while read data; do
    echo -e "${CYAN}${ARROW_MARK} $data${COLOR_RESET}"
  done
}