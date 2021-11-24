# theGreatRecon
Note that the script isn't 100% automated. it gets you to type some Y or A in it.

======

theGreatSetup.sh is the Script for installing and configuring my daily recon tools.

Debian Based only.

====

the script creates:

~/go

~/go/bin

~/go/pkg

~/go/src

~/tools


and install all tools necessary for running properly:

    -   nahamsec's lazyrecon script
    -   ofjaaaah's recon script
    -   almost all of Kingofbugbounty tips oneliners

====

Please remember to:

    -   change YOURAPIKEY on ofjaaaaah.sh at github-search
    -   set up your AWS config file on ~/.aws
    -   get me on twitter @dalbonip

:)

====
Suggested order to use scripts:
    1- theGreatSetup.sh to setup tools
    1.1 - change the github api token on ofjaaaah.sh
    2- ofjaaaah.sh DOMAIN
    3- geturls.sh to get urls from waybackurl and gau
    4- waybacksecrets.sh to gather secrets from js files
    5- getparamsxss.sh to get params from crawling and geturls.sh result
    6- xsscan.sh to scan those params for xss
    7- xsscan_blind.sh (remember to put your own xsshunter url)
    8- recontonuclei.sh
