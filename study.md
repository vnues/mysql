存储在表中的数据是同一种类型的数据或清单。
决不应该将顾客的清单与订单的清单存储在同一个数据库表中，否则以
后的检索和访问会很困难。应该创建两个表，每个清单一个表。

表具有一些特性，这些特性定义了数据在表中如何存储，包含存储什么 样的数据，数据如何分解，各部分信息如何命名等信息。描述表的这组 信息就是所谓的模式(schema)，模式可以用来描述数据库中特定的表， 也可以用来描述整个数据库(和其中表的关系)。

表由列组成。列存储表中某部分的信息。

列(column)
表中的一个字段。所有表都是由一个或多个列组成的。

数据类型
所允许的数据的类型。每个表列都有相应的数据类型，它限制(或允
许)该列中存储的数据。

数据类型限定了可存储在列中的数据种类(例如，防止在数值字段中录 入字符值)。数据类型还帮助正确地分类数据，并在优化磁盘使用方面起 重要的作用。因此，在创建表时必须特别关注所用的数据类型

表中的数据是按行存储的，所保存的每个记录存储在自己的行内。如果
将表想象为网格，网格中垂直的列为表列，水平行为表行。

行(row)
表中的一个记录。

你可能听到用户在提到行时称其为数据库记录(record)。这两个术语 多半是可以交替使用的，但从技术上说，行才是正确的术语。

主键(primary key)
一列(或一组列)，其值能够唯一标识表中每一行。

唯一标识表中每行的这个列(或这几列)称为主键。主键用来表示一个
特定的行。没有主键，更新或删除表中特定行就极为困难，因为你不能
保证操作只涉及相关的行。

提示:应该总是定义主键
虽然并不总是需要主键，但多数数据库设计者都会保证他们创建的每
个表具有一个主键，以便于以后的数据操作和管理

主键(primary key) 能够唯一标识表中某一行的属性或属性组。一个表只能有一个主键，但可以有多个候选索引。主键常常与外键构成参照完整性约束，防止出现数据不一致。主键可以保证记录的唯一和主键域非空,数据库管理系统对于主键自动生成唯一索引，所以主键也是一个特殊的索引

外键（foreign key） 是用于建立和加强两个表数据之间的链接的一列或多列。外键约束主要用来维护两个表之间数据的一致性。简言之，表的外键就是另一表的主键，外键将两表联系起来。一般情况下，要删除一张表中的主键必须首先要确保其它表中的没有相同外键（即该表中的主键没有一个外键和它相关联）。

SQL(发音为字母 S-Q-L 或 sequel)是 Structured Query Language(结构 化查询语言)的缩写。SQL 是一种专门用来与数据库沟通的语言。

SQL 语句是由简单的英语单词构成的。这些单词称为 关键字，每个 SQL 语句都是由一个或多个关键字构成的。最经常使用的 SQL 语句大概就是 SELECT 语句了。它的用途是从一个或多个表中检索 信息。

SQL 是一门语言 他不是某个特定数据库供应商专有的语言。几乎所有重要的 DBMS 都支持 SQL，所以学习此语言使你几乎能与所有数据库打交道。

关键字(keyword)
作为 SQL 组成部分的保留字。关键字不能用作表或列的名字。附录 E 列出了某些经常使用的保留字。

检索单个列
SELECT
prod_name
FROM
Products;
多数 SQL 开发人员认为，将 SQL 语句分成多行更容易阅读和调试。

请注意，SQL 语句不区分大小写，因此 SELECT 与 select 是相同的。 同样，写成 Select 也没有关系。许多 SQL 开发人员喜欢对 SQL 关键 字使用大写，而对列名和表名使用小写，这样做使代码更易于阅读和 调试。不过，一定要认识到虽然 SQL 是不区分大小写的，但是表名、 列名和值可能有所不同(这有赖于具体的 DBMS 及其如何配置)。

检索所有列
SELECT \*
FROM Products;

通过列检索数据

子句(clause)
SQL 语句由子句构成，有些子句是必需的，有些则是可选的。一个子 句通常由一个关键字加上所提供的数据组成。子句的例子有我们在前 一课看到的 SELECT 语句的 FROM 子句。

注意:ORDER BY 子句的位置
在指定一条 ORDER BY 子句时，应该保证它是 SELECT 语句中最后一 条子句。如果它不是最后的子句，将会出现错误消息

多列排序-单列排序

A - ORDER BY A

默认从小到大

DESC 降序

SQL 查询是查询列的 根据一列返回的数据 你需要其他数据就继续查询列
而不是跟我以前想的查到对应 id 的行就返回行

学习的时候确实从背开始
create table student4
72 (
73 id char(8), name char(10) --表字段
74 constraint pk_id4 primary key (id), constraint uk_name4 unique (name)
75 )

主句查询是列字句查询是行
// 意思是主句查询的作用域是表头这一列
// 字句查询也是这一行，但是字句的作用域是整行 通过这一行的某列去限制主句的列