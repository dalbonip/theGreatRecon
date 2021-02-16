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
sudo apt install -y python2 python3 python3-pip git curl jq ruby perl packer rsync fzf wget cargo;
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs


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
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei/;
#html-tools
go get -u -v github.com/tomnomnom/hacks/html-tool;
#dalfox
go get -u -v github.com/hahwul/dalfox;
#assetfinder
go get -u -v github.com/tomnomnom/assetfinder
#kxss
go get -v github.com/tomnomnom/hacks/kxss

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

#Interlace
git clone https://github.com/codingo/Interlace.git ~/tools/interlace;
python3 ~/tools/interlace/setup.py install;

#downloading nuclei templates
nuclei -update-templates

#download all domains to chaos
wget https://raw.githubusercontent.com/KingOfBugbounty/KingOfBugBountyTips/master/downlink ; xargs -a downlink -I@ sh -c 'wget @ -q'; mkdir bounty ; unzip '*.zip' -d bounty/ ; rm -rf *zip ; cat bounty/*.txt >> allbounty ; sort -u allbounty >> domainsBOUNTY ; rm -rf allbounty bounty/ ; echo '@dalbonip'

#install paramspider
echo "installing paramspider"
cd ~/tools;
git clone https://github.com/devanshbatham/ParamSpider.git ~/tools/paramspider;
cd ~/tools/paramspider;
python3 -m pip install -r requirements.txt;
echo "done"

#install ntHiM
echo "installing nthim"
cargo install NtHiM
echo "done"

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"

cd ~/tools/
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"


echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "done"


echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "done"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"


echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"


echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"

echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"



echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
