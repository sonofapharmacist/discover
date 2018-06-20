#!/bin/bash

# tar up the results into the working folder and gather subdomains into one spot after batch disco scans

echo
echo
echo -n "Domains location: "
read -e domains
echo
echo
echo -n "Full path and name for your tar (the gz will be added later): "
read -e targz
echo
echo
echo -n "Full PATH ONLY to where you want your subdomains found listed (no trailing / please): "
read -e subdomains

tar cvf $targz --files-from /dev/null

for line in $(cat $domains)
do 
	tar rvf $targz  /root/data/$line/
	touch $subdomains/subdomains.txt
	cat /root/data/$line/data/subdomains.htm >> $subdomains/subdomains.txt
	sort -u $subdomains/subdomains.txt
	uniq -u $subdomains/subdomains.txt > $subdomains/tmp.txt
	rm -rf $subdomains/subdomains.txt
	touch $subdomains/subdomains.txt
	cat $subdomains/tmp.txt >> $subdomains/subdomains.txt
	rm -rf $subdomains/tmp.txt
	
done

gzip $targz

echo
echo
echo "Your tar.gz is available at $targz.gz"
echo
echo "and the subdomains are available at $subdomains/subdomains.txt"