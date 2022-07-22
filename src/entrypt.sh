#!bin/bash
service tor start
service nginx start
service ssh start

echo "* * * * * * * * * * *"
cat var/lib/tor/my_hidden_service/hostname

nginx -g "daemon off"

