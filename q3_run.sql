set profiling = 1;
create index idx_p on likes(person, artist);
create index idx_f1 on friend(person1, person2);
create table unique_likes(person decimal(9), artist decimal(9), UNIQUE KEY (person, artist));
insert into unique_likes(person, artist) select distinct person, artist from likes order by person, artist;
create table unique_friend(person1 decimal(9), person2 decimal(9));
insert into unique_friend(person1, person2)
select distinct person1, person2  from friend 
where person1 < person2 or (person2, person1) not in (select person1, person2 from friend) order by person1, person2;
create unique index idx_f on unique_friend(person2, person1);
create index idx_p1 on unique_likes(person);

set profiling = 0;
-- The following query can be hugely impacted by profiling. Please use mysql prompt to see the execution time.
select person1 u1, person2 u2, artist a from unique_friend, unique_likes l1 where 
unique_friend.person1 = l1.person and (select 1 from unique_likes l2 where person = unique_friend.person2 and artist = l1.artist) is null
union all 
select person1 u1, person2 u2, artist a from unique_friend, unique_likes l1 where 
unique_friend.person2 = l1.person and (select 1 from unique_likes l2 where person = unique_friend.person1 and artist = l1.artist) is null;


show profiles;