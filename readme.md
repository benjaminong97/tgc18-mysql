To start mysql, in the terminal, type in `mysql -u root`

To create a user that can be accessed via nodejs etc, run this:
```
mysql -e "ALTER USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root_password';"
```

# import database
mysql -u root < sakila-schema.sql
mysql -u root < sakila-data.sql

# dependencies 
yarn add express
yarn add hbs
yarn add wax-on
yarn add handlebars-helpers
yarn add mysql2 


## bash file --> terminal file 
# must grant permission to run bash file - chmod +x init.sh
# ./init.sh

# create user
# the root is the 'superadmin' user, dangerous to use --> has permission to do everything on the database 
# for every project we will create a database user 
create user "ahkow"@"localhost" identified by 'rotiprata123';
grant create, alter, drop, insert, update, delete, select, references, reload, on
sakila.* to 'ahkow'@'localhost'

grant all privileges on sakila.* to 'ahkow'@'localhost' with grant option;
flush privileges