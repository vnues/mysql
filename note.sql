/*
 SQL也是一门语言 也要表达式函数流程控制语句 只不过比较简单

*/



# 所以应该是这样执行步骤 首先根据字句的表达式筛选出符合的行--->然后再根据主句的条件进行拿值 ---  卧槽 这样的理解终于顺畅了


show databases ;

use vnues;

show tables;

# 进阶一 基础查询

SELECT *
FROM students;

SELECT *
FROM students
where id=1996;

INSERT INTO `
vnues`.`students
`
(`id`, `name`, `sex`, `age`, `tel`) VALUES
(2124, 'vn', '女', 23, '15363383750')

# 去重

SELECT DISTINCT tel
FROM students;

SELECT tel
FROM students;

#  mysql+.的作用 +仅仅作为运算符  如果要使用拼接就用concat

# 这种为什么可以生效
SELECT CONCAT('a','b','c') AS 结果;

SELECT CONCAT(tel,id) AS 电文
FROM students;


# 进阶二 条件查询

# SQL的where和别的语言的if类似 就是判断条件

# 1.按条件表达式筛选 条件运算符：> < = != <>
(不等) >= <=

SELECT tel
FROM students
WHERE tel>=15363383750;


# 2.按逻辑表达式筛选 逻辑运算符 :&& || ! and or not

# 作用用于连接表达式

#  主句查询范围在列 字句范围为行
--> 为什么我查询的是tel列 但是字句可以扩展到id列  这就是原因
SELECT tel
FROM students
WHERE tel>=1536338375&&id
>=2019;

SELECT tel
FROM students
WHERE tel>=1536338375&&id
>=9919;

# 3.模糊查询 like between in    is null  --通常和通配符%配合使用 %0个或者多个字符  _ 单个字符 ESCAPE代替转义\字符 通配符和like配合写
# 使用between and提高语句整洁度 在100和200之间  WHERE id between 100 and 200;
# in 判断某字段的值是否属于in列表的某一项 in 列表的值必须统一或者兼容
# = 不能判断null 用is null判断 is not null
SELECT name
FROM students
WHERE name LIKE '%v%';

# is null 与 <=>
(安全等与效果一样)


# 进阶三 排序查询 order by asc desc 升序还是降序
(从高到底)

SELECT *
FROM students
ORDER BY id DESC
;

SELECT *
FROM students
ORDER BY id ASC
;

# 条件查询和排序查询的配合 ASC DESC 升序 降序 不写默认是升序 排序查询是在条件查询之后的 order by 一般放在查询字句的最后面 limit字句除外

SELECT *
FROM students
WHERE id >1996
ORDER BY tel ASC;

# 按表达式排序

# 按别名排序 ORDER BY 支持别名

# 按函数排序
SELECT LENGTH(last_name) AS 字节长度, last_name, salary
FROM employees
ORDER BY LENGTH(last_name) DESC
;


# 如果你执行数据库表格没有的列 它就尝试执行这个列按照一样的返回给你 如果有表达式就返回表达式的执行结果--相当于print

SELECT '你好'
FROM employees;

SELECT '你好' AS 无中生有
FROM employees;

SELECT '你好' AS 无中生有;

SHOW DATABASES ;

USE myemployees;

SHOW TABLES;

SELECT *
FROM employees;


# 先按工资排序 再按id排序  按多个列排序 多个列排序是在第一个数据有相等的情况下再进行排序 否则无效

SELECT *
FROM employees
ORDER BY salary ASC,employee_id DESC
;


# 进阶四 常用函数学习 函数最后的作用都是作用于查询出来的值

/*
分类
1.单行函数
   字符串函数--传入的参数是字符串
   LENGTH 返回字节的个数-- 中文占三个字节 英文一个字节
   CONCAT 拼接字符串
   UPPER LOWER 作用于查出来的值是大写还是小写
2.分组函数 做统计使用 统计函数 聚合函数

*/

SELECT LENGTH(last_name)
FROM employees;

# 列的名字是这样拼接起来 同样的筛选出来的值也会拼接
SELECT CONCAT(last_name,'-',first_name)
FROM employees;

# 返回子串第一次出现的索引，如果找不到返回0 不是字节
SELECT INSTR('杨不殷六侠悔爱上了殷六侠','殷')  out_put;

# TRIM去除前后空格 或者去除指定的常量参数
SELECT LENGTH(TRIM('    张翠山    ')) AS out_put;

SELECT TRIM('aa' FROM 'aaaaaaaaa张aaaaaaaaaaaa翠山aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')  AS out_put;


SELECT LPAD('殷素素',20,'*') AS out_put;


SELECT NOW();

SELECT CURDATE();

SELECT YEAR('1998-1-1') 年;


SELECT YEAR(hiredate) 年
FROM employees;

SELECT *
FROM employees
WHERE  hiredate = '1992-4-3';

SELECT *
FROM employees
WHERE hiredate = '1992-4-3';

SELECT STR_TO_DATE('1998-3-2','%Y-%c-%d') AS out_put;


SELECT *
FROM employees
WHERE hiredate = STR_TO_DATE('4-3 1992','%c-%d %Y');

SELECT STR_TO_DATE('1998-3-2','%Y-%c-%d') AS out_put;

SELECT STR_TO_DATE('4-3 1992','%c-%d %Y') AS date;
# 1992-04-03 格式最后是这样

SELECT STR_TO_DATE('1992-4-3','%Y-%c-%d') AS date;
# 效果一样

#date_format 将日期转换成字符

SELECT DATE_FORMAT(NOW(),'%y年%m月%d日') AS out_put;

SELECT
IF(10<5,'大','小');


SELECT last_name, commission_pct, 
IF(commission_pct IS NULL,'没奖金，呵呵','有奖金，嘻嘻') 备注
FROM employees;

# 查询
SELECT 就是拿到值
SELECT USER
();


#
SELECT 后跟表达式

SELECT salary '原工资', department_id, CASE department_id
WHEN 30 THEN salary*1.1
WHEN 40 THEN  salary*1.2
WHEN 50 THEN  salary*1.3
ELSE salary
END AS  '新工资'
FROM employees;


# 返回一个值
# 参数类型有要求 比如求和 就是int类型 但是传错SQL语言也不会给你报错
SELECT SUM(salary)
FROM employees;


SELECT AVG(salary)
FROM employees;


SELECT MIN(salary)
FROM employees;

SELECT MAX(salary)
FROM employees;

SELECT COUNT(salary)
FROM employees;
/*
调用语法：select函数名（实参列表）；
分组函数和单行函数的区别：
        单行函数：将一个数据进行处理，返回一个值
        分组函数：将虚拟表看做一个组，处理一组数据，返回一个值
*/



# 函数是和SELECT配合返回查询后的值


# SQL语言中null+任何值都为null


SELECT COUNT(*)
FROM employees;

SELECT COUNT(1)
FROM employees;

SELECT COUNT(2)
FROM employees;


# 分组查询有它存在的意义 比如每个部门的平均工资 分组函数的作用对象是组的

# 可以使用GROUP_BY将表中的数据分成若干组--分组

# 明确 WHERE一定放在FROM后面 分组查询是配合分组函数使用的

# 哪个部门的id
# 查询列表必须特殊，要求是分组函数和group_by后出现的字段

SELECT MAX(salary) AS '最高工资', job_id
FROM employees
GROUP BY job_id;

# 加多一个这个 employee_id会报错
# 一、group by语法可以根据给定数据列的每个成员对查询结果进行分组统计，最终得到一个分组汇总表。 你在这个返回来的组想想可以进行什么操作->分组函数被
# 这个组就是一个整体



SELECT employee_id
FROM employees
GROUP BY employee_id;

# SELECT的前面选择的列意思是查询数据这个列的值，后面的字句是根据其规则返回---理解很重要

SELECT job_id
FROM employees;
# 107

SELECT job_id
FROM employees
GROUP BY job_id;
# 19

# 查询每个位置的部门个数  分组查询 你就是可以将以条件分组得到的组进行使用  返回的都是组及的 要操作都是都是对组操作的
# 这个返回的值实际是一个组 这个组是封闭 你可以看成 不可以从里面取值 但是你可以使用分组函数进行操作
# 字句查询的是行

SELECT MAX(salary) AS '最高工资', job_id, employee_id
FROM employees
GROUP BY job_id;

# 所以你才可以从这个组拿到这个列 也就是SELECT语句你可以这样理解 从字句查询出来的拿到SLECT后面的列【字句是大的集合,就是只的集合 比如WHERE id>10 返回一系列集合再根据主句里取值】 按照列取出来

# 所以应该是这样执行的 首先根据字句的表达式筛选出符合的行--->然后再根据主句的条件进行拿值 ---  卧槽 这样的理解终于顺畅了

# 我先从group_by拿到分组信息 再根据这个组进行主句拿值---顺畅了 这个组是一个整体的值了
SELECT job_id
FROM employees
GROUP BY job_id;
# 19


SELECT COUNT(*), location_id
FROM departments
GROUP BY  location_id;


SELECT *
FROM departments;


# 添加筛选条件进行分组查询

# 部门是用ID来确定的

SELECT AVG(salary), department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;


SELECT MAX(salary), manager_id
FROM employees
WHERE salary IS NOT NULL
GROUP BY manager_id;

# 分组函数是跟在SELCT后的一般

# 分组前筛选vs分组后筛选 分组前筛选效率高 因为省事啊


# 按多个字段进行分组


# 查询哪个部门的员工>2 分组后返回新的结果集 再进行筛选

SELECT COUNT(*) AS 部门人数, department_id
FROM employees
GROUP BY department_id
;

# 好像这样要求只能分组后查询
SELECT COUNT(*) AS 部门人数, department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;


# 统计行数 只要该行中有一列不是null 就统计上去
SELECT COUNT(*)
FROM employees;

SELECT COUNT(1)
FROM employees;
# 意思是加多一列1这样的 你数据库有多少行就加多少行 但这不是写入的（真正加入的）

# 类似的

SELECT COUNT('lin xiao shan')
FROM employees;


# 分组函数做条件（判断）肯定放在having函数后面





# SELECT后面跟着的字段就是从条件字句拿到的集合拿出来进行显示 ,所以你要隔了多少逗号n 就显示这么多n+1列

# 这样就能说明了 分组条件字句拿出来的是一个组为单位的 比如job_id 平均工资,但是确拿不到em.._id
# 你可以这样理解 字句筛选出来的数据 ->
SELECT 根据后面的字段A ->A去对应的B集合哪里拿对应的B字段
---这个理解很重要


# 一个部门可能有不同工作 job_id 每个工种的不同部门
SELECT MIN(salary), job_id, department_id
FROM employees
GROUP BY department_id,job_id
ORDER BY MIN(salary) DESC;


SELECT job_id
FROM employees;
# FROM employess employess是一个数据库表 字句比如where id>10是对这个数据库表作为筛选
(整张表不是列) 然后job_id是决定你要从这个数据库拿什么字段
# 不存在主句拿到的是列 字句拿到的行的乱七八糟的操作
#
SELECT manage_id
FROM employees WHERER
job_id>10; 以前存在的疑惑是主句是manage_id 而子句是job_id不是查询一一对应的 现在就比较好解释了 要知道行为如何和作用对象
# 以前的误会是认为你子句作为条件是什么就只能拿到什么 很明显我对这sql行为不理解导致的

# 如前所述，将数据分解为多个表能更有效地存储，更方便地处理，并且
# 可伸缩性更好。但这些好处是有代价的。
# 如果数据存储在多个表中，怎样用一条
SELECT 语句就检索出数据呢
?
# 答案是使用联结。简单说，联结是一种机制，用来在一条
SELECT 语句 中关联表
，因此称为联结。使用特殊的语法，可以联结多个表返回一组 输出，联结在运行时关联表中正确的行。


# 连表查询 -->A表拿着其中一个字段去跟B表匹配 如果没有加筛选条件就全部匹配得到 很神奇这种
# 就跟我拿数据没有的字段去跟数据库匹配

SHOW TABLES;

SELECT name, boyName
FROM beauty, boys;

SELECT name, boyName
FROM beauty, boys
WHERE beauty.boyfriend_id=boys.id;

SELECT name, boyName
FROM beauty AS be, boys AS bo
WHERE beauty.boyfriend_id=boys.id;

# 数据库表用别名 前面的主句查询列可以用be.name 因为就是从表取的 根据执行顺序我先走
SELECT name, boyName FROM再取SELECT
name,boyName

use myemployees;


SELECT MIN(salary), job_id, COUNT(*)
FROM employees
GROUP BY job_id
ORDER BY MIN(salary) DESC;
# 20个小组

# 报错 分组返回的数据表比较特殊 只能你取你按照分组的判断字段和分组函数 其他字段会报错  --这样也是有原因的 真想打印出来这个分组表是长什么样子的(我猜就是一组一组的 )
# 如果这个字段跟子句的字段是一一对应的也不会报错
SELECT *
FROM employees
GROUP BY job_id
ORDER BY MIN(salary) DESC;

SELECT MIN(salary), job_id, department_id, COUNT(*) #
21个小组
FROM employees
GROUP BY department_id,job_id  # 根据department_id分成组 又在这个组根据job_id分成更多的小组，所以按照理解会拆的更细
ORDER BY MIN
(salary) DESC;


SELECT MIN(salary), job_id, department_id
FROM employees
GROUP BY job_id,department_id
ORDER BY MIN(salary) DESC;


# 如果现在要进行分组的话，则SELECT子句之后，只能出现分组的字段和统计函数，其他的字段不能出现： --- 很重要
# 在group by 子句中，可以按单列进行分组，也可以在多列上进行分组，多列分组就是按照多个字段的组合进行分组，最终的结果也会按照分组字段进行排序显示。
SELECT MIN(salary), job_id, department_id, salary
FROM employees
GROUP BY job_id,department_id,employee_id
ORDER BY MIN(salary) DESC;

# group by 有一个原则,就是
select 后面的所有列中, 没有使用聚合函数的列, 必须出现在
group by 后面

# Group By子句可以包含任意数目的列，因而可以对分组进行嵌套,进行更细致的分组。

# 如果在Group By子句中嵌套了分组,数据将在最后指定的分组上进行汇总。换句话说,在建立分组时，指定的所有列都一起计算
(不能从个别的列中取回数据)。


# GROUP BY X意思是将所有具有相同X字段值的记录放到一个分组里。
# 那么GROUP BY X, Y呢？
# GROUP BY X, Y意思是将所有具有相同X字段值和Y字段值的记录放到一个分组里。
#
https:
//blog.csdn.net/lin74love/article/details/80856067

#
SELECT last_name, department_name, city
FROM employees e, departments d, locations l
WHERE e.`department_id`=d.`department_id`
	AND d.`location_id`=l.`location_id`
	AND city LIKE 's%'
ORDER BY department_name DESC;


#案例1：查询员工的工资和工资级别
SELECT salary, grade_level
FROM employees e, job_grades g
WHERE salary BETWEEN g.`lowest_sal
` AND g.`highest_sal`
AND g.`grade_level`='A';

# JOIN字段 有join字段我们更加清楚明白这是连表查询
#
说明:
“正确的”语法
# ANSI SQL 规范首选 INNER JOIN 语法，之前使用的是简单的等值语 法。
# 其实，SQL 语言纯正论者是用鄙视的眼光看待简单语法的。这就 是说，DBMS 的确支持简单格式和标准格式，我建议你要理解这两种 格式，具体使用就看你用哪个更顺手了

SELECT department_id, city
FROM departments, locations
WHERE departments.location_id=locations.location_id;

SELECT department_id, city
FROM locations INNER JOIN departments d on locations.location_id = d.location_id


USE myemployees;

SHOW TABLES ;

 # 显示所有员工的姓名，部门号和部门名称
 # 员工对应的姓名部门号和部门名称这些字段在两个表所以得关联起来
 # 为什么要关联 因为是同个员工
 # WHERE employees.department_id=d.department_id关联起来
SELECT last_name, d.department_id, department_name
FROM employees, departments AS d
WHERE employees.department_id=d.department_id;


# 查询90号部门员工的job_id和90号部门的location_id
(分析为了显示查询的这两个字段job_id和location_id在不同的表里所以需要连表查询--以字段判断是不是多张表)
 # 这里为什么要关联 因为同个部门 筛选出job_id location_id 所以需要连表 这就是关联的原因
 #
(employees表没有location_id)
SELECT e.job_id, d.location_id, e.department_id
FROM employees AS e, departments AS d
WHERE d.department_id=e.department_id AND d.department_id=90;


# 选择有奖金的

# 为什么要关联表？ 因为我要查的这个字段这个表没有
# 而且查询的时候a,b,c这种字段都是在同一行的层级的 连表就是AB筛选返回新的表然后abc都在同级的行里 注意了吧  这种是显而易见的限定死的
# 以前没有关注查询的字段是同一行的 实际也不用关注 这是表格的特性
# 因为是同一行的关系所以他们必须有关系才是

# 现实判断中我们查询的字段判断是否在不同表就行 （而且还有一点 字段的层级都是同个行 所以不用想就是连表查询）


# 选择所有有奖金的员工
(员工所有信息)


# 三表连接 ABC A和B连结产生新的表AB再和C连接产生新的表ABC -- 这样理解的 -- 很重要

# 分组查询再复习
# 查询每个工种,每个部门的最低工资

SELECT *
FROM jobs
GROUP BY job_id;

SELECT job_id
FROM jobs
GROUP BY job_id;

SELECT MIN(salary), job_id, department_id, COUNT(*) #分组
组内的行数（对而且每行必定有这个XY字段且每行的 X，Y都相同，不是X和Y相等）
FROM employees
GROUP BY department_id,job_id
ORDER BY MIN
(salary) DESC;

# GROUP BY X, Y意思是将所有具有相同X字段值和Y字段值的记录放到一个分组里。
# 意思就是具备想x,y相同字段就放进一个组里 （最少一个组拥有一行）
# 而不是根据分完X组再在这个新的表再进行分组
# X和Y是没有包含和被包含的关系的
(是并且的关系)
# 我们下面再接着要求统计出每门学科每个学期有多少人选择，应用如下SQL：
# 上面SQL的意思是，对Subject_Selection表中的数据进行分组，将具有相同Subject和Semester字段值的记录放到同一个分组里去， 然后对每个分组中的数据应用聚合函数（COUNT，SUM， AVG，etc）。

# 所以查询前是不是应该第一点就确定要查询的字段是不是在同个表里 然后就是有没有出现分组的情况 --- 很重要

# 连表查询
  # 等值连接 就是=有等与号
  # 非等值连接就是不包含等于=号（大于小于等等情况）
  # 自连接（两张表都是自己）
/*
连表查询分类
分类：

	按年代分类：
	sql92标准:仅仅支持内连接
	sql99标准【推荐】：支持内连接+外连接（左外和右外）+交叉连接

	按功能分类：
		内连接：
			等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接

		交叉连接

*/


# 查询员工名和上级的名称 - 应该就是该员工及其它上级
# 列出所有员工的姓名及其直接上级的姓名

# 查询员工的名称和上级的名称我有一层理解 就是查询对应的员工和对应的leader
# 但是还有一层理解这个员工即是员工还是leader --应该不是错误

# 我知道的它的意思了 就是说员工表里面没有直接的manage_name字段但是leader也是属于员工 就是查询leader的名字 用两张相同表关联下就行
# 还是那句话 如果这个表的没有字段 就是需要别的表 但是如果这个字段可以从这张表转化一下也能拿到就是自连接了
SELECT e.employee_id, e.last_name, m.employee_id, m.last_name
FROM employees e, employees m
WHERE e.`manager_id`=m.`employee_id`;

/*
二、sql99语法

语法：
	select 查询列表
	from 表1 别名 【连接类型】
	join 表2 别名
	on 连接条件
	【where 筛选条件】
	【group by 分组】
	【having 筛选条件】
	【order by 排序列表】


分类：
内连接（★）：inner
外连接
	左外(★):left 【outer】
	右外(★)：right 【outer】
	全外：full【outer】
交叉连接：cross

1.内连接
④inner join连接和sql92语法中的等值连接效果是一样的，都是查询多表的交集

1.1.等值连接：在连接条件中使用等于号(=)运算符比较被连接列的列值，其查询结果中列出被连接表中的所有列，包括其中的重复列。

1.2.不等值连接：在连接条件使用除等于运算符以外的其它比较运算符比较被连接的列的列值。这些运算符包括>、>=、<=、<、!>、!<和<>。

1.3.自然连接：在连接条件中使用等于(=)运算符比较被连接列的列值，但它使用选择列表指出查询结果集合中所包括的列，并删除连接表中的重复列。

内连接：内连接查询操作列出与连接条件匹配的数据行，它使用比较运算符比较被连接列的列值。

1.外连接
3.交叉连接

左连接
右连接
全连接
交叉连接：交叉联接返回左表中的所有行，左表中的每一行与右表中的所有行组合。交叉联接也称作笛卡尔积。

*/

# 条件位置要么在主句要么在子句