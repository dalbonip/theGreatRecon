#!/bin/bash
# $1 dominio.com
# add your GITHUB TOKEN instead of YOURTOKEN
echo "if you didn´t put your GITHUB TOKEN in next command yet, do it and delete this line :)"
amass enum -d $1 -o 1amass ; chaos -d $1 -o 1chaos -silent ; assetfinder $1 >> 1assetfinder ; subfinder -d $1 -o 1subfinder ; findomain -t $1 -q -u 1findomain ;python3 ~/tools/github-search/github-subdomains.py -t YOURTOKEN -d $1 >> 1github ; cat 1* >> hosts ; subfinder -dL hosts -o full -timeout 10 -silent ; httpx -l hosts -silent -threads 9000 -timeout 30 | anew domains ; rm -rf 1* hosts;