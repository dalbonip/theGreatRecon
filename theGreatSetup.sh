#!/bin/bash
echo "setting up your linux for some recon :)"
sleep 2;
echo "This script is for debian based distros (apt install) continue?"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
  case $choice in
    yes)
			echo "installing..."
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

sudo apt update;
mkdir ~/tools;
cd ~/tools;

#####installing rust

curl https://sh.rustup.rs -sSf | sh

#####installing tools && dependencies

sudo apt install -y python2 python3 python3-pip git gitk curl jq ruby-dev perl packer rsync fzf libcurl4-openssl-dev libssl-dev libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev build-essential libssl-dev libffi-dev python2-dev python-setuptools libldns-dev gitk rename snapd libpcap-dev


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
					wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
					sudo tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					export PATH=$PATH:/usr/local/go/bin
					echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
					echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
					echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
					echo 'export GOROOT=/usr/local/go' >> ~/.zshrc
					echo 'export GOPATH=$HOME/go'	>> ~/.zshrc			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.zshrc	
					echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
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

#####installing go tools

#install ffuf
echo "Installing ffuf"
go install github.com/ffuf/ffuf@latest
echo "Done"

#install anew
echo "Installing anew"
go install github.com/tomnomnom/anew@latest
echo "Done"

#install qsreplace
echo "Installing qsreplace"
go install github.com/tomnomnom/qsreplace@latest
echo "Done"

#install subfinder
echo "Installing subfinder"
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "Done"

#install gospider
echo "Installing gospider"
go install github.com/jaeles-project/gospider@latest
echo "Done"

#install amass
echo "Installing amass"
go install -v github.com/OWASP/Amass/v3/...@master
echo "Done"

#install hakrawler
echo "Installing hakrawler"
go install github.com/hakluke/hakrawler@latest
echo "Done"

#install gargs
echo "Installing gargs"
go install github.com/brentp/gargs@latest
echo "Done"

#install chaos
echo "Installing chaos"
go install github.com/projectdiscovery/chaos-client/cmd/chaos@latest
echo "Done"

#install httpx
echo "Installing httpx"
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "Done"

#install jaeles
echo "Installing jaeles"
go install github.com/jaeles-project/jaeles@latest
echo "Done"

#install gf
echo "Installing gf"
go install github.com/tomnomnom/gf@latest
echo "Done"

#install unew
echo "Installing unew"
go install github.com/dwisiswant0/unew@latest
echo "Done"

#install rush
echo "Installing rush"
go install github.com/shenwei356/rush/@latest
echo "Done"

#install jsubfinder
echo "Installing jsubfinder"
go install github.com/hiddengearz/jsubfinder@latest
echo "Done"
echo "downloading jsf_signatures for jsubfinder"
wget https://raw.githubusercontent.com/hiddengearz/jsubfinder/master/.jsf_signatures.yaml && mv .jsf_signatures.yaml ~/.jsf_signatures.yaml;
echo "Done"

#install shuffledns
echo "Installing shuffledns"
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
echo "Done"

#install haktldextract
echo "Installing haktldextract"
go install github.com/hakluke/haktldextract@latest
echo "Done"

#install gau
echo "Installing gau"
go install github.com/lc/gau@latest
echo "Done"

#install nuclei
echo "Installing nuclei"
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei/@latest
echo "Done"
echo "installing Nuclei templates"
nuclei -update-templates
echo "Done"

#install html-tools
echo "Installing html-tools"
go install github.com/tomnomnom/hacks/html-tool@latest
echo "Done"

#install dalfox
echo "Installing dalfox"
go install github.com/hahwul/dalfox@latest
echo "Done"

#install assetfinder
echo "Installing assetfinder"
go install github.com/tomnomnom/assetfinder@latest
echo "Done"

#install kxss
echo "Installing kxss"
go install github.com/tomnomnom/hacks/kxss@latest
echo "Done"

#install burl
echo "Installing Burl"
go install github.com/tomnomnom/burl@latest
echo "Done"

#install AntiBurl
echo "Installing Anti-burl"
go install github.com/tomnomnom/hacks/anti-burl@latest
echo "Done"

echo "installing httprobe"
go install github.com/tomnomnom/httprobe@latest
echo "done"

echo "installing unfurl"
go install github.com/tomnomnom/unfurl@latest
echo "done"

echo "installing waybackurls"
go install github.com/tomnomnom/waybackurls@latest
echo "done"

echo "installing chromedp/chromedp"
go install github.com/chromedp/chromedp@latest
echo "done"

echo "installing ferreiraklet/airixss"
go install github.com/ferreiraklet/airixss@latest
echo "done"

echo "installing edoardottt/cariddi"
go install github.com/edoardottt/cariddi@latest
echo "done"

echo "installing tomnomnom/hacks/filter-resolved"
go install github.com/tomnomnom/hacks/filter-resolved@latest
echo "done"

echo "installing takshal/freq"
go install github.com/takshal/freq@latest
echo "done"

echo "installing sensepost/gowitness"
go install github.com/sensepost/gowitness@latest
echo "done"

echo "installing deletescape/goop"
go install github.com/deletescape/goop@latest
echo "done"

echo "installing 003random/getJS"
go install github.com/003random/getJS@latest
echo "done"

echo "installing hakluke/hakrevdns"
go install github.com/hakluke/hakrevdns@latest
echo "done"

echo "installing hakluke/haktldextract"
go install github.com/hakluke/haktldextract@latest
echo "done"

echo "installing hakluke/haklistgen"
go install github.com/hakluke/haklistgen@latest
echo "done"

echo "installing projectdiscovery/naabu/v2/cmd/naabu"
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
echo "done"

echo "installing projectdiscovery/notify/cmd/notify"
go install github.com/projectdiscovery/notify/cmd/notify@latest
echo "done"

echo "installing detectify/page-fetch"
go install github.com/detectify/page-fetch@latest
echo "done"

#installing other tools which needs more setup commands and python2/3 pip2/3

#gargs
wget https://github.com/brentp/gargs/releases/download/v0.3.9/gargs_linux;
sudo mv gargs_linux /usr/local/bin/gargs

#####installing phyton2-pip
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py;
sudo python2 /tmp/get-pip.py;
sudo apt install python-is-python3;

#github-search
echo "Installing github search on ~/tools/github-search"
git clone https://github.com/gwen001/github-search.git ~/tools/github-search;
python2 -m pip install -r ~/tools/github-search/requirements2.txt;
python2 -m pip install -r ~/tools/github-search/requirements3.txt;
python3 -m pip install -r ~/tools/github-search/requirements2.txt;
python3 -m pip install -r ~/tools/github-search/requirements3.txt;
echo "Done"

#dnsgen
python3 -m pip install dnsgen

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

#install XSSstrike
echo "installing XSSstrike.py"
cd ~/tools;
git clone https://github.com/s0md3v/XSStrike.git ~/tools/XSStrike;
cd ~/tools/XSStrike;
python3 -m pip install -r ~/tools/XSStrike/requirements.txt
echo "Done"

#install linkfinder
echo "installing linkfinder.py"
cd ~/tools;
git clone https://github.com/GerbenJavado/LinkFinder.git ~/tools/LinkFinder;
cd ~/tools/LinkFinder;
python3 -m pip install -r ~/tools/LinkFinder/requirements.txt
python3 ~/tools/LinkFinder/setup.py install
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

#install Sh1Yo x8
echo "installing Sh1Yo x8"
cargo install x8
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
