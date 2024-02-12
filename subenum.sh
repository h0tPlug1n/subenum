#!/bin/bash
#Subdomain Enum
subfinder -all -d $1 -o from-subfinder.txt
sublist3r -d $1 -o from-sublister.txt
python3 ~/Desktop/Tools/certsh.py $1
assetfinder -subs-only $1 | tee from-assetfinder.txt

# Cleaning up
cat from-* | anew alldomains.txt
rm from-*

# Collecting old URLs
cat alldomains.txt | waybackurls > from-waybackurls.txt

# Crawling
katana -list alldomains.txt -o from-katana.txt
