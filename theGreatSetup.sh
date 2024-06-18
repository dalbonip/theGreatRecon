#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "\nSetting up your linux for some recon :)${NC}\n"
echo 'PLEASE "sudo apt update && sudo apt upgrade" FIRST'
sleep 1;
echo -e "\n "
echo -e "\nThis script is for debian based distros (apt install).  it will install GO, RUST, PYTHON, RUBY along recon scripts to GOPATH or /opt. continue?"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
  case $choice in
    yes)
			echo -e "\nOK.${NC}\n"
			sleep 1
			break
			;;
		no)
			echo -e "\nAborting installation..."
			exit 1
			;;
	esac	
done
PS3="Did you update and upgrade your system before running this script? : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
  case $choice in
    yes)
			echo -e "\nOK.${NC}\n"
			sleep 1
			break
			;;
		no)
			echo -e 'PLEASE "sudo apt update && sudo apt upgrade" FIRST'
			exit 1
			;;
	esac	
done

echo -e "\n${GREEN}[+] Updating package list:${NC}\n"
sudo apt update -y;

## setting some path variables for running binaries


cd /opt;
#####Installing rust
echo -e "\n${GREEN}[+] Installing Rust:${NC}\n"
curl https://sh.rustup.rs -sSf | sh

#####Installing tools && dependencies
echo -e "\n${GREEN}[+] Installing Python:${NC}\n"
sudo apt install -y sudo python3 python3-pip python-setuptools
echo -e "\n${GREEN}[+] Installing Ruby:${NC}\n"
sudo apt install -y ruby ruby-dev
sudo apt install -y git gitk curl jq perl packer rsync fzf libcurl4-openssl-dev libssl-dev libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev build-essential libgmp-dev zlib1g-dev build-essential libssl-dev libffi-dev  libldns-dev gitk rename snapd libpcap-dev pipx ntpdate flameshot exiftool nmap
sudo apt install -y sqlmap 2> /dev/null
sudo apt install -y chromium 2> /dev/null
echo -e "\n${GREEN}[+] Installing Go Lang:${NC}\n"

#####instaling go, configuring it into path and making ~/go/ the GOPATH
echo -e "\nWould you like to install GO and link GO binaries to PATH (you only need to do it once)?"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)
					# installing go
					wget https://dl.google.com/go/go1.21.3.linux-amd64.tar.gz -O /tmp/go1.21.3.linux-amd64.tar.gz
					cd /tmp
					sudo tar -xvf /tmp/go1.21.3.linux-amd64.tar.gz
					sudo mv go /usr/local
					sudo ln -s /usr/local/go/bin/go /usr/bin/go
					mkdir $HOME/go
					mkdir $HOME/go/bin
					mkdir $HOME/go/src
					mkdir $HOME/go/pkg
					# go binaries into PATH
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH="$HOME/go/bin:$PATH"

					echo 'export GOROOT=/usr/local/go' >> ~/.reconrc
					echo 'export GOPATH=$HOME/go' >> ~/.reconrc
					echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.reconrc

					sleep 1
					break
					;;
				no)
					echo -e "\nOkay, i Trust you. If you yet cannot run go, please re-run the script accepting this, or run the commands on line 65 to 70 on your own${NC}\n"
					break
					;;
	esac	
done

echo -e "\nWould you like link python binaries to PATH (you only need to do it once)?"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)
					# pip binaries into PATH
					export PATH="$HOME/.local/bin:$PATH"
					echo 'source $HOME/.reconrc' >> ~/.zshrc
					echo 'source $HOME/.reconrc' >> ~/.bashrc
					sleep 1
					break
					;;
				no)
					echo -e "\nContinuing...${NC}\n"
					break
					;;
	esac	
done

# Installing go tools
echo -e "\n${GREEN}[+] Installing Go Tools:${NC}\n"
# ffuf
echo -e "\nInstalling ffuf: ffuf"
go install github.com/ffuf/ffuf/v2@latest

# tomnomnom
echo -e "\nInstalling tomnomnom: anew"
go install -v github.com/tomnomnom/anew@latest

echo -e "\nInstalling tomnomnom: qsreplace"
go install -v github.com/tomnomnom/qsreplace@latest

echo -e "\nInstalling tomnomnom: gf"
go install -v github.com/tomnomnom/gf@latest

echo -e "\nInstalling tomnomnom: html-tools"
go install -v github.com/tomnomnom/hacks/html-tool@latest

echo -e "\nInstalling tomnomnom: assetfinder"
go install -v github.com/tomnomnom/assetfinder@latest

echo -e "\nInstalling tomnomnom: kxss"
go install -v github.com/tomnomnom/hacks/kxss@latest

echo -e "\nInstalling tomnomnom: Burl"
go install -v github.com/tomnomnom/burl@latest

echo -e "\nInstalling tomnomnom: Anti-burl"
go install -v github.com/tomnomnom/hacks/anti-burl@latest

echo -e "\nInstalling tomnomnom: httprobe"
go install -v github.com/tomnomnom/httprobe@latest

echo -e "\nInstalling tomnomnom: unfurl"
go install -v github.com/tomnomnom/unfurl@latest

echo -e "\nInstalling tomnomnom: waybackurls"
go install -v github.com/tomnomnom/waybackurls@latest

echo -e "\nInstalling tomnomnom: filter-resolved"
go install -v github.com/tomnomnom/hacks/filter-resolved@latest

echo -e "\nInstalling tomnomnom: tojson"
go install -v github.com/tomnomnom/hacks/tojson

# projectdiscovery
echo -e "\nInstalling projectdiscovery: subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

echo -e "\nInstalling projectdiscovery: chaos"
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest

echo -e "\nInstalling projectdiscovery: httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

echo -e "\nInstalling projectdiscovery: shuffledns"
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest

echo -e "\nInstalling projectdiscovery: nuclei"
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
nuclei -update-templates

echo -e "\nInstalling projectdiscovery: naabu"
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest

echo -e "\nInstalling projectdiscovery: notify"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest

echo -e "\nInstalling projectdiscovery: katana"
go install -v github.com/projectdiscovery/katana/cmd/katana@latest

# jaeles-project
echo -e "\nInstalling jaeles-project: gospider"
go install -v github.com/jaeles-project/gospider@latest

echo -e "\nInstalling jaeles-project: jaeles"
go install -v github.com/jaeles-project/jaeles@latest

# OWASP
echo -e "\nInstalling OWASP: amass"
go install -v github.com/owasp-amass/amass/v4/...@master

# hakluke
echo -e "\nInstalling hakluke: hakrawler"
go install -v github.com/hakluke/hakrawler@latest

echo -e "\nInstalling hakluke: haktldextract"
go install -v github.com/hakluke/haktldextract@latest

echo -e "\nInstalling hakluke: hakrevdns"
go install -v github.com/hakluke/hakrevdns@latest

echo -e "\nInstalling hakluke: haklistgen"
go install -v github.com/hakluke/haklistgen@latest

# brentp
echo -e "\nInstalling brentp: gargs"
go install -v github.com/brentp/gargs@latest

# lc
echo -e "\nInstalling lc: gau"
go install -v github.com/lc/gau/v2/cmd/gau@latest

echo -e "\nInstalling lc: subjs"
go install -v github.com/lc/subjs@latest

# dwisiswant0
echo -e "\nInstalling dwisiswant0: unew"
go install -v github.com/dwisiswant0/unew@latest

# shenwei356
echo -e "\nInstalling shenwei356: rush"
go install -v github.com/shenwei356/rush/@latest

# hiddengearz
echo -e "\nInstalling hiddengearz: jsubfinder"
go install -v github.com/hiddengearz/jsubfinder@latest
wget https://raw.githubusercontent.com/hiddengearz/jsubfinder/master/.jsf_signatures.yaml -O ~/.jsf_signatures.yaml

# hahwul
echo -e "\nInstalling hahwul: dalfox"
go install -v github.com/hahwul/dalfox@latest

# chromedp
echo -e "\nInstalling chromedp: chromedp"
go install -v github.com/chromedp/chromedp@latest

# ferreiraklet
echo -e "\nInstalling ferreiraklet: airixss"
go install -v github.com/ferreiraklet/airixss@latest

# edoardottt
echo -e "\nInstalling edoardottt: cariddi"
go install -v github.com/edoardottt/cariddi@latest

# takshal
echo -e "\nInstalling takshal: freq"
go install -v github.com/takshal/freq@latest

# sensepost
echo -e "\nInstalling sensepost: gowitness"
go install -v github.com/sensepost/gowitness@latest

# deletescape
echo -e "\nInstalling deletescape: goop"
go install -v github.com/deletescape/goop@latest

# 003random
echo -e "\nInstalling 003random: getJS"
go install -v github.com/003random/getJS@latest

# detectify
echo -e "\nInstalling detectify: page-fetch"
go install -v github.com/detectify/page-fetch@latest

# erickfernandox
echo -e "\nInstalling erickfernandox: slicepathsurl"
go install -v github.com/erickfernandox/slicepathsurl@latest

# dwisiswant0
echo -e "\nInstalling dwisiswant0: cf-check"
go install -v github.com/dwisiswant0/cf-check@latest

# J3ssie
echo -e "\nInstalling J3ssie: metabigor"
go install -v https://github.com/j3ssie/metabigor@latest

# HuntDownProject
echo -e "\nInstalling hednsextractor: hednsextractor"
go install -v github.com/HuntDownProject/hednsextractor/cmd/hednsextractor@latest

# ropnop
echo -e "\nInstalling ropnop: kerbrute"
go install -v github.com/ropnop/kerbrute@master

## Installing Rust tools
echo -e "\n${GREEN}[+] Installing Rust Tools:${NC}\n"
#findomain
echo -e "\nInstalling findomain"
sudo git clone https://github.com/Edu4rdSHL/findomain.git /opt/findomain;
cd findomain; cargo build --release;
sudo cp ./target/release/findomain /usr/bin/;
findomain;
cd /opt/;

echo -e "\nInstalling nthim"
cargo install NtHiM;

echo -e "\nInstalling Sh1Yo x8"
cargo install x8;

#Installing python tools
echo -e "\nInstalling Python tools"
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade setuptools
python3 -m pip install --upgrade wheel
python3 -m pip install --upgrade twine
python3 -m pip install --upgrade pyinstaller
python3 -m pip install dnsgen
python3 -m pip install impacket
python3 -m pip install bhedak
python3 -m pip install shodan
python3 -m pip install certipy-ad

echo -e "\nInstalling github search on /opt/github-search"
sudo git clone https://github.com/gwen001/github-search.git /opt/github-search;
python3 -m pip install -r /opt/github-search/requirements.txt;

echo -e "\nInstalling Interlace"
sudo git clone https://github.com/codingo/Interlace.git /opt/interlace;
sudo python3 /opt/interlace/setup.py install;

echo -e "\nInstalling Git-Dumper"
sudo git clone https://github.com/arthaud/git-dumper.git /opt/git-dumper;
python3 -m pip install -r /opt/git-dumper/requirements.txt;

echo -e "\nInstalling paramspider"
sudo git clone https://github.com/devanshbatham/ParamSpider.git /opt/paramspider;
python3 -m pip install -r /opt/paramspider/requirements.txt;

echo -e "\nInstalling secretfinder.py"
sudo git clone https://github.com/m4ll0k/SecretFinder.git /opt/SecretFinder;
python3 -m pip install -r /opt/SecretFinder/requirements.txt

echo -e "\nInstalling XSSstrike.py"
sudo git clone https://github.com/s0md3v/XSStrike.git /opt/XSStrike;
python3 -m pip install -r /opt/XSStrike/requirements.txt

echo -e "\nInstalling linkfinder.py"
sudo git clone https://github.com/GerbenJavado/LinkFinder.git /opt/LinkFinder;
python3 -m pip install -r /opt/LinkFinder/requirements.txt
sudo python3 /opt/LinkFinder/setup.py install

echo -e "\nInstalling JSScanner"
sudo git clone https://github.com/0x240x23elu/JSScanner.git /opt/JSScanner;
python3 -m pip install -r /opt/JSScanner/requirements.txt;

echo -e "\nInstalling Arjun"
sudo git clone https://github.com/s0md3v/Arjun.git /opt/Arjun;
sudo python3 /opt/Arjun/setup.py install;

echo -e "\nInstalling JSParser"
sudo git clone https://github.com/nahamsec/JSParser.git /opt/JSParser;
sudo python /opt/JSParser/setup.py install

echo -e "\nInstalling Sublist3r"
sudo git clone https://github.com/aboul3la/Sublist3r.git /opt/Sublist3r;
pip install -r /opt/Sublist3r/requirements.txt

echo -e "\nInstalling asnlookup"
sudo git clone https://github.com/yassineaboukir/asnlookup.git /opt/asnlookup
pip install -r /opt/asnlookup/requirements.txt

echo -e "\nInstalling sqlmap"
sudo git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev /opt/sqlmap;

echo -e "\nInstalling knock.py"
sudo git clone https://github.com/guelfoweb/knock.git /opt/knock;

echo -e "\nInstalling CrackMapExec and NetExec"
wget https://github.com/byt3bl33d3r/CrackMapExec/releases/download/v5.4.0/cme-ubuntu-latest-3.11.zip -O /tmp/cme.zip;
unzip /tmp/cme.zip -d /tmp/cme/
sudo mv /tmp/cme/cme /usr/local/bin/cme
wget https://github.com/Pennyw0rth/NetExec/releases/download/v1.2.0/nxc -O /usr/local/bin/nxc

## Installing Ruby Tools
echo -e "\n${GREEN}[+] Installing Ruby Tools:${NC}\n"

echo -e "\nInstalling wpscan"
sudo git clone https://github.com/wpscanteam/wpscan.git /opt/wpscan;
cd wpscan*
sudo gem install bundler && bundle install --without test
cd /opt/

sudo gem install logger
sudo gem install stringio
sudo gem install winrm
sudo gem install builder
sudo gem install erubi
sudo gem install gssapi
sudo gem install gyoku
sudo gem install httpclient
sudo gem install logging
sudo gem install little-plugger
sudo gem install nori
sudo gem install rubyntlm
sudo gem install winrm-fs
sudo gem install evil-winrm

## Clonning usefull Repos of .sh tools or wordlists
echo -e "\n${GREEN}[+] Installing Extra Tools and Repos:${NC}\n"

echo -e "\nInstalling teh_s3_bucketeers"
sudo git clone https://github.com/tomdev/teh_s3_bucketeers.git /opt/teh_s3_bucketeers;

echo -e "\nInstalling dirsearch"
sudo git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch;

echo -e "\nInstalling lazys3"
sudo git clone https://github.com/nahamsec/lazys3.git /opt/lazys3;

echo -e "\nInstalling virtual host discovery"
sudo git clone https://github.com/jobertabma/virtual-host-discovery.git /opt/virtual-host-discovery;

echo -e "\nInstalling lazyrecon"
sudo git clone https://github.com/nahamsec/lazyrecon.git /opt/lazyrecon

echo -e "\nInstalling crtndstry"
sudo git clone https://github.com/nahamsec/crtndstry.git /opt/crtndstry

echo -e "\nInstalling Seclists"
sudo git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists

echo -e "\nInstalling SharpCollections"
sudo git clone https://github.com/Flangvik/SharpCollection.git  /opt/SharpCollection

echo -e "\nInstalling massdns"
sudo git clone https://github.com/blechschmidt/massdns.git /opt
cd /opt/massdns
sudo make
cd /opt/

echo -e "\nInstalling urldedupe"
sudo curl https://github.com/ameenmaali/urldedupe/releases/download/v1.0.4/urldedupe -o /usr/local/bin/urldedupe

echo -e "\nInstalling xray"
wget https://github.com/chaitin/xray/releases/download/1.9.11/xray_linux_amd64.zip -O /tmp/xray.zip;
unzip /tmp/xray.zip -d /tmp/xraydir/
sudo mv /tmp/xraydir/xray_linux_amd64 /usr/local/bin/xray

#Getting all tools of https://github.com/KingOfBugbounty/Bug-Bounty-Toolz into our /opt dir :)
echo -e "\nGetting all tools on KingOfBugBounty/Bug-Bouty-Toolz on our dir :)"
sudo git clone https://github.com/KingOfBugbounty/Bug-Bounty-Toolz.git /opt/bbtools
sudo mv /opt/bbtools/* /opt/.
sudo rm -r /opt/bbtools
sudo rm /opt/README.md

sudo chmod +x /opt/*
sudo chmod +x /usr/local/bin/*

echo -e "\nInstalling Chromium if you are on ubuntu"
sudo snap install chromium 2> /dev/null;

echo -e "\n\n${GREEN}Done! All tools here:${NC}\n"
echo -e "\nTolls in /OPT:"
ls -A /opt/* -d --group-directories-first -X --color=auto;
echo -e "\nTolls in $HOME/GO/BIN:\n"
ls -A ~/go/bin/* -d --group-directories-first -X --color=auto;
echo -e "\nTolls in /USR/LOCAL/BIN:\n"
ls -A /usr/local/bin/* -d --group-directories-first -X --color=auto;
echo -e "\nTolls in $HOME/.LOCAL/BIN:\n"
ls -A ~/.local/bin/* -d --group-directories-first -X --color=auto;
echo -e "\n\n\n"
echo -e "\n- Don't forget to set up AWS credentials in ~/.aws/!"
echo -e "\n- Don't forget to set up GITHUB Token in your OFJAAAAH.sh script!"
echo -e "\n- Finally, initialize the Shodan CLI with your API key: $ shodan init YOUR_API_KEY"
echo -e "\n"
echo -e "\nin order to install Axion, set up a vps and Security trails acc and run the installation script:"
echo -e "\n$ bash <(curl -s https://raw.githubusercontent.com/pry0cc/axiom/master/interact/axiom-configure)"
echo -e "\n"
echo -e "\nping me at twitter @dalbonip :] "
