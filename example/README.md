# Important when using MariaDB

If you want to use MariaDB you have to change the HOST of the user that is created, because its created with `localhost` and therefore RW cant connect to it.

## Steps to use MariaDB

- uncomment `db` service part in `docker-compose.yml`
- uncomment `link` part of `rw-java-server` service
- (re)start with `:> docker-compose up -d`
- connect to the container using `:> docker exec -it rw-java-database bash`
- connect to mariadb using `:> mysql`
- change user host `mysql:> UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='risingworld';`
- change host on the db `mysql:> UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='risingworld';` 
- flush privileges `mysql:> FLUSH PRIVILEGES;`
- open `server.properties` with your favourite editor and change `database_type=sqlite` to `database_type=mysql`
- restart with `:> docker container restart rw-java-docker`