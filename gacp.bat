@echo off
set MSG="New commit"
IF [%1] == [] goto :no_commit_message
set MSG=%1
:no_commit_message
git add .
git commit -m %MSG%
git push