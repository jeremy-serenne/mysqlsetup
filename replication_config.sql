CHANGE MASTER TO
MASTER_HOST='172.30.2.136',
MASTER_USER='repl',
MASTER_PASSWORD='02kickamer714m9',
MASTER_LOG_FILE='mysql-bin.000001',
MASTER_LOG_POS=33477780; 
START SLAVE;
SHOW SLAVE STATUS\G 