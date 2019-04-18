create database testdb

go
 use  testdb

go
 create table employee
 (
 emp_no char(5) primary key, --Ա�����
emp_name char(10) not null, --Ա������
sex char(1) not null, -- �Ա�
dept char(4) not null, --����
title char(6) not null, --ְ��
date_hired datetime not null,--��������
birthday datetime null, --����
salary int not null, --����
addr char(50) null, -- סַ
modifier char(5) default (user_name(null)), --������
mod_date datetime default (getdate()) -- ��������

)

go

create table customer
 (
 cus_id char(5) primary key , --�ͻ����
cus_name char(20) not null, --�ͻ�����
addr char(40) not null, --�ͻ�סַ
tel_no char(10) not null, --�ͻ��绰
zip char(6) null --�ʵ�����

)

go

create table sales
 (
 order_no int identity(1000,1) not null,--�������
cus_id char(5) not null, --�ͻ����
sale_id char(5) not null, --ҵ��Ա���
toa_amt numeric (9,2) not null, --�������
order_date datetime default(getdate()),--��������0
 ship_date datetime not null,--��������
invoice_no char(10) not null,--��Ʊ����
o_static char(2) not null,--��������״��
constraint UQ_invoice unique nonclustered (invoice_no)
 )

go

create table sale_item
 (
 order_no int not null, --�������
prod_id char(5) not null,--��Ʒ���
sup_id char(5) not null, --��Ӧ�̱��
qty int not null, --��������
unit_price numeric (7,2) not null, --����
order_date datetime null,--��������
constraint pk_sale_item primary key clustered(order_no,prod_id,sup_id)
 )

go

create table stock
 (
 prod_id char(5) not null, --��Ʒ���
sup_id char(5) not null, --��Ӧ�̱��
stk_qty int not null, --�������
constraint pk_stock primary key clustered(prod_id,sup_id)
 )

go

create table pur_item
 (
 pur_no int not null, --�ɹ�����
prod_id char(5) not null,--��Ʒ���
sup_id char(5) not null,--��Ӧ�̱��
qty int not null, --�ɹ�����
unit_price numeric(7,2) not null, --����
pur_date datetime not null, --�ɹ�����
constraint pk_pur_item primary key clustered(pur_no,prod_id,sup_id)
 )

go

create table product
 (
 prod_id char (5) primary key, --��Ʒ���
prod_name char(20) not null --��Ʒ����
)

go

create table supply
 (
 sup_id char(5) not null, --��Ӧ�̱��
sup_name char(20) null --��Ӧ������
)
go

insert into employee values('E0001','����','M','ҵ��','����','1976/10/13','1951/08/01',80000,'�Ϻ���',default,default)
 insert into employee values('E0003','����ǿ','M','���','�Ƴ�','1986/09/15','1963/06/09',48000,'�Ͼ���',default,default)
 insert into employee values('E0014','��С÷','F','ҵ��','ְԱ','1996/03/01','1970/03/28',32000,'�Ϻ���',default,default)
 insert into employee values('E0009','�½���','M','����','�Ƴ�','1987/04/15','1967/09/01',45000,'�����',default,default)
 insert into employee values('E0017','�ֹ⻪','M','ҵ��','ְԱ','1995/10/13','1973/08/17',30000,'�Ϻ���',default,default)
 insert into employee values('E0006','������','F','����','����','1988/01/01','1961/07/12',60000,'������',default,default)
 insert into employee values('E0002','��ׯ��','M','����','�Ƴ�','1980/09/15','1958/05/03',80000,'������',default,default)
 insert into employee values('E0010','���ɹ�','M','��Ϣ','ְԱ','1993/02/15','1969/04/15',45000,'������',default,default)
 insert into employee values('E0013','���л�','M','ҵ��','ְԱ','1993/02/15','1966/07/01',43000,'�����',default,default)
 insert into employee values('E0008','����', 'M','ҵ��','ְԱ','1994/11/01','1968/08/01',40000,'�Ϻ���',default,default)
 insert into employee values('E0005','��ɺɺ','F','���','ְԱ','1990/03/20','1967/04/25',38000,'�Ϻ���',default,default)
 insert into employee values('E0011','��С��','F','����','ְԱ','1994/11/01','1971/11/18',30000,'������',default,default)
 insert into employee values('E0012','������','M','����','����','1984/08/15','1960/07/21',50000,'�Ϻ���',default,default)
 insert into employee values('E0015','�Ŵ�ɽ','M','����','ְԱ','1993/12/15','1968/09/23',35000,'�Ϻ���',default,default)
 insert into employee values('E0007','������','M','��Ϣ','�Ƴ�','1989/10/01','1965/04/18',50000,'�人��',default,default)
 insert into employee values('E0016','������','F','ҵ��','ְԱ','1992/05/20','1966/06/23',40000,'�Ϻ���',default,default)
 insert into employee values('E0004','������','M','����','����','1984/05/01','1960/05/23',60000,'�Ϻ���',default,default)
 insert into employee values('E0019','���ʻ�','M','��Ϣ','����','1985/09/15','1959/03/24',60000,'�Ϻ���',default,default)
 insert into employee values('E0020','�»���','M','ҵ��','ְԱ','1992/08/01','1964/05/12',43000,'�����',default,default)
 insert into employee values('E0018','������','M','����','�ܾ���','1974/10/01','1953/05/04',100000,'�Ϻ���',default,default)

go

insert into customer values('C0001','ABC�ɷ����޹�˾','�Ϻ���','64284881','116011')
insert into customer values('C0002','��ʦ�� ','�����','54685212','116025')
insert into customer values('C0003','����','������','66544654','456131')
insert into customer values('C0004','HP','�Ϻ���','46466996','012365')
insert into customer values('C0005','��Ϊ','������','87434647','789258')
insert into customer values('C0006','����','�Ϻ���','01554689','741852')
insert into customer values('C0007','����','�Ϻ���','36985214','132798')

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
INSERT INTO PRODUCT VALUES('P0002','14����ʾ��')
INSERT INTO PRODUCT VALUES('P0003','1.2GBӲ��')
INSERT INTO PRODUCT VALUES('P0004','3.5������')
INSERT INTO PRODUCT VALUES('P0005','����')
INSERT INTO PRODUCT VALUES('P0006','VGA ��ʾ��')
INSERT INTO PRODUCT VALUES('P0007','����')
INSERT INTO PRODUCT VALUES('P0008','PENTIUM 100 CPU')
INSERT INTO PRODUCT VALUES('P0009','�����ӡ��')
INSERT INTO PRODUCT VALUES('P0010','8������')
INSERT INTO PRODUCT VALUES('P0011','������ֵ�')
INSERT INTO PRODUCT VALUES('P0012','9600 bit/s MODEM')
INSERT INTO PRODUCT VALUES('P0013','pentium ����')

GO
 INSERT INTO SUPPLY VALUES('S0001','��ǿ����')
INSERT INTO SUPPLY VALUES('S0002','����Ƽ�')
INSERT INTO SUPPLY VALUES('S0003','���ڼ����')
INSERT INTO SUPPLY VALUES('S0005','��˶�����')
INSERT INTO SUPPLY VALUES('S0006','Ӣҵ�����')
INSERT INTO SUPPLY VALUES('S0007','���ĵ���')
INSERT INTO SUPPLY VALUES('S0004','��������')

/*
��д������Ҫ���sql���
1.����˾�ͻ����ڵ���ͳ�������ܶ�

select * from customer

select * from sales


select addr, sum(toa_amt) as toa_amt
from sales, customer
where sales.cus_id=customer.cus_id
group by addr

2.��ѯ��˾��96��8�¿�ʼ���۳���2000��Ĳɹ����ź͹�Ӧ��

select pur_no, sup_id from pur_item
where year(pur_date) >= 1996 and month(pur_date) >= 8 and unit_price >= 2000

3.��ѯ��˾Ŀǰ�����Ʒ�����ƺ�����

select prod_name, count(prod_name) as sum
from stock, product
where stock.prod_id = product.prod_id
group by prod_name

4.��ѯ��˾�ɹ�����10��Ķ�����Ϣ������ �����ų��� ��Ʒ����

select * from pur_item
select * from supply
select * from product

select *
from pur_item, supply, product
where pur_item.sup_id=supply.sup_id and product.prod_id=pur_item.prod_id and qty*unit_price >= 100000

5.��ѯ�����ǰ�����Ĳ�Ʒ����

select * from stock

select top 3 prod_name, stk_qty
from stock, product
where stock.prod_id=product.prod_id
order by stk_qty DESC


6.��ѯ�����Ʒ���۽���ڵ����������Ĺ����̵���Ϣ

select * from stock
select * from sale_item
select * from supply

select top 4 sup_name, qty * unit_price as sum
from(select top 6 sup_name, qty * unit_price as sum, qty, unit_price
from stock, sale_item, supply
where stock.prod_id=sale_item.prod_id and sale_item.sup_id=supply.sup_id
order by (qty * unit_price) DESC) as T
order by (T.qty * T.unit_price)

7.��ѯͬһ���Ͳ�Ʒ���������Ϲ����̵Ĳ�Ʒ����Լ������̵�����

select * from product
select * from stock
select * from supply

select prod_id, count(prod_id) as sup_num
from stock
group by prod_id having count(prod_id) >= 2

8.ͳ�ƹ�˾���ֲ�Ʒ�����۽���Ҫ���ֲ�ͬ�ĳ��ң�

select prod_id, sup_id, qty * unit_price as toa_amt
 from sale_item

9.��ѯ��˾��96��10�µĶ���������ÿ�ն����������ն����������

select order_date, sum(qty * unit_price) as amt
from sale_item
where year(order_date) = 1996 and month(order_date) = 10
group by order_date
order by amt

10.��ѯһ�����ۼ�¼�а�����������ϸ��¼���������ʼ�¼



select * 
from sales
where order_no in (select order_no
from sale_item
group by order_no having count(order_no) = 2
)

11.��ѯ�����ܱ��������ϸ���в����ϲ��չ�ϵ�����ݣ��������Ϊ�����ֶΣ���

select * from sales
select * from sale_item

12.��ѯÿ��Ա���Ĺ����Լ�Ӧ�ý��ɵĸ�������˰��40000���²�����40000---49999 5%   50000��59999 7% 60000���� 10%��
13.���ɹ�˾���۵���ϸ��Ҫ�������Ҫ���ֵ���ϢΪ�������ţ�����Ա���������۲�Ʒ�����������ƣ����۽�
14.�ڲɹ���ϸ���в�ѯ ͬ���Ʒ�ڲ�ͬʱ�������۳���200Ԫ�Ĳ�Ʒ������������
15.��ѯ��ͬһ����빫˾��Ա����Ϣ
16.��ѯ��˾���пͻ��ڹ�˾�Ķ������
17.��ѯ�ɹ�˾Ůҵ��Ա���ӻصĶ���
18.��ѯ��˾��������ͬ��Ա��������Ա�������ʾԱ����Ϣ
19.��ѯ��˾��Ŀǰҵ����û�г���2���ҵ��Ա
20.��ѯ�ֿ��л�û�����۹��Ĳ�Ʒ��Ϣ
21.��ѯû���ڹ�˾������Ʒ�Ŀͻ�����
22.���չ�������ͳ�ƹ�˾�����۰�

���ύ����SQL����Լ����ó�ʵ����̺����ܽ������ʵ�鱨��
*/