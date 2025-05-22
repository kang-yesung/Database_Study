create database scoula_db;

create user 'scoula'@'localhost' identified by '1234';
grant all privileges on *.* to 'scoula'@'localhost';

select user, host from mysql.user;