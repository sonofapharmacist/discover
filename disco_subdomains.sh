#!/bin/bash

# tar up the results into the working folder and gather subdomains into one spot after batch disco scans

echo
echo
echo "Domains location: "
read domains
echo
echo
#echo "Full path and name for your tar (the gz will be added later): "
#read targz
echo
echo
echo "Full path to where you want your subdomains found listed (no trailing / please): "
read subdomains

#tar cvf $targz --files-from /dev/null
touch $subdomains/subdomains.txt

for line in $(cat $domains)
do 
#	tar rvf $targz  /root/data/$line/
	cat /root/data/$line/data/subdomains.htm >> $subdomains/subdomains.txt
	
done

#gzip $targz

echo
echo
#echo "Your tar.gz is available at $targz.gz"
echo
echo "and the subdomains are available at $subdomains/subdomains.txt"
