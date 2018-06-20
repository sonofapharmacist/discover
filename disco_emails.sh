#!/bin/bash

# tar up the results into the working folder

echo
echo
echo "Domains location: "
read domains
echo
echo
echo "Where do you want them emails?"
read emails


touch $emails

for line in $(cat $domains)
do 
	cat /root/data/$line/data/emails.htm >> $emails
	
done

sort $emails | uniq -u

echo
echo
echo "Your emails are located here $emails."