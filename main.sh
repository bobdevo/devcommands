#!/bin/bash



dev(){
	eval "dev-$1"		
}

dev-mkcd(){
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

dev-hosts(){
	sudo vim /etc/hosts
}

dev-git-init(){
	mkdir -p -- "$1" &&
	cd -P -- "$1" &&
	git init 		
}

dev-open(){
	xdg-open ./
}

dev-tmux(){
	tmux new-session -d  
	tmux split-window -v 'top'
	tmux split-window -h 	
	tmux -2 attach -d 
}

dev-projects(){
	cd ~/projects
	ls -l
}

dev-log(){
	case $1 in 
		"apache")
			tail -f /var/log/apache2/error.log	
	esac	
}
dev-note(){
	echo "$1" >> ./log
	cat ./log
}

dev-git-files(){
    git whatchanged --name-only --pretty="" origin..HEAD
}

dev-vpn(){
/opt/forticlient-sslvpn/64bit/forticlientsslvpn_cli connect --server $1:$2 --vpnuser $3 -- 
}
