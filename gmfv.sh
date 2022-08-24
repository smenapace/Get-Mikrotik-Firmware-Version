#! /bin/bash

echo 'good morning'

while read line;

do

curl -H "Authorization: Token f6467c0d51424e6a31455cffe214bb739f13e324" -s "https://netbox.cwepnet.com/api/dcim/devices/?limit=0&q=&manufacturer_id=1" | jq .results[].primary_ip.address | echo $line `snmpget -Ovq -v1 -c gofast89 $line 1.3.6.1.2.1.1.5.0 1.3.6.1.4.1.14988.1.1.7.4.0`| tr -d \" | cut -d"/" -f1

done < loi.txt 





