drop table if exists likes;
drop table if exists friend;
create table likes(person decimal(9), artist decimal(9));
create table friend(person1 decimal(9), person2 decimal(9));
LOAD DATA INFILE '~/Desktop/like.csv' INTO TABLE likes
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
LOAD DATA INFILE '~/Desktop/friends.csv' INTO TABLE friend
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
drop table if exists unique_likes;
drop table if exists unique_friend;

\q
