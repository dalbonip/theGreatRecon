#!/bin/bash
# $1 dominio.com
# add your GITHUB TOKEN instead of YOURTOKEN
amass enum -d $1 -o amass1 ; chaos -d $1 -o chaos1 -silent ; assetfinder $1 >> assetfinder1 ; subfinder -d $1 -o subfinder1 ; findomain -t $1 -q -u findomain1 ;python3 ~/tools/github-search/github-subdomains.py -t YOURTOKEN -d $1 >> github ; cat assetfinder1 subfinder1 chaos1 amass1 findomain1 subfinder1 github >> hosts ; subfinder -dL hosts -o full -timeout 10 -silent ; httpx -l hosts -silent -threads 9000 -timeout 30 | anew domains ; rm -rf amass1 chaos1 assetfinder1 subfinder1 findomain1  github
