set profiling=1;
select stocksymbol, sum(price*quantity)/sum(quantity) from trade group by stocksymbol;
SELECT stocksymbol, AVG(price) OVER (partition by stocksymbol ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) as avg FROM trade;
SELECT stocksymbol, (sum(price*quantity) OVER w) / (sum(quantity) over w) as avg FROM trade window w as (partition by stocksymbol ROWS BETWEEN 9 PRECEDING AND CURRENT ROW);
select stocksymbol, max(profit) as max_profit FROM ( SELECT stocksymbol, price - (min(price) OVER (partition by stocksymbol ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) as profit FROM trade) as t1 group by stocksymbol;

show profiles;
\q
