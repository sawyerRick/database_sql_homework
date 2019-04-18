create database testdb

go
 use  testdb

go
 create table employee
 (
 emp_no char(5) primary key, --员工编号
emp_name char(10) not null, --员工姓名
sex char(1) not null, -- 性别
dept char(4) not null, --部门
title char(6) not null, --职称
date_hired datetime not null,--上任日期
birthday datetime null, --生日
salary int not null, --工资
addr char(50) null, -- 住址
modifier char(5) default (user_name(null)), --操作人
mod_date datetime default (getdate()) -- 操作日期

)

go

create table customer
 (
 cus_id char(5) primary key , --客户编号
cus_name char(20) not null, --客户姓名
addr char(40) not null, --客户住址
tel_no char(10) not null, --客户电话
zip char(6) null --邮递区号

)

go

create table sales
 (
 order_no int identity(1000,1) not null,--定单编号
cus_id char(5) not null, --客户编号
sale_id char(5) not null, --业务员编号
toa_amt numeric (9,2) not null, --定单金额
order_date datetime default(getdate()),--定货日期0
 ship_date datetime not null,--出货日期
invoice_no char(10) not null,--发票号码
o_static char(2) not null,--定单处理状况
constraint UQ_invoice unique nonclustered (invoice_no)
 )

go

create table sale_item
 (
 order_no int not null, --定单编号
prod_id char(5) not null,--产品编号
sup_id char(5) not null, --供应商编号
qty int not null, --销售数量
unit_price numeric (7,2) not null, --单价
order_date datetime null,--定单日期
constraint pk_sale_item primary key clustered(order_no,prod_id,sup_id)
 )

go

create table stock
 (
 prod_id char(5) not null, --产品编号
sup_id char(5) not null, --供应商编号
stk_qty int not null, --库存数量
constraint pk_stock primary key clustered(prod_id,sup_id)
 )

go

create table pur_item
 (
 pur_no int not null, --采购定单
prod_id char(5) not null,--产品编号
sup_id char(5) not null,--供应商编号
qty int not null, --采购数量
unit_price numeric(7,2) not null, --单价
pur_date datetime not null, --采购日期
constraint pk_pur_item primary key clustered(pur_no,prod_id,sup_id)
 )

go

create table product
 (
 prod_id char (5) primary key, --产品编号
prod_name char(20) not null --产品名称
)

go

create table supply
 (
 sup_id char(5) not null, --供应商编号
sup_name char(20) null --供应商名称
)
go

insert into employee values('E0001','王大华','M','业务','经理','1976/10/13','1951/08/01',80000,'上海市',default,default)
 insert into employee values('E0003','陈自强','M','会计','科长','1986/09/15','1963/06/09',48000,'南京市',default,default)
 insert into employee values('E0014','周小梅','F','业务','职员','1996/03/01','1970/03/28',32000,'上海市',default,default)
 insert into employee values('E0009','陈建国','M','管理','科长','1987/04/15','1967/09/01',45000,'天津市',default,default)
 insert into employee values('E0017','林光华','M','业务','职员','1995/10/13','1973/08/17',30000,'上海市',default,default)
 insert into employee values('E0006','李珠珠','F','管理','经理','1988/01/01','1961/07/12',60000,'北京市',default,default)
 insert into employee values('E0002','李庄敬','M','人事','科长','1980/09/15','1958/05/03',80000,'广州市',default,default)
 insert into employee values('E0010','王成功','M','信息','职员','1993/02/15','1969/04/15',45000,'北京市',default,default)
 insert into employee values('E0013','陈中华','M','业务','职员','1993/02/15','1966/07/01',43000,'天津市',default,default)
 insert into employee values('E0008','刘刚', 'M','业务','职员','1994/11/01','1968/08/01',40000,'上海市',default,default)
 insert into employee values('E0005','李珊珊','F','会计','职员','1990/03/20','1967/04/25',38000,'上海市',default,default)
 insert into employee values('E0011','李小蓉','F','人事','职员','1994/11/01','1971/11/18',30000,'重庆市',default,default)
 insert into employee values('E0012','蔡文钦','M','制造','厂长','1984/08/15','1960/07/21',50000,'上海市',default,default)
 insert into employee values('E0015','张大山','M','制造','职员','1993/12/15','1968/09/23',35000,'上海市',default,default)
 insert into employee values('E0007','吴铁雄','M','信息','科长','1989/10/01','1965/04/18',50000,'武汉市',default,default)
 insert into employee values('E0016','方美美','F','业务','职员','1992/05/20','1966/06/23',40000,'上海市',default,default)
 insert into employee values('E0004','刘中星','M','制造','经理','1984/05/01','1960/05/23',60000,'上海市',default,default)
 insert into employee values('E0019','王仁华','M','信息','经理','1985/09/15','1959/03/24',60000,'上海市',default,default)
 insert into employee values('E0020','陈火旺','M','业务','职员','1992/08/01','1964/05/12',43000,'天津市',default,default)
 insert into employee values('E0018','林中正','M','管理','总经理','1974/10/01','1953/05/04',100000,'上海市',default,default)

go

insert into customer values('C0001','ABC股份有限公司','上海市','64284881','116011')
insert into customer values('C0002','康师傅 ','天津市','54685212','116025')
insert into customer values('C0003','联想','北京市','66544654','456131')
insert into customer values('C0004','HP','上海市','46466996','012365')
insert into customer values('C0005','华为','北京市','87434647','789258')
insert into customer values('C0006','海尔','上海市','01554689','741852')
insert into customer values('C0007','华信','上海市','36985214','132798')

go
 set identity_insert sales on
 GO
 insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10002','C0002','E0013',22700.00,'1996/11/10','1996/11/17','I000000002','00')
insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10003','C0003','E0014',13960.00,'1996/10/15','1996/10/17','I000000003','00')
insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10004','C0003','E0014',33000.00,'1996/12/10','1996/12/17','I000000004','00')
insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10001','C0001','E0008',60000.00,'1996/10/22','1996/10/24','I000000001','00')
insert into sales (order_no,cus_id,sale_id,toa_amt,order_date,ship_date,invoice_no,o_static)values

('10007','C0008','E0008',20000.00,'1996/10/15','1996/10/17','I000000008','00')
GO
 SET IDENTITY_INSERT SALES OFF
 GO
 INSERT INTO SALE_ITEM VALUES(10001,'P0001','S0001',5,2500.00,'1996/10/22')
INSERT INTO SALE_ITEM VALUES(10001,'P0002','S0001',3,6500.00,'1996/10/22')
INSERT INTO SALE_ITEM VALUES(10001,'P0003','S0001',2,5300.00,'1996/10/22')
INSERT INTO SALE_ITEM VALUES(10001,'P0004','S0001',2,1600.00,'1996/10/22')
INSERT INTO SALE_ITEM VALUES(10002,'P0001','S0002',3,2600.00,'1996/11/10')
INSERT INTO SALE_ITEM VALUES(10002,'P0003','S0001',1,5300.00,'1996/11/10')
INSERT INTO SALE_ITEM VALUES(10002,'P0008','S0004',2,4800.00,'1996/11/10')
INSERT INTO SALE_ITEM VALUES(10003,'P0001','S0002',4,2700.00,'1996/10/15')
INSERT INTO SALE_ITEM VALUES(10003,'P0004','S0003',2,1580.00,'1996/10/15')
GO
 INSERT INTO STOCK VALUES('P0001','S0001',200)
 INSERT INTO STOCK VALUES('P0001','S0002',120)
 INSERT INTO STOCK VALUES('P0001','S0004',150)
 INSERT INTO STOCK VALUES('P0002','S0001',20)
 INSERT INTO STOCK VALUES('P0002','S0002',10)
 INSERT INTO STOCK VALUES('P0003','S0001',15)
 INSERT INTO STOCK VALUES('P0008','S0002',120)
 INSERT INTO STOCK VALUES('P0012','S0007',20)
 INSERT INTO STOCK VALUES('P0013','S0003',30)
 INSERT INTO STOCK VALUES('P0013','S0005',20)
 GO
 INSERT INTO PUR_ITEM VALUES(50001,'P0001','S0001',20,2000.00,'1996/10/25')
INSERT INTO PUR_ITEM VALUES(50001,'P0008','S0002',25,5000.00,'1996/10/25')
INSERT INTO PUR_ITEM VALUES(50003,'P0001','S0001',10,2150.00,'1996/07/15')
INSERT INTO PUR_ITEM VALUES(50005,'P0008','S0004',30,4500.00,'1996/08/10')
GO
 INSERT INTO PRODUCT VALUES('P0001','16M DRAM')
INSERT INTO PRODUCT VALUES('P0002','14寸显示器')
INSERT INTO PRODUCT VALUES('P0003','1.2GB硬盘')
INSERT INTO PRODUCT VALUES('P0004','3.5寸软驱')
INSERT INTO PRODUCT VALUES('P0005','键盘')
INSERT INTO PRODUCT VALUES('P0006','VGA 显示卡')
INSERT INTO PRODUCT VALUES('P0007','网卡')
INSERT INTO PRODUCT VALUES('P0008','PENTIUM 100 CPU')
INSERT INTO PRODUCT VALUES('P0009','激光打印机')
INSERT INTO PRODUCT VALUES('P0010','8倍光驱')
INSERT INTO PRODUCT VALUES('P0011','计算机字典')
INSERT INTO PRODUCT VALUES('P0012','9600 bit/s MODEM')
INSERT INTO PRODUCT VALUES('P0013','pentium 主板')

GO
 INSERT INTO SUPPLY VALUES('S0001','联强国际')
INSERT INTO SUPPLY VALUES('S0002','宏基科技')
INSERT INTO SUPPLY VALUES('S0003','大众计算机')
INSERT INTO SUPPLY VALUES('S0005','华硕计算机')
INSERT INTO SUPPLY VALUES('S0006','英业计算机')
INSERT INTO SUPPLY VALUES('S0007','华夏电子')
INSERT INTO SUPPLY VALUES('S0004','联华电子')

/*
请写出下列要求的sql语句
1.按公司客户所在地来统计销售总额

select * from customer

select * from sales


select addr, sum(toa_amt) as toa_amt
from sales, customer
where sales.cus_id=customer.cus_id
group by addr

2.查询公司从96年8月开始单价超过2000块的采购单号和供应商

select pur_no, sup_id from pur_item
where year(pur_date) >= 1996 and month(pur_date) >= 8 and unit_price >= 2000

3.查询公司目前库存商品的名称和数量

select prod_name, count(prod_name) as sum
from stock, product
where stock.prod_id = product.prod_id
group by prod_name

4.查询公司采购金额超过10万的定单信息（包括 定单号厂家 商品名）

select * from pur_item
select * from supply
select * from product

select *
from pur_item, supply, product
where pur_item.sup_id=supply.sup_id and product.prod_id=pur_item.prod_id and qty*unit_price >= 100000

5.查询库存量前三名的产品名称

select * from stock

select top 3 prod_name, stk_qty
from stock, product
where stock.prod_id=product.prod_id
order by stk_qty DESC


6.查询库存商品销售金额在第三到第六的供货商的信息

select * from stock
select * from sale_item
select * from supply

select top 4 sup_name, qty * unit_price as sum
from(select top 6 sup_name, qty * unit_price as sum, qty, unit_price
from stock, sale_item, supply
where stock.prod_id=sale_item.prod_id and sale_item.sup_id=supply.sup_id
order by (qty * unit_price) DESC) as T
order by (T.qty * T.unit_price)

7.查询同一类型产品有两家以上供货商的产品编号以及供货商的数量

select * from product
select * from stock
select * from supply

select prod_id, count(prod_id) as sup_num
from stock
group by prod_id having count(prod_id) >= 2

8.统计公司各种产品的销售金额（需要区分不同的厂家）

select prod_id, sup_id, qty * unit_price as toa_amt
 from sale_item

9.查询公司在96年10月的定单，计算每日定单金额，并按照定单金额排序

select order_date, sum(qty * unit_price) as amt
from sale_item
where year(order_date) = 1996 and month(order_date) = 10
group by order_date
order by amt

10.查询一笔销售记录中包含有两条明细记录的销售总帐记录



select * 
from sales
where order_no in (select order_no
from sale_item
group by order_no having count(order_no) = 2
)

11.查询销售总表和销售明细表中不符合参照关系的数据（定单编号为参照字段）。

select * from sales
select * from sale_item

12.查询每个员工的工资以及应该交纳的个人所得税金额（40000以下不交，40000---49999 5%   50000—59999 7% 60000以上 10%）
13.生成公司销售的明细表要求表中需要表现的信息为（定单号，销售员姓名，销售产品，供伙商名称，销售金额）
14.在采购明细表中查询 同类产品在不同时间进货差价超过200元的产品及供货商名称
15.查询在同一天进入公司的员工信息
16.查询公司所有客户在公司的定货情况
17.查询由公司女业务员所接回的定单
18.查询公司中姓名相同的员工并按照员工编号显示员工信息
19.查询公司中目前业绩还没有超过2万的业务员
20.查询仓库中还没有销售过的产品信息
21.查询没有在公司订购产品的客户名单
22.按照供货商来统计公司的销售榜

请提交所有SQL语句以及看得出实验过程含有总结和体会的实验报告
*/