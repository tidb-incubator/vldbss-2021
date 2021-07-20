/* init */ drop table if exists t1;
/* init */ create table t1 (c1 int key, c2 int, c3 int, key k1(c3));
/* init */ insert into t1 values (1, 1, 1);

/* t1 */ begin;
/* t1 */ insert into t1 values(2, 2, 2);
/* t1 */ select * from t1; -- should return the merged result in memory and from tinykv store.
/* t1 */ delete from t1 where c3 = 2; -- delete own write.
/* t1 */ select * from t1; -- should return the tinykv store results only.
/* t1 */ delete from t1;
/* t1 */ select * from t1; -- should return nothing.
/* t1 */ commit;
