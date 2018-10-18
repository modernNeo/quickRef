# enabling apache/PHP on Mac

### Common commands after each change:

#### Restart Apache
`sudo apachectl restart`

### Apache syntax check
`apachectl -t`  
`sudo apachectl configtest`

## Turning on PHP

[for reference](https://websitebeaver.com/set-up-localhost-on-macos-high-sierra-apache-mysql-and-php-7-with-sslhttps#turn-on-php)  

`sudo vim /etc/apache2/httpd.conf`

Do a search for PHP and then uncomment `LoadModule php7_module libexec/apache2/libphp7.so` and uncomment it.

## Specify the root folder

[for reference](https://websitebeaver.com/set-up-localhost-on-macos-high-sierra-apache-mysql-and-php-7-with-sslhttps#create-sites-folder)  

`sudo vim /etc/apache2/httpd.conf`

Do a search for `DocumentRoot`, comment `DocumentRoot` and `<Directory` and put in
`DocumentRoot "<root folder>"`
`<Directory "<root folder>">`


## Fixing issues with "Permission to file not allowed"  

[for reference](https://coolestguidesontheplanet.com/forbidden-403-you-dont-have-permission-to-access-username-on-this-server/)  
`sudo vim /etc/apache2/httpd.conf``

comment out existing  
```shell
User _www
Group _www
```
and add with
```shell
User jason_manshad
Group staff
```

## Fixing issues with "Permission to file not allowed"  
[for reference](https://coolestguidesontheplanet.com/forbidden-403-you-dont-have-permission-to-access-username-on-this-server/)  

Check to to see if there is a file under `etc/apache2/users/` that is called <your_short_name>.conf
If there is not, make a file that does contain that convention, <your_short_name> is your username which can be determined with the command `whoami`

the contents of the file should be
```shell
<Directory "/Users/Sites/">
AllowOverride All
Options Indexes MultiViews FollowSymLinks
Require all granted
</Directory>
```

Make sure the permissions for the file is `344`

## Syntax error on line 20 of /private/etc/apache2/extra/httpd-mpm.conf  
https://apple.stackexchange.com/a/217189

Go to `/private/etc/apache2/extra/httpd-mpm.conf` and comment out the section that is cuasing issues. 

```shell
#<IfModule !mpm_winnt_module>
#<IfModule !mpm_netware_module>
#LockFile "/private/var/log/apache2/accept.lock"
#</IfModule>
#</IfModule
```
