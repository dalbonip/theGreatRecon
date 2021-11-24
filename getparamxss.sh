#!/bin/bash
#first run ofjaaahs tool and make sure to have Arjun installed
mkdir paramjob;
xargs -a domains -P10 -I@ bash -c 'python3 ~/tools/paramspider/paramspider.py -d @ -l high' | anew paramjob;
cat wayback | grep -iEv '(\.js||\.jsp)' | anew paramjob;
cat paramjob | gxss -p foobars | anew xssparams;
rm paramjob

