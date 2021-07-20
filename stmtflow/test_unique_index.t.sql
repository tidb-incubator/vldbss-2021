/* init */ drop table if exists t1;
/* init */ create table t1 (c1 int key, c2 int, c3 int, unique key uk1(c2), key k1(c3));
/* init */ insert into t1 values (1, 1, 1);

# use t2 to test the unique key check, use t3 to to test the unique key write conflict.
/* t1 */ begin;
/* t2 */ begin;
/* t3 */ begin;
/* t1 */ delete from t1 where c3 = 1;
/* t1 */ commit;
/* t2 */ insert into t1 values (2, 1, 2); -- It's expected to report duplicate entry error.
/* t3 */ delete from t1 where c2 = 1;
/* t2 */ commit; 
/* t3 */ commit;
