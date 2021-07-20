/* init */ drop table if exists t1;
/* init */ create table t1 (c1 int key, c2 int, c3 int, key k1(c3));
/* init */ insert into t1 values (1, 1, 1);

/* t1 */ begin;
/* t1 */ select * from t1; -- the original snap value is returnd.
/* t2 */ begin;
/* t2 */ insert into t1 values(2, 2, 2);
/* t2 */ commit;
/* t1 */ select * from t1; -- t1 will not see the new value from t2.
/* t2 */ delete from t1;
/* t1 */ select * from t1; -- t1 will not see the delete operation from t2.
/* t1 */ insert into t1 values(3, 3, 3);
/* t1 */ select * from t1; -- t1 will see the snapshot value and its own write value.
/* t1 */ commit;
/* t1 */ select * from t1; -- t1 will see the left value only.
