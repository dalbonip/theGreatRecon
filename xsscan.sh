#!/bin/bash
# first run getparamxss.sh
# make sure to have Arjun installed

cat xssparams | dalfox pipe --mining-dict-word ~/tools/Arjun/arjun/db/params.txt --skip-bav -o