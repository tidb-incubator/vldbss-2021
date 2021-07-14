## Introduction

This is the Map-Reduce homework before VLDB Summer School 2021. By completing this task, you will learn some basic skill on Golang language and have some knowledge about distributed systems. This task is similar to the [lab1](https://pdos.csail.mit.edu/6.824/labs/lab-mr.html) of MIT 6.824, a small startup for your study on distributed systems.

There is an uncompleted Map-Reduce framework, you should complete it and use it to extract the 10 most frequent URLs from data files.

## Course

We recommend the introduction chapter of MIT 6.824's course for this lab. This video provides an overview of distributed systems and dive into the Map-Reduce framework.

- [Official] https://www.youtube.com/watch?v=cQP8WApzIQQ
- [Mirror] https://www.bilibili.com/video/BV1R7411t71W?p=1

Map-Reduce is a well-known distributed computation framework, you may find other videos and blogs online.

For Golang learning, we recommend [Online Go tutorial](https://tour.golang.org/). If you are new to this language, it would be a good idea to finish the tutorial course before starting this lab.

In MIT 6.824's guidance, there are some further advices like debugging in such complex systems. Check it out as your interest.

- https://pdos.csail.mit.edu/6.824/labs/guidance.html

## Guide

This lab aims to acquire the skill of Golang development with distributed systems. Further, in this course you need to use GitHub to submit your work.

- Fork this repository into your account
- Complete the lab on your repo
- Send a pull request to this repo

Ask any questions in AskTUG forum.

- https://asktug.com/tags/vldbss

## Getting familiar with the source

The simple Map-Reduce framework is defined in `mapreduce.go`.

It is uncompleted and you should fill your code below comments `YOUR CODE HERE`.

The map and reduce function are defined as same as MIT 6.824 lab 1.

```go
type ReduceF func(key string, values []string) string
type MapF func(filename string, contents string) []KeyValue
```

There is an example in `urltop10_example.go` which is used to extract the 10 most frequent URLs.

After completing the framework, you can run this example by `make test_example`.

And then please implement your own `MapF` and `ReduceF` in `urltop10.go` to accomplish this task.

After filling your code, please use `make test_homework` to test.

All data files will be generated at runtime, and you can use `make cleanup` to clean all test data.

Please output URLs by lexicographical order and ensure that your result has the same format as test data so that you can pass all tests.

Each test cases has **different data distribution** and you should take it into account.

## Requirements and rating principles

* (40%) Performs better than `urltop10_example`.
* (20%) Pass all test cases.
* (30%) Have a document to describe your idea and record the process of performance optimization (both the framework and your own code) with `pprof`.
* (10%) Have a good code style.

NOTE: **go 1.12 is required**

## How to use

Fill your code below comments `YOUR CODE HERE` in `mapreduce.go` to complete this framework.

Implement your own `MapF` and `ReduceF` in `urltop10.go` and use `make test_homework` to test it.

There is a builtin unit test defined in `urltop10_test.go`, however, you still can write your own unit tests.

How to run example:
```
make test_example
```

How to test your implementation:
```
make test_homework
```

How to clean up all test data:
```
make cleanup
```

How to generate test data again:
```
make gendata
```
