CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER IF NOT EXISTS 'gsever'@'%' IDENTIFIED BY 'gsever123'; -- Creating user and user's password from .env file.
GRANT ALL PRIVILEGES ON wordpress.* TO 'gsever'@'%'; -- Grants all permissions to the user.
FLUSH PRIVILEGES; -- Updating permissions table.

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root4life'; -- Editing User table and adding 'root'.

-- THIS FILE FOR CREATE A NEW DATABASE.