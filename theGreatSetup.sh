#!/bin/bash
echo "setting up your linux for some recon :)"
sleep 2;
sudo apt update;
# mkdir tools on user's dir
mkdir ~/tools;
cd ~/tools;

#####installing rust

#if wsl
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;

#if linux
curl https://sh.rustup.rs -sSf | sh

#####installing tools && dependencies

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
sudo apt-get install -y git gitk
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt-get install -y snapd


#####instaling go, configuring it into path and making ~/go/ the GOPATH

cd tools;

if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://golang.org/dl/go1.15.7.linux-amd64.tar.gz
					sudo tar -xvf go1.15.7.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.profile
					echo 'export GOPATH=$HOME/go'	>> ~/.profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.profile	
					source ~/.profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi

#####installing phyton2-pip
curl https://bootstrap.pypa.io/2.7/get-pip.py --output /tmp/get-pip.py;
sudo python2 /tmp/get-pip.py;

#####installing go tools

#install ffuf
echo "Installing ffuf"
go get -u github.com/ffuf/ffuf
echo "Done"

#install anew
echo "Installing anew"
go get -u github.com/tomnomnom/anew
echo "Done"

#install qsreplace
echo "Installing qsreplace"
go get -u github.com/tomnomnom/qsreplace
echo "Done"

#install subfinder
echo "Installing subfinder"
GO111MODULE=on go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder
echo "Done"

#install gospider
echo "Installing gospider"
go get -u github.com/jaeles-project/gospider
echo "Done"

#install amass
echo "Installing amass"
GO111MODULE=on go get github.com/OWASP/Amass/v3/...;
echo "Done"

#install hakrawler
echo "Installing hakrawler"
go get github.com/hakluke/hakrawler
echo "Done"

#install gargs
echo "Installing gargs"
go get github.com/brentp/gargs
echo "Done"

#install chaos
echo "Installing chaos"
GO111MODULE=on go get github.com/projectdiscovery/chaos-client/cmd/chaos
echo "Downloading Domain to bounty chaos"
wget https://raw.githubusercontent.com/KingOfBugbounty/KingOfBugBountyTips/master/downlink ; xargs -a downlink -I@ bash -c 'wget @ -q'; mkdir bounty ; unzip '*.zip' -d bounty/ ; rm -rf *zip ; cat bounty/*.txt >> allbounty ; sort -u allbounty >> domainsBOUNTY ; rm -rf allbounty bounty/ ; echo '@ofjaaaah regards'
echo "Done"

#install httpx
echo "Installing httpx"
GO111MODULE=on go get github.com/projectdiscovery/httpx/cmd/httpx
echo "Done"

#install jaeles
echo "Installing jaeles"
GO111MODULE=on go get github.com/jaeles-project/jaeles
echo "Done"

#install gf
echo "Installing gf"
go get -u github.com/tomnomnom/gf
echo "Done"

#install unew
echo "Installing unew"
go get -u github.com/dwisiswant0/unew
echo "Done"

#install rush
echo "Installing rush"
go get -u github.com/shenwei356/rush/
echo "Done"

#install jsubfinder
echo "Installing jsubfinder"
go get -u github.com/hiddengearz/jsubfinder;
echo "Done"
echo "downloading jsf_signatures for jsubfinder"
wget https://raw.githubusercontent.com/hiddengearz/jsubfinder/master/.jsf_signatures.yaml && mv .jsf_signatures.yaml ~/.jsf_signatures.yaml;
echo "Done"

#install shuffledns
echo "Installing shuffledns"
GO111MODULE=on go get github.com/projectdiscovery/shuffledns/cmd/shuffledns;
echo "Done"

#install haktldextract
echo "Installing haktldextract"
go get github.com/hakluke/haktldextract;
echo "Done"

#install gau
echo "Installing gau"
GO111MODULE=on go get -u github.com/lc/gau;
echo "Done"

#install nuclei
echo "Installing nuclei"
GO111MODULE=on go get github.com/projectdiscovery/nuclei/v2/cmd/nuclei/;
echo "Done"
echo "installing Nuclei templates"
nuclei -update-templates
echo "Done"

#install html-tools
echo "Installing html-tools"
go get -u github.com/tomnomnom/hacks/html-tool;
echo "Done"

#install dalfox
echo "Installing dalfox"
go get -u github.com/hahwul/dalfox;
echo "Done"

#install assetfinder
echo "Installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "Done"

#install kxss
echo "Installing kxss"
go get github.com/tomnomnom/hacks/kxss
echo "Done"

#install burl
echo "Installing Burl"
go get github.com/tomnomnom/burl
echo "Done"

#install AntiBurl
echo "Installing Anti-burl"
go get github.com/tomnomnom/hacks/anti-burl
echo "Done"

#installing other tools which needs more setup
#github-search
echo "Installing github search on ~/tools/github-search"
git clone https://github.com/gwen001/github-search.git ~/tools/github-search;
python2 -m pip install -r ~/tools/github-search/requirements2.txt;
python2 -m pip install -r ~/tools/github-search/requirements3.txt;
python3 -m pip install -r ~/tools/github-search/requirements2.txt;
python3 -m pip install -r ~/tools/github-search/requirements3.txt;
echo "Done"

#findomain
echo "Installing findomain"
git clone https://github.com/Edu4rdSHL/findomain.git ~/tools/findomain;
cd findomain; cargo build --release;
sudo cp ./target/release/findomain /usr/bin/;
findomain;
cd ~/tools/;
echo "Done"

#Interlace
echo "Installing Interlace"
git clone https://github.com/codingo/Interlace.git ~/tools/interlace;
python3 ~/tools/interlace/setup.py install;
echo "Done"

#download gitdump
echo "Installing GitDump"
cd ~/tools/;
git clone https://github.com/arthaud/git-dumper.git ~/tools/git-dumper;
python3 -m pip install -r ~/tools/git-dumper/requirements.txt;
echo "Done"

#install paramspider
echo "installing paramspider"
cd ~/tools;
git clone https://github.com/devanshbatham/ParamSpider.git ~/tools/paramspider;
cd ~/tools/paramspider;
python3 -m pip install -r requirements.txt;
echo "done"

#install secretfinder
echo "installing secretfinder.py"
cd ~/tools;
git clone https://github.com/m4ll0k/SecretFinder.git ~/tools/SecretFinder;
cd ~/tools/SecretFinder;
python2 -m pip install -r ~/tools/SecretFinder/requirements.txt
python3 -m pip install -r ~/tools/SecretFinder/requirements.txt
echo "Done"

#install JSScanner
echo "Installing JSScanner"
cd ~/tools;
git clone https://github.com/0x240x23elu/JSScanner.git ~/tools/JSScanner;
cd ~/tools/JSScanner;
python3 -m pip install -r ~/tools/JSScanner/requirements.txt;
echo "Done"

#install arjun
echo "installing Arjun"
cd ~/tools;
git clone https://github.com/s0md3v/Arjun.git ~/tools/Arjun;
cd ~/tools/Arjun;
python3 ~/tools/Arjun/setup.py install;
cd ~/tools;
echo "Done"

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

#Getting all tools of https://github.com/KingOfBugbounty/Bug-Bounty-Toolz into our ~/tools dir :)
echo "Getting all tools on KingOfBugBounty/Bug-Bouty-Toolz on our dir :)"
cd ~/tools/
git clone https://github.com/KingOfBugbounty/Bug-Bounty-Toolz.git ~/tools/bbtools
mv ~/tools/bbtools/* ~/tools/.
rm -r ~/tools/bbtools
echo "done"

echo 'source ~/.profile' >> ~/.bashrc
echo 'source ~/.profile' >> ~/.zshrc

echo -e "\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls ~/tools/
ls ~/go/bin/
echo -e "\n\n"
echo "Don't forget to set up AWS credentials in ~/.aws/!"
echo "Don't forget to set up GITHUB Token in your OFJAAAAH.sh script!"
echo "in order to install Axion, set up a vps and Security trails acc and run the installation script:"
echo ""
echo "$ bash <(curl -s https://raw.githubusercontent.com/pry0cc/axiom/master/interact/axiom-configure)"
echo ""
echo "ping me at twitter @dalbonip :] "
