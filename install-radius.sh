//USER & PASS DATABASE
radiusadmin
radiusadmin

//INSTALL MYSQL SERVER
apt install mysql-server
mysql_secure_installation
SELECT User,plugin from mysql.user where User='root';

//INSTALL PHP
apt install php
//INSTALL PHP MODULE
apt install php7.4-{bcmath,bz2,imap,intl,mbstring,soap,sybase,xsl,zip}
systemctl enable --now apache2
apt install php7.4-mysql
apt install php-gd php-mail php-mail-mime php-mysql php-pear php-db php-mbstring php-xml php-curl

//INSTALL FREERADIUS
apt install freeradius freeradius-mysql freeradius-utils
systemctl stop freeradius
freeradius -X
systemctl enable --now freeradius

//OPEN PORT RADIUS
ufw allow to any port 1812 proto udp
ufw allow to any port 1813 proto udp

====

//INSTALL DALORADIUS WEB UI
//DOWNLOAD
wget https://sourceforge.net/projects/daloradius/files/daloradius/daloradius-1.1-2.zip

//COPY TO USER 
cp ./library/daloradius.conf.php ./daloradius-users/library/
cp ./library/opendb.php ./daloradius-users/library/
cp ./library/tableConventions.php ./daloradius-users/library/
cp ./library/errorHandling.php ./daloradius-users/library/
chown -R www-data:www-data ./daloradius-users/library/

========patch database======
alter table radacct
add column acctupdatetime datetime NULL default NULL;
add column framedipv6address varchar(45) NOT NULL default '';
add column framedipv6prefix varchar(45) NOT NULL default '';
add column framedinterfaceid varchar(44) NOT NULL default '';
add column delegatedipv6prefix varchar(45) NOT NULL default '';


database = radiusdb
username = adiusadmin
password = radiusadmin

nas secret = nas_secret
