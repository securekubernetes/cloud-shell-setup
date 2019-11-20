#! /bin/sh
the_ip=`gcloud compute instances list --format json | jq '.[0]["networkInterfaces"][0]["accessConfigs"][0]["natIP"]' | sed 's/"//g'`

echo "${the_ip}" | grep '^[0-9][0-9.]*[0-9]$' >> /dev/null
if [ $? -ne 0 ]; then
	echo "Unable to determine cluster NodeIP. Please ask for help."
	exit 1
fi

cat <<EOF
Gr8 n3ws, Ha><0r,

You've got shellz!

0ur syst3m p0pped anoth3r box 4 joo. t3h fundz hav b33n deduct3d fr0m ur accoun7.

Ur n3w comput3r kan B @ccess3d @ http://${the_ip}:31337/webshell us1ng Ur r3gurlar cr3ds. h@ve fUn!

4eva ur pal,
Natoshi Sakamoto
EOF
