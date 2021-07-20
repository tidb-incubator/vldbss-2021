# Map-Reduce Task

[English Ver](./README.md)

## 介绍

我们为 VLDB Summer School 2021 设置了一个 Map-Reduce 的小作业。通过完成本课程，你可以学习到一些 Golang 的基础知识并对分布式系统有一个基础的了解。本课程与 MIT 6.824 的 [lab1](https://pdos.csail.mit.edu/6.824/labs/lab-mr.html) 相似，适合作为学习分布式系统的第一步。

本课程提供了一个未完成的 Map-Reduce 框架，你需要完成这个框架，并且使用它从文件中找到出现频率最高的 10 个 URL。

## 课程

我们推荐 MIT 6.824 的第一课（介绍章节）来学习课程。MIT 6.824 对分布式系统进行了整体介绍并且详细的讲解了 Map-Reduce 框架。

- [Official] https://www.youtube.com/watch?v=cQP8WApzIQQ
- [Mirror] https://www.bilibili.com/video/BV1R7411t71W?p=1

Map-Reduce 是一个著名的分布式计算框架，除了 MIT 6.824，可以参考网上找到的其他资料来帮祝你学习，

对于 Golang 的初学者，我们推荐先通过 [Online Go tutorial](https://tour.golang.org/) 学习语言。本实验中需要几项重要的技能：

- 使用 go routine，channel 和 WaitGroup
- Interface
- 读写文件

在 MIT 6.824 的课程指南中，还有很多学习建议，例如如何对复杂系统进行 Debug，推荐感兴趣的同学阅读。

- https://pdos.csail.mit.edu/6.824/labs/guidance.html

如果有任何问题，可以在 AskTUG 论坛上进行讨论。

- https://asktug.com/tags/vldbss

## 实验介绍

### 1. 完成 Map-Reduce 框架

#### 要求

Map-Reduce 的框架代码在 `mapreduce.go` 中，但是这个框架尚未完成。

map 和 reduce 的函数定义与 MIT 6.824 相同。

```go
type ReduceF func(key string, values []string) string
type MapF func(filename string, contents string) []KeyValue
```

在 `urltop10_example.go` 有一个基于 Map-Reduce 框架实现的例子，能够寻找到 10 个出现频率最高的 URL。但是因为框架尚未完成，这个例子还没法运行，你需要完成框架，让 `urltop10_example.go` 中的函数正确运行。

#### TODO

- 在 `mapreduce.go` 的 `YOUR CODE HERE` 标记处补充代码，完成框架。

- 运行 `make test_example` 来测试给出的例子，使其通过测试。

### 2. 基于 Map-Reduce 框架编写 Map-Reduce 函数

#### 要求

在完成 Map-Reduce 的框架并通过测试之后，你需要使用所实现的框架，在 `urltop10.go` 中实现自己的 `MapF` 和 `ReduceF` 来完成本项课程。

#### TODO

- 完成 `urltop10.go` 中的 `URLTop10` 函数，函数逻辑可以参考 `urltop10_example.go` 中的 `ExampleURLTop10`。

- 运行 `make test_homework` 使自己编写的 Map-Reduce 函数通过测试。

### 帮助信息

可以使用 `make gendata` 生成测试数据。

所有的数据文件会在运行过程中被生成，可以使用 `make cleanup` 进行清理。

请以字典序输出结果，并且确保格式与生成的测试文件中的 `result` 文件一致，这样才能够通过测试。

不同的测试有**不同的数据分布**，这点在实现过程中需要被考虑到。

### 提交作业

在完成所有作业后，你需要通过邮件的方式提交作业。

- 使用 [report.md](./report.md) 模板撰写报告，请勿修改模板或增加额外内容，尽量简洁精炼。
- 将代码打包，和 PDF 报告一起发送到 vldbss.2021@pingcap.com。
- 邮件标题格式为 “学校-姓名 lab0 作业”。
