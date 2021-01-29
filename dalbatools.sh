#!/bin/bash

# mkdir tools on user's dir
mkdir ~/tools;
cd ~/tools;

#####installing rust

#if wsl
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
#if linux
curl https://sh.rustup.rs -sSf | sh

#####installing tools dependencies

sudo apt update;
sudo apt install python2 python3 python3-pip git curl jq ruby perl packer rsync fzf wget cargo;

#####instaling go, configuring it into path and making ~/go/ the GOPATH

cd tools;
wget https://golang.org/dl/go1.15.7.linux-amd64.tar.gz;
sudo tar -C /usr/local -xzf go1.15.7.linux-amd64.tar.gz;
export PATH=$PATH:/usr/local/go/bin;
echo "export PATH=\"/usr/local/go/bin:$PATH\"" >> ~/.profile;
echo "export PATH=\"~/go/bin:$PATH\"" >> ~/.profile;
go version;
mkdir ~/go;
mkdir ~/go/bin;
mkdir ~/go/src;
mkdir ~/go/pkg;
GOPATH=~/go;
export GOPATH=~/go;
echo "export GOPATH=~/go" >> ~/.profile;
echo "GOPATH=~/go" >> ~/.profile;
echo "GO PATH ~/go";
echo "Creating ~/tools";
export PATH=$PATH:~/go/bin;
echo "export PATH=\"~/go/bin:$PATH\"" >> ~/.profile;

#####installing phyton2 pip
curl https://bootstrap.pypa.io/2.7/get-pip.py --output /tmp/get-pip.py;
sudo python2 /tmp/get-pip.py;

#####installing go tools

#ffuf
go get -v -u github.com/ffuf/ffuf ;
#anew
go get -v -u github.com/tomnomnom/anew;
#qsreplace
go get -v -u github.com/tomnomnom/qsreplace;
#subfinder
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder;
#gospider
go get -v -u github.com/jaeles-project/gospider;
#amass
GO111MODULE=on go get -v github.com/OWASP/Amass/v3/...;
#hakrawler
go get -v github.com/hakluke/hakrawler;
#gargs
go get -v github.com/brentp/gargs;
#chaos
GO111MODULE=on go get -v github.com/projectdiscovery/chaos-client/cmd/chaos;
#httpx
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx;
#jaeles
GO111MODULE=on go get github.com/jaeles-project/jaeles;
#gf
go get -v -u github.com/tomnomnom/gf;
#unew
go get -v -u github.com/dwisiswant0/unew;
#rush
go get -v -u github.com/shenwei356/rush/;
#jsubfinder
go get -u github.com/hiddengearz/jsubfinder;
wget https://raw.githubusercontent.com/hiddengearz/jsubfinder/master/.jsf_signatures.yaml && mv .jsf_signatures.yaml ~/.jsf_signatures.yaml;
#shuffledns
GO111MODULE=on go get -v github.com/projectdiscovery/shuffledns/cmd/shuffledns;
#haktldextract
go get -v github.com/hakluke/haktldextract;
#gau
GO111MODULE=on go get -u -v github.com/lc/gau;
#nuclei
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei/

#installing other tools which needs more setup
#github-search
git clone https://github.com/gwen001/github-search.git ~/tools/github-search;
python2 -m pip install -r ~/tools/github-search/requirements2.txt;
python2 -m pip install -r ~/tools/github-search/requirements3.txt;
python3 -m pip install -r ~/tools/github-search/requirements2.txt;
python3 -m pip install -r ~/tools/github-search/requirements3.txt;

#findomain
git clone https://github.com/Edu4rdSHL/findomain.git ~/tools/findomain;
cd findomain; cargo build --release;
sudo cp /target/release/findomain /usr/bin/;
findomain;
cd ~/tools/;

#massdns
git clone https://github.com/blechschmidt/massdns.git ~/tools/massdns;
cd ~/tools/massdns/; sudo make; sudo make install;
massdns;
cd ~/tools/;

#Interlace
git clone https://github.com/codingo/Interlace.git ~/tools/interlace;
python3 ~/tools/interlace/setup.py install;

#downloading nuclei templates
nuclei -update-templates

#download all domains to chaos
wget https://raw.githubusercontent.com/KingOfBugbounty/KingOfBugBountyTips/master/downlink ; xargs -a downlink -I@ sh -c 'wget @ -q'; mkdir bounty ; unzip '*.zip' -d bounty/ ; rm -rf *zip ; cat bounty/*.txt >> allbounty ; sort -u allbounty >> domainsBOUNTY ; rm -rf allbounty bounty/ ; echo '@dalbonip'
