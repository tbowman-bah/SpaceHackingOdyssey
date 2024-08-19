#!/usr/bin/env bash
set -e

# quick reference to enable git lfs which supports large file systems
# this is to support the reference pdfs and powerpoint presentation
#
# navigate to repo directory and install lfs
echo "git lfs install"
# tell lfs what files you want it to track
echo "git lfs track \"files/*.pdf\""
echo "git lfs track \"files/*.ppt*\""
echo "git lfs track \"content/*.pdf\""
echo "git lfs track \"content/*.ppt*\""
# don't forget to add the ".gitattributes" file to your commit
echo "git add .gitattributes"
# commit statement
echo "git commit -m \"install and enable git lfs to track pdf and ppt* documents in the files directory\""
echo "git push"


