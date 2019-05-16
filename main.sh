#!/bin/bash

dev-vpn-status(){
	tail -f /opt/forticlient-sslvpn/64bit/helper/forticlientsslvpn.log
}

dev-mssh(){
    sshfs $1@$2:/$3 $4
}

dev-(){
	eval "$1"		
}
dev-not(){
	notify-send $1 
}
dev-mkcd(){
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

dev-hosts(){
	sudo vim /etc/hosts
}

dev-gitinit(){
	mkdir -p -- "$1" &&
	cd -P -- "$1" &&
	git init 		
}

dev-open(){
	xdg-open ./
}

dev-php-s(){
	php -S localhost:8181
}

dev-tmux(){
	tmux new-session -d  
    tmux split-window -h
    tmux split-window -v 'alsamixer'
    tmux split-window -h 
    tmux split-window -v
    tmux resize-pane -D 2
    tmux clock-mode  
    tmux resize-pane -L 4
    tmux resize-pane -U 2
    tmux select-pane -t 3
    tmux split-window -v 'htop'
    tmux resize-pane -U 4
    tmux select-pane -t 1 
    tmux split-window -v
    tmux -2 attach -d 
}
dev-theme(){
    /opt/oomox/gui.sh 
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

dev-gitfiles(){
    git whatchanged --name-only --pretty="" origin..HEAD
}

dev-vpn(){
    /opt/forticlient-sslvpn/64bit/forticlientsslvpn_cli connect --server $1:$2 --vpnuser $3 --;
}

dev-pull(){
    git pull origin $1

}

dev-push(){
    git push origin $1
}
dev-com(){
    git commit -m "$1"
}
dev-stat(){
    git status
}
dev-project(){
    subl --command "close_project"; subl --project ~/subl-project/$1.sublime-project
}
