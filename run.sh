# Q1:
echo "This script runs on my settings. Please only consider using this as a reference."
make 

./datagen .3 70000 10000000

mysql -h localhost -u root db -v < ./q1_loaddata.sql

mysql -h localhost -u root db -v < ./q1.sql > out1.txt


# mysql q2_make
mkdir -p dense
cp ./datagen dense
cd dense
./datagen .999 50 10000000 # dense uniform
cd ..
mysql -h localhost -u root db -v < ./q2_make.sql
#mysql-1
mysql -h localhost -u root db -v < ./q2_index.sql > out2_index.txt
#mysql-2
mysql -h localhost -u root db -v < ./q2_distinct.sql > out2_distinct.txt

#aquery-1
java -jar aquery.jar q2.distinct.a > q21.q
./m64/q q21.q
#aquery-2
./datagen .1 50 50000 # dense skewed
# Note: the trade.csv for earlier queries was replaced because they're no longer needed
java -jar aquery.jar q2.denorm.a > q22.q
./m64/q q22.q
#q3
mysql -h localhost -u root db -v < ./q3_loaddata.sql

mysql -h localhost -u root db -v < ./q3_run.sql > out3.txt
