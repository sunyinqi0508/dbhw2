set profiling=1;

select distinct stocksymbol, time from trade;
select stocksymbol, time from trade;

select distinct stocksymbol, time from trade_decimal;
select stocksymbol, time from trade_decimal;

select distinct stocksymbol, time from trade_dense_decimal;
select stocksymbol, time from trade_dense_decimal;
show profiles;
\q
