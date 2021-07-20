# Map-Reduce Task

[中文版](./README-zh.md)

## Introduction

This is the Map-Reduce homework before VLDB Summer School 2021. By completing this task, you will learn some basic skill on Golang language and have some knowledge about distributed systems. This task is similar to the [lab1](https://pdos.csail.mit.edu/6.824/labs/lab-mr.html) of MIT 6.824, a small startup for your study on distributed systems.

There is an uncompleted Map-Reduce framework, you should complete it and use it to extract the 10 most frequent URLs from data files.

## Course

We recommend the introduction chapter of MIT 6.824's course for this lab. This video provides an overview of distributed systems and dive into the Map-Reduce framework.

- [Official] https://www.youtube.com/watch?v=cQP8WApzIQQ
- [Mirror] https://www.bilibili.com/video/BV1R7411t71W?p=1

Map-Reduce is a well-known distributed computation framework, you may find other videos and blogs online.

For Golang learning, we recommend [Online Go tutorial](https://tour.golang.org/). If you are new to this language, it would be a good idea to finish the tutorial course before starting this lab. In this lab, there are some important skills:

- The usage of go routine, channel and WaitGroup 
- Interface
- Read/write file

In MIT 6.824's guidance, there are some further advices like debugging in such complex systems. Check it out as your interest.

- https://pdos.csail.mit.edu/6.824/labs/guidance.html

Ask any questions in AskTUG forum.

- https://asktug.com/tags/vldbss

## Lab

### 1. Complete the Map-Reduce framework 

#### Requirements

The simple Map-Reduce framework is defined in `mapreduce.go`. However, it's not completed yet.

The map and reduce function are defined as same as MIT 6.824 lab 1.

```go
type ReduceF func(key string, values []string) string
type MapF func(filename string, contents string) []KeyValue
```

There is an example in `urltop10_example.go` which is used to extract the 10 most frequent URLs. Since the framework is uncompleted, the example is not able to run. You need to complete the framework and let the functions in `urltop10_example.go` run correctly.

#### TODO

- Fill your code in `mapreduce.go` below comments `YOUR CODE HERE`.

- Run `make test_example` to test the given example, let it pass the test.

### 2. Write your own Map-Reduce functions based on the framework

#### Requirements

After you have passed tests with your Map-Reduce framework and the example, you need to implement your own `MapF` and `ReduceF` in `urltop10.go` to accomplish this task.

#### TODO

- Complete `URLTop10` function in `urltop10.go`. You can refer to `ExampleURLTop10` in `urltop10_example.go`.

- Run `make test_homework` to let your own Map-Reduce functions pass the tests.

### Helps

All data files will be generated at runtime, and you can use `make cleanup` to clean all test data.

Please output URLs by lexicographical order and ensure that your result has the same format as test data(there is a `result` file) so that you can pass all tests.

Each test cases has **different data distribution** and you should take it into account.

### Submit Your Work

After you've done with all the tasks above, you need to submit your homework by email.

- Write your report follow [report.md](./report.md). Note you may not edit this template or add further contents. Your report should be concise and clear. 
- Package your code and send it with PDF report to vldbss.2021@pingcap.com.
- Mail title should be "College-Name Lab0 Homework".
