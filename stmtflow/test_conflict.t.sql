/* init */ drop table if exists t1;
/* init */ create table t1 (c1 int key, c2 int, c3 int, key k1(c3));
/* init */ insert into t1 values (1, 1, 1);

# use t2 to test the duplicate entry check, use t3 to test the write conflict error.
/* t1 */ begin;
/* t2 */ begin;
/* t3 */ begin;
/* t1 */ delete from t1 where c3 = 1;
/* t1 */ commit;
/* t2 */ insert into t1 values (1, 1, 2); -- It's expected to report duplicate entry error.
/* t3 */ delete from t1 where c2 > 0;
/* t2 */ commit; -- The t2 commit will not write anything.
/* t3 */ commit; -- It's expected to report write conflict error.
