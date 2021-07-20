/* init */ drop table if exists t1;
/* init */ create table t1 (c1 int key, c2 int, c3 int, key k1(c3));
/* init */ insert into t1 values (1, 1, 1);

/* t1 */ begin;
/* t2 */ begin;
/* t1 */ insert into t1 values(2, 2, 2);
/* t1 */ delete from t1 where c3 = 2; -- delete own write.
/* t1 */ commit
/* t2 */ insert into t1 values(2, 3, 3);
/* t2 */ commit;
/* t2 */ select * from t1;
