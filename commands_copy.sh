#!/bin/bash
output="listing files [1]\ngit [2]\nAUR install [3]\nmount external [4]\nmount MacBook [5]"
output+="\nMount USB to WSL[6]"
echo -e $output

read option
if [ $option -eq 1 ]; then
	echo "du -sh *"
elif [ $option -eq 2 ]; then
	output="\tCreate a repo [1]\n\t\tConfig git user name and email [2]\n\t\tGit add repo url [3]"
	output+="\n\t\tVerify git url [4]\n\t\tSet origin\\\\branch for upstream [5]"
	output+="\n\tDetermine which branches are tracking what [6]\n\tCreate branch [7]"
	output+="\n\tSwitch branch [8]\n\tCombo of above 2 commands [9]\n\tSwitching to the previous branch [10]"
	output+="\n\tSave and commit changes [11]\n\tPull a single file from server repo [12]"
	output+="\n\tdiscard any local commits [13]\n\tdeleting branch [14]\n\tgit refresh remote branches[15]"
	output+="\n\tgit cleaning [16]\n\tmore info [17]"
	#https://stackoverflow.com/a/3882696
	#https://stackoverflow.com/questions/1955505/parsing-json-with-unix-tools
	echo -e $output
	read gitOption
	if [ $gitOption -eq 1 ]; then
		echo "git init"
		echo "git config --local user.name \"Jace Manshadi\""
		echo "git config -local user.email \"j_manshad@sfu.ca\""
		echo "# <repo_name> >> README.md"
		echo "git add ."
		echo "git commit -m \" First commit\""
		echo "git remote add origin *remote repository URL*"
		echo "git remote -v -> verifies new remote URL"
		echo "git push -u origin master"
	elif [ $gitOption -eq 2 ]; then
		echo "config singular repo"
		echo "git config --local user.name \"Jace Manshadi\""
		echo "git config -local user.email \"j_manshad@sfu.ca\""
		echo "config all repos"
		echo "git config --global user.name \"Jace Manshadi\""
		echo "git config --global user.email \"j_manshad@sfu.ca\""
	elif [ $gitOption -eq 3 ]; then
		echo "git remote add origin *remote repository URL*"
	elif [ $gitOption -eq 4 ]; then
		 echo "git remote -v -> verifies new remote URL"
	elif [ $gitOption -eq 5 ]; then
		echo "git branch --set-upstream-to origin/branch"
	elif [ $gitOption -eq 6 ]; then
		echo "git branch -vv"
	elif [ $gitOption -eq 7 ]; then
		echo "create copy of current branch and call it feature1"
		echo "git branch feature1"
	elif [ $gitOption -eq 8 ]; then
		echo "switch to branch feature1"
		echo "git checkout feature1"
	elif [ $gitOption -eq 9 ]; then
		echo "combination of above 2 actions"
		echo "git checkout -b <new_branch_name>"
	elif [ $gitOption -eq 10 ];then
		echo "checking out the previously checkout out branch"
		echo "\`git checkout\` - OR \`git checkout @{-1}\`"
	elif [ $gitOption -eq 11 ]; then
		echo "save local changes and push them to server"
		echo "git add -A"
		echo "gi commit -m "what are the lastest changes""
		echo "git push"
	elif [ $gitOption -eq 12 ]; then
		echo "git fetch -> will download all the recent changes, but it will not put it in your current checked out code (working area)."
		echo "git checkout origin/master -- path/to/file -> will checkout the particular file from the the downloaded changes (origin/master)."
	elif [ $gitOption -eq 13 ]; then
		echo "git checkout master"
		echo "git reset --hard origin/master"
	elif [ $gitOption -eq 14 ]; then
		echo "git branch -D <local_branch>"
		echo "git push origin --delete <remote_branch>"
	elif [ $gitOption -eq 15 ]; then
		echo "git remote update origin --prune"
	elif [ $gitOption -eq 16 ]; then
		echo "git clean -d -x -f"
		echo "will remove untracked files, including directories (-d) and files ignored by git (-x). Replace the -f argument with -n to perform a dry-run or -i for interactive mode and it will tell you what will be removed."
		echo "https://stackoverflow.com/a/675797"
	elif [ $gitOption -eq 17 ]; then
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
elif [ $option -eq 6 ]; then
	~/GitHub/quickRef/connect_usb.sh
fi