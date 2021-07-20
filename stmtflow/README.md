# The stmtflow test tool


## Introduction

The `stmtflow` test [tool](https://github.com/zyguan/tidb-test-util) is used to run a suite of **sql tests** on the tinysql/tinykv cluster **concurrently**. 
In the summer school project, we could use this tool to write specific test cases with multiple connections or sessions to test the concurrency results of our transaction engine.


## How to use it

```
git clone https://github.com/zyguan/tidb-test-util.git
cd tidb-test-util
make build
```

After the build process, there will be a `stmtflow` binary in the `bin` directory. Then we could write some test cases, for example the test logic like.
```
/* init */ drop table if exists test;
/* init */ create table test (id int primary key, value int);
/* init */ insert into test (id, value) values (1, 10), (2, 20);

/* t1 */ begin;
/* t2 */ begin;
/* t1 */ delete from test where id = 1;
/* t2 */ select * from test where id = 1;
/* t1 */ commit;
/* t2 */ select * from test where id = 1; -- 1 -> 10
/* t2 */ commit;
```
Save this test sqls into a test file, namely `hello.t.sql`. To let the `stmtflow` tool get aware of the running cluster, try export it the environment variable.
```
Do export STMTFLOW_DSN='root:@tcp(127.0.0.1:4000)/test'
```
After that, the tests could run using the following command.
```
./stmtflow play hello.t.sql
```
The expected ouput of this case is 
```
# hello.t.sql
/* init */ drop table if exists test;
-- init >> 0 rows affected
/* init */ create table test (id int primary key, value int);
-- init >> 0 rows affected
/* init */ insert into test (id, value) values (1, 10), (2, 20);
-- init >> 2 rows affected
/* t1 */ begin;
-- t1 >> 0 rows affected
/* t2 */ begin;
-- t2 >> 0 rows affected
/* t1 */ delete from test where id = 1;
-- t1 >> 1 rows affected
/* t2 */ select * from test where id = 1;
-- t2 >> +----+-------+
-- t2    | ID | VALUE |
-- t2    +----+-------+
-- t2    |  1 |    10 |
-- t2    +----+-------+
/* t1 */ commit;
-- t1 >> 0 rows affected
/* t2 */ select * from test where id = 1; -- 1 -> 10
-- t2 >> +----+-------+
-- t2    | ID | VALUE |
-- t2    +----+-------+
-- t2    |  1 |    10 |
-- t2    +----+-------+
/* t2 */ commit;
-- t2 >> 0 rows affected
```
Also, if the results need to be recorded we could add `-w` param for the `play` command to record the test results.
```
./stmtflow play hello.t.sql -w
```

## Tests

There are some basic test cases in the `stmtflow directory` which could be used to verify the read/write results of our transaction engine which end with `t.sql`. Try use the
`stmflow` test tool to verify if the output is as expected.
