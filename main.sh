#!/bin/bash

dvpn-status(){
	tail -f /opt/forticlient-sslvpn/64bit/helper/forticlientsslvpn.log
}

d(){
	eval "dev-$1"		
}
dnot(){
	notify-send $1 
}
dmkcd(){
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

dhosts(){
	sudo vim /etc/hosts
}

dgitinit(){
	mkdir -p -- "$1" &&
	cd -P -- "$1" &&
	git init 		
}

dopen(){
	xdg-open ./
}

dtmux(){
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

dlog(){
	case $1 in 
		"apache")
			tail -f /var/log/apache2/error.log	
	esac	
}
dnote(){
	echo "$1" >> ./log
	cat ./log
}

dgitfiles(){
    git whatchanged --name-only --pretty="" origin..HEAD
}

dvpn(){
    /opt/forticlient-sslvpn/64bit/forticlientsslvpn_cli connect --server $1:$2 --vpnuser $3 --;
}

dpull(){
    git pull origin $1

}

dpush(){
    git push origin $1
}

dproject(){
    subl --command "close_project"; subl --project ~/subl-project/$1.sublime-project
}
