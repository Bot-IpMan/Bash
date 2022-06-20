echo "Install needed packages"
apt install mariadb-client mariadb-server

echo "Copy configuratin files"
cp -R /vagrant/provision/sever/mysql/etc/* /etc
mkdir -p /var/backup
cp -R /vagrant/provision/sever/mysql/var/backup/* /var/backup

echo "Start mysql server"
systrmctl enable mariadb
systrmctl start mariadb

echo "Securing mariadb"
mysql_secure_installation <<EOF

y
123456
123456
y
y
y
y
EOF

echo "Create database"
mysql -u root -p123456 <<EOF
CREATE DATABASE addressbook CHARACTER SET utf8 COLLATE utf8_general_ci;
EOF
mysql -u root -p123456 addressbook < /var/backup/addressbook.sql
