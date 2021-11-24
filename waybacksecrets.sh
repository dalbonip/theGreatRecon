#!/bin/bash
# first run ofjaaahs tool AND geturls.sh
# make sure to have all the tools:
# ~/tools/linkfinder.py
# ~/tools/collector.py

#cat domain and get js files from waybackurls to file ./jss
cat wayback | grep -iE '\.js'| grep -iEv '\.jsp' | anew jss ;
#cat domain and get js files from gospider to file ./jss
xargs -a domain -I@ -P10 bash -c 'gospider -a -s "https://@" -d 2 --js' | grep -iE '\.js'| grep -iEv '(\.jsp)' | grep -oE '[^ ]+$';
#cat domain and get js files from hakrawler to file ./jss
xargs -I@ -P10 sh -c 'hakrawler -plain -linkfinder -depth 5 -url @' | egrep '.js' | anew jss;
#cat jss and move jsons to ./jsons
cat jss | grep -iE "\.json" | anew jsons;
#cat js from jss, anti-burl it and print valid js on ./js_200ok
cat jss | grep -iEv "\.json" | anti-burl | awk '{print $4}' | anew js_200ok;
#cat js_200ok to linkfinder.py, the results goes to linkfinder_output
xargs -a js_200ok -n 2 -I@ bash -c "echo -e '\n[URL]: @\n'; python3 ~/tools/LinkFinder/linkfinder.py -i  @ -o cli" >> waybacksecrets_linksFound;
#cat js_200ok to collector.py and outputs it to collector_output directory
cat js_200ok | python3 ~/tools/collector.py collector_output;
#cat collector_output/urls.txt to SecretFinder.py and outputs it to secretsFound
xargs -a collector_output/urls.txt -I@ bash -c "python3 ~/tools/SecretFinder/SecretFinder.py -i @ -o cli | sort -u >> waybacksecrets_result";
