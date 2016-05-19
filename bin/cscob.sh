#!/bin/bash

echo Generating file list...
find . -name "*.[chS]" -print > cscope.files
find . -name "*.cpp" -print >> cscope.files
find . -name "*.re" -print >> cscope.files
echo Generating cscope cross-references...
cscope -b >/dev/null 2>&1
echo Done!
