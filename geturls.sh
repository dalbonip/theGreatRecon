#!/bin/bash
# first run ofjaaahs tool or make a domain + subdomains list file named domain

cat domain | waybackurls | anew wayback;
cat domain | gau | anew wayback;