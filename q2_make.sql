drop table if exists trade_decimal;
create table trade_decimal(stocksymbol decimal, time decimal(9), quantity decimal(5), price decimal(3));

insert into trade_decimal 
select cast(substring(stocksymbol, 2, 15) as decimal) stocksymbol, time, quantity, price 
from trade;


drop table if exists trade_dense;
drop table if exists trade_dense_decimal;
create table trade_dense(stocksymbol varchar(15), time decimal(9), quantity decimal(5), price decimal(3));
LOAD DATA INFILE '~/Desktop/ConsoleApplication37/dense/trade.csv' INTO TABLE trade_dense
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

create table trade_dense_decimal(stocksymbol decimal, time decimal(9), quantity decimal(5), price decimal(3));

insert into trade_dense_decimal 
select cast(substring(stocksymbol, 2, 15) as decimal) stocksymbol, time, quantity, price 
from trade_dense;

-- create table trade_copy(stocksymbol varchar(15), time decimal(9), quantity decimal(5), price decimal(3));

-- create table trade_copy2(stocksymbol varchar(15), time decimal(9), quantity decimal(5), price decimal(3));


drop table if exists trade_copy3;
drop table if exists trade_copy2;
drop table if exists trade_copy;

CREATE TABLE trade_copy LIKE trade;
insert into trade_copy 
select stocksymbol, time, quantity, price 
from trade;
CREATE TABLE trade_copy2 LIKE trade;
insert into trade_copy2 
select stocksymbol, time, quantity, price 
from trade;
CREATE TABLE trade_copy3 LIKE trade;
-- insert into trade_copy3 
-- select stocksymbol, time, quantity, price 
-- from trade limit 5000000;

-- drop table if exists trade_dense_copy2;
-- drop table if exists trade_dense_copy;
\q
