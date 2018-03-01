#!/bin/bash
echo "--git " $@ "---" >> ~/.git_history.txt

date >> ~/.git_history.txt
whoami >> ~/.git_history.txt
hostname >> ~/.git_history.txt
git remote -v >> ~/.git_history.txt
pwd >> ~/.git_history.txt
(time git $@) |& tee -a ~/.git_history.txt
