apt-get install apache2
a2enmod ssl
a2enmod dav_fs
a2enmod dav

mkdir /etc/apache2/ssl
openssl req $@ -new -x509 -days 365 -nodes -out /etc/apache2/ssl/apache.pem -keyout /etc/apache2/ssl/apache.pem
chmod 600 /etc/apache2/ssl/apache.pem

mkdir /home/marc/disk/
#chown www-data /path/to/webdav/
htpasswd -c /home/marc/passwd.dav marc


echo '

 <VirtualHost *:443>
         ServerAdmin user@host.com
         DocumentRoot /home/marc/disk

         SSLEngine on
         SSLCertificateFile /etc/apache2/ssl/apache.pem

         <Directory /home/marc/disk/>
            DAV On
            AuthType Basic
            AuthName "webdav"
            AuthUserFile /home/marc/passwd.dav
            Require valid-user
	    Options +Indexes
        </Directory>

         ErrorLog  /home/marc/error.log
         CustomLog /home/marc/access.log combined
 </VirtualHost>

' >>/etc/apache2/sites-enabled/000-default.conf


#echo '
#Options +Indexes
#IndexOptions FancyIndexing FoldersFirst NameWidth=* DescriptionWidth=*
#' >>/home/marc/disk/.htaccess

apachectl configtest

/etc/init.d/apache2 reload
