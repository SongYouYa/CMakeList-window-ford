#!/bin/sh
echo $PWD
echo "Dawson"

slay -f navigation
slay -f EntitySearch_qnx
slay -f fordhmi
export LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH
export HMI_APP_THEME_BASE=${PWD}/AppThemeData/8inch
export HMI_THEME_BASE=/fs/storage/usr/hmithemes



./starhmi 2>log.txt 
