CREATE USER 'farmaUser'@'%' IDENTIFIED WITH mysql_native_password BY 'farmacia';
GRANT ALL ON pharmacare.* TO 'farmaUser'@'%';