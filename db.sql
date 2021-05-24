UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';
CREATE USER 'root'@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON lemp.* TO 'root'@'%';
FLUSH PRIVILEGES;
CREATE DATABASE lemp;
CREATE TABLE lemp.users(id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100));

