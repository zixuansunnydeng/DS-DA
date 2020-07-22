# Concepts of SQL

> primary_poc: A column name in the Parch & Posey database.

>web_events: A table name in the Parch & Posey database.

>SQL: A language that allows us to access data stored in a database.  

>ERD: A diagram that shows how data is structured in a database.  

>web_events: A table name in the Parch & Posey database.  

>database: A collection of tables that share connected data stored in a computer.

--- 
# Conclusion of SQL Statement
These are examples, no real dataste, tables. 


### SELECT
```sql
select * from emp;
select a.SAL from emp a;
select a.SAL*from emp a;
select avg(a.sal) from emp a;
select sum(a.sal) from emp a;
select max(a.sal) from emp a;
select min(a.sal) from emp a;
select * form emp where sal<1000;
select enmae from emp where ename like '%A%'; 
select * from emp where ename not like '%A%';
selecy deptno from emp where ename='SMITH';
select sysdate from dual; -- find system time
select sum(sal) from emp where sal<5000;
select sum(sal) from emp where sal<(select avg(sal) from emp); -- calculte the sum of sallary less than average salary. 
select avg(select sum(sal) from emp where sal<1000) from emp; 
select max(sal), min(sal) from emp where deptno=20; 
select * from emp where sal>1000 and deptno=20; 
select ename, deptno, sal from emp where sal=(select max(sal) from emp); -- Get stuff name, department name, salary of that has highest salary.
-- Get stuff who has salary less than 5000 but their average salary in department is greater than 1000, then descending by average salary of each department.
select deptno from emp where sal<5000 group by deptno haveing avg(sal)>1000 order by avg(sal) desc;

select e.ename,e.deptno,e.sal 
from (select deptno as did ,max(sal) as m from emp group by deptno ) 
where e.sal=s.m and s.did=e.deptno and d.deptno=e.deptno
order by sal desc;
```

get the first person enter after 'Jones'

`select * from emp
where hiredate=(select min(hiredate) from emp where hiredate>(select hiredate from emp where ename='JONES'));`


### CREATE TABLE
```sql
create table student(
    Studentld number (6),
    LoginPwd varchar(20),
    StudentName varchar(50); 
    Sex char(2),
    Gradeld Number(6),
    Phone number(15),       
    Address varchar2(255),
    BornDate Date,
    Emile varchar2(50)       
);
```
-- insert data into table. 

`insert into student value(1001,'123456','John','Male',1507,120,'Toronto','23-5-1995','@10422');`


`update student set studentname='Peter', loginpwd='666666' where studentid=1001; `

`delete from studnet where studentid=1002;`

**Column COnstraints**

```sql
CREATE TABLE student(
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE,
    grade INTEGER NOT NULL,
    age INTEGER DEFAULT 10;
);
```
`PRIMARY KEY` column can be used to uniquely identify the row. 

`UNIQUE` columns have a different value for every row. 

`NOT NULL` col must have value. 

`DEFAULT` assigns a default value for column when no value is specified.

**NOTICS: There can be only one `PRIMARY KEY` column per table and multiple `UNIQUE` columns.**

### JOIN
**Inner join**

An inner join matches each row of one table with rows of a second table based on a common column. The resulting table will only contain rows where there is a match in both the left and right tables.

```SQL
SELECT *
FROM table1
JOIN table2
    ON table1.id=table2.table1_id;
```


**LEFT JOIN**

A left join matches each row of one table with rows of a second table based on a common column. The resulting table will only contain all data from the first (left) table, and additional data from the second (right) table.


```SQL
SELECT * 
FROM table1
LEFT JOIN table2
    ON table1.id =table2.table1.id;
```

**CROSS JOIN** 

A cross join combines all rows of one table with all rows of another table. One row by all rows of table2.
```sql 
SELECT table1.col1, table1.col2
FROM table1
CROSS JOIN table2;
```


**UNION**

PUT All together. 
```sql
SELECT * 
FROM table1
UNION
SELECT *
FROM table2;
```

# What is substring, window function
### Substring Sybtax

`SUBSTRING(string, start, length)`

### window function

OLAP function - Online Anallytical Processing
1)同时具有分组和排序的功能
2)不减少原表的行数
3)语法见前

<window function> over (partition by <用于分组的列名> order by <用于排列的列名>)
    
    **Window Function**
    - 专用窗口函数:  rank, dense_rank, row_number
        - rank 函数:如果有并列名次的行，会占用下一名次的位置。
        - dense_rank 函数:如果有并列名次的行，不占用下一名次的位置。
        - row_number函数:不考虑并列名次的情况。
    - 聚合函数: sum,avg,count,max,min
    因为窗口函数是对where 或者group by 子句处理后的结果进行操作，所以窗口函数原则上只能写在select 子句中。
    
1. Use rank
- 对每个班级内按成绩排名结果
```sql
select *
rank() over(partition by 班级 order by 成绩 desc) as ranking from 班级表
```

- top N
  - the largest records number.  ```select * from ( xxxxselect * , row_number() over(partition xxx)as xxxx from xx) where ranking<=N
  
2. Aggregate window function
```sql
select *,
sum(成绩) over(order by 学号) as current_sum
from 班级表
```
聚合函数sum在窗口函数中，是对自身记录、及位于自身记录以上的数据进行求和的结果。平均、计数、最大最小值也是同理。


# Case when
```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;   (optional --> END AS YOUR_CASE_VARIABLE) 
```

# Cofusion Part
- `Delete` , `Drop` 
    
    `Delete` will detele the records, but `drop` will drop columns, variables. 
- `Having`, `Where` 

    `Having` the always happen with `GROUP BY`, which means it will do any filter for the group. 
    `Where` is do filter before `GROUP BY`. 



# Delete MySQL in Mac


```
1 sudo rm /usr/local/mysql
2 sudo rm -rf /usr/local/mysql*
3 sudo rm -rf /Library/StartupItems/MySQLCOM
4 sudo rm -rf /Library/PreferencePanes/My*
5 vim /etc/hostconfig  (and removed the line MYSQLCOM=-YES-)
6 rm -rf ~/Library/PreferencePanes/My*
7 sudo rm -rf /Library/Receipts/mysql*
8 sudo rm -rf /Library/Receipts/MySQL*
9 sudo rm -rf /var/db/receipts/com.mysql.*
```