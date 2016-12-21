#!/bin/bash
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


