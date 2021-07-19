/* init */ drop table if exists t1;
/* init */ create table t1 (c1 int key, c2 int, c3 int, key k1(c3));
/* init */ insert into t1 values (1, 1, 1);

/* t1 */ select * from t1; -- the original snap value is returnd.
/* t2 */ insert into t1 values(2, 2, 2);
/* t1 */ select * from t1; -- t1 should see the newly inserted value.
/* t2 */ begin;
/* t2 */ delete from t1;
/* t1 */ select * from t1; -- t1 should not see the delete.
/* t2 */ commit;
/* t1 */ select * from t1; -- t1 should see the delete.
