#!/bin/bash
## this script just install my usual golang tools

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
