#!/bin/sh
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Copyright (C) 2008  Wen-Yen Chuang <caleb AT calno DOT com>

SHOWVTE_PROG_NAME=`grep PROGRAM_NAME src/config.h | tr -s ' ' ' ' | sed 's/^ //' | grep -v ^\/\/ | awk '{print $3}' | sed 's/"//g'`
if [ "$SHOWVTE_PROG_NAME" = "" ]; then
  SHOWVTE_PROG_NAME="evilvte"
fi

SHOWVTE_PROG_VERSION=`grep PROGRAM_VERSION src/config.h | grep -v ^\/\/ | awk '{print $3}'`
if [ "$SHOWVTE_PROG_VERSION" = "" ]; then
  SHOWVTE_VERSION=`head -n 1 Changelog`
else
  SHOWVTE_VERSION=$SHOWVTE_PROG_VERSION
fi

echo echo Configuration of $SHOWVTE_PROG_NAME $SHOWVTE_VERSION:

exit

if [ "$1" = "-v" ]; then
  SHOWVTE_VERSION=`grep ^echo $0 | cut -d : -f 1 | cut -d ' ' -f 5`
  echo showvte, version $SHOWVTE_VERSION
  exit
fi

grep ^#define $0 | sed -e 's/TRUE/[1m[32mTRUE[m/' -e 's/FALSE/[1m[31mFALSE[m/'