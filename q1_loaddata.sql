pager cat > /dev/null

drop table if exists trade;
create table trade(stocksymbol varchar(15), time decimal(9), quantity decimal(5), price decimal(3));
LOAD DATA INFILE '~/Desktop/trade.csv' INTO TABLE trade
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

\q
