# ft_onion

<br>

Serves a static web page with Nginx that can be accessible with an .onion site. You can connect with the
server with ssh.

<br>

## Access static web site

The server is dockerized and you can check the functionality with a dockerized cllient. To start run:

```` 
make
````

It builds two images, server and client, and runs its containers.

<br>

Now we need the .onion URL. Execute the server container and `cat` the hostname

````
make onionexec
````
Into container:

````
cat /var/lib/tor/my_hidden_service/hostname
````
## Access server with ssh

````
cat /var/lib/tor/my_other_hidden_service/hostname
````

...
