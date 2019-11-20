#! /bin/sh
the_ip=`gcloud compute instances list --format json | jq '.[0]["networkInterfaces"][0]["accessConfigs"][0]["natIP"]' | sed 's/"//g'`

echo "${the_ip}" | grep '^[0-9][0-9.]*[0-9]$' >> /dev/null
if [ $? -ne 0 ]; then
	echo "Unable to determine cluster NodeIP. Please ask for help."
	exit 1
fi

echo
echo
echo "DarkRed's nmap command is:"
echo "nmap -sT -A -p 31300-31399 -T4 -n -v -Pn ${the_ip}"
echo
echo
echo "DarkRed uploaded the webshell to:"
echo "http://${the_ip}:31336/webshell/"
echo
echo
