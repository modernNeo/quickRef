#!/bin/bash

echo -e "listing files [1]\t\tgit [2]\t\tAUR install [3\t\tmount external [4]\t\tmount MacBook [5]"

read option
if [ $option -eq 1 ]; then
	echo "du -sh *"
elif [ $option -eq 2 ]; then
	echo -e "save and commit changes [1]\t\t create branch [2]\t\t switch branch [3]\t\tcreate repo [4]\t\tmore info [5]"
	read gitOption
	if [ $gitOption -eq 1 ]; then
		echo "save local changes and push them to server"
		echo "git add -A"
		echo "gi commit -m "what are the lastest changes""
		echo "git push"
	elif [ $gitOption -eq 2 ]; then
		echo "create copy of current branch and call it feature1"
		echo "git branch feature1"
	elif [ $gitOption -eq 3 ]; then
		echo "switch to branch feature1"
		echo "git checkout feature1"
	elif [ $gitOption -eq 4 ]; then
		echo "git init"
		echo "vi README.md"
		echo "git add ."
		echo "git commit -m \" First commit\""
		echo "git remote add origin *remote repository URL*"
		echo "git remote -v -> verifies new remote URL"
		echo "git push -u origin master"
	elif [ $gitOption -eq 5 ]; then
		echo "More Info: http://tutorialzine.com/2016/06/learn-git-in-30-minutes/"
	fi
elif [ $option -eq 3 ]; then
	echo "Download snapshot link"
	echo "wget https://aur.archlinux.org/cgit/aur.git/snapshot/dropbox.tar.gz"
	echo "tar xvf dropbox.tar.gz"
	echo "makepkg"
	echo "sudo pacman -U dropbox-23.4.18-1-x86_64.pkg.tar.xz"
	echo "https://www.youtube.com/watch?v=xXpO6jsbrF0&t=611s"
elif [ $option -eq 4 ]; then
	echo "lsblk -f"
	echo "sudo mount UUID=5b09bc13-41e4-350f-b021-e1c5e59940fb /mnt/jason-hard_drive/"
elif [ $option -eq 5 ]; then
	echo "sudo mount -t cifs //192.168.1.64/Macintosh\ HD /mnt/jason-macbook -o user="Jason Manshad""
fi




