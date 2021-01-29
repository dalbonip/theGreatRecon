#!/bin/bash
mkdir ~/tools;
cd ~/tools;

#####installing rust

#if wsl
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
#if linux
curl https://sh.rustup.rs -sSf | sh

#####installing dependencies

sudo apt update;
sudo apt install python2 python3 python3-pip git curl jq ruby perl packer rsync fzf wget cargo;

#####instaling go

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
echo "export GOPATH=~/go" >> ~/.profile;
echo "GOPATH=~/go" >> ~/.profile;
echo "GO PATH ~/go";
echo "Creating ~/tools";
echo "export PATH=~/go/bin" >> ~/.profile;

#####installing phyton2 pip
curl https://bootstrap.pypa.io/2.7/get-pip.py --output /tmp/get-pip.py;
sudo python2 /tmp/get-pip.py;

#####installing go tools

go get -v -u github.com/ffuf/ffuf ;
go get -v -u github.com/tomnomnom/anew;
go get -v -u github.com/tomnomnom/qsreplace;
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder;
go get -v -u github.com/jaeles-project/gospider;
GO111MODULE=on go get -v github.com/OWASP/Amass/v3/...;
go get -v github.com/hakluke/hakrawler;
go get -v github.com/brentp/gargs;
GO111MODULE=on go get -v github.com/projectdiscovery/chaos-client/cmd/chaos;
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx;
GO111MODULE=on go get github.com/jaeles-project/jaeles;
go get -v -u github.com/tomnomnom/gf;
go get -v -u github.com/dwisiswant0/unew;
go get -v -u github.com/shenwei356/rush/;
go get -u github.com/hiddengearz/jsubfinder;
wget https://raw.githubusercontent.com/hiddengearz/jsubfinder/master/.jsf_signatures.yaml && mv .jsf_signatures.yaml ~/.jsf_signatures.yaml;
GO111MODULE=on go get -v github.com/projectdiscovery/shuffledns/cmd/shuffledns;
go get -v github.com/hakluke/haktldextract;
GO111MODULE=on go get -u -v github.com/lc/gau;

#installing other tools which needs setup
git clone https://github.com/gwen001/github-search.git ~/tools/github-search;
python2 -m pip install -r ~/tools/github-search/requirements2.txt;
python2 -m pip install -r ~/tools/github-search/requirements3.txt;
python3 -m pip install -r ~/tools/github-search/requirements2.txt;
python3 -m pip install -r ~/tools/github-search/requirements3.txt;

git clone https://github.com/Edu4rdSHL/findomain.git ~/tools/findomain;
cd findomain; cargo build --release;
sudo cp /target/release/findomain /usr/bin/;
findomain;
cd ~/tools/;

echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc;
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf;

git clone https://github.com/blechschmidt/massdns.git ~/tools/massdns;
cd ~/tools/massdns/; sudo make; sudo make install;
massdns;
cd ~/tools/
git clone https://github.com/codingo/Interlace.git ~/tools/interlace;
python3 ~/tools/interlace/setup.py install
