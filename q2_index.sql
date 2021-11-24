set profiling=1;

create unique index idx1 on trade_copy(stocksymbol, time);


update trade_copy set time = (power(-1, time)-2) * time  where quantity < 3000 and price < 300;
update trade_copy2 set time = (power(-1, time)-2) *time  where quantity < 3000 and price < 300;


update trade_copy set price=price + 1  where time < 800000 and stocksymbol = @maxstock;

update trade_copy2 set price=price + 1  where time < 800000 and stocksymbol = @maxstock;

-- A covering index that will significantly accelrate the query execution than a non-covering 
-- index
show profiles;
\q
