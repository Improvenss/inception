-- :setvar MYSQL_DATABASE_NAME Yuandre;

-- CREATE DATABASE $(MYSQL_DATABASE_NAME);

-- CREATE USER '$(MYSQL_USERNAME)'@'%' IDENTIFIED BY '$(MYSQL_USER_PASSWORD)'; -- Creating user and user's password from .env file.
-- GRANT ALL PRIVILEGES ON $(MYSQL_DATABASE_NAME).* TO '$(MYSQL_USERNAME)'@'%'; -- Grants all permissions to the user.
-- FLUSH PRIVILEGES; -- Updating permissions table.

-- ALTER USER '$(MYSQL_ROOT_NAME)'@'localhost' IDENTIFIED BY '$(MYSQL_ROOT_PASSWORD)'; -- Editing User table and adding 'root'.



CREATE DATABASE Yuandre;

CREATE USER 'gsever'@'%' IDENTIFIED BY '123'; -- Creating user and user's password from .env file.
GRANT ALL PRIVILEGES ON Yuandre.* TO 'gsever'@'%'; -- Grants all permissions to the user.
FLUSH PRIVILEGES; -- Updating permissions table.

ALTER USER 'root'@'localhost' IDENTIFIED BY '123'; -- Editing User table and adding 'root'.

