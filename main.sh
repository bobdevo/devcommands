#!/bin/bash

dvpn-status(){
	tail -f /opt/forticlient-sslvpn/64bit/helper/forticlientsslvpn.log
}

dmssh(){
    sshfs $1@$2:/$3 $4
}

dhtml(){
	echo "Do you really know what you're doing? (y) or (n)."
	read choice
	echo    # (optional) move to a new line
	if [[ $choice =~ ^[Yy]$ ]]
	then
	    # do dangerous stuff

	    mkdir ./css
	    mkdir ./images
	    mkdir ./javascript
	    mkdir ./partials
	    mkdir ./fonts
	    mkdir ./pages
	    mkdir ./layout
	    touch ./css/style.css
	    touch ./javascript/script.js
	    touch ./index.php
	    touch ./partials/head.php
	    touch ./partials/header.php
	    touch ./partials/footer.php
	    touch ./layout/default.php
	    touch ./pages/home.php
  	  	# touch ./pages/_contact.php
  	fi

}

d(){
	eval "$1"
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

dphp-s(){
	php -S localhost:8181
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
dtheme(){
    /opt/oomox/gui.sh
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
dcom(){
    git commit -m "$1"
}
dstat(){
    git status
}
dproject(){



    if test ! -d ~/subl-project
    then
        mkdir ~/subl-project
    fi

    if test ! -d ~/subl-project/$1.sublime-project
    then
        echo "{}" > ~/subl-project/$1.sublime-project
    else
        subl --command "close_project"; subl --project ~/subl-project/$1.sublime-project
    fi

}
