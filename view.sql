create   database test
go
use test
go

create  table  s(
sno   char(2),
sn char(8),
sex char(2),
age tinyint,
dept char(10)
)
go
create  table   t
(
tno   char(2),
tn    char(8),
sex  char(2),
age  tinyint,
prof   char(10),
sal smallint,
comm   smallint,
dept  char(10)

)
go
create     table  c 
(
cno   char(2),
cn   char(10),
ct  tinyint
)
go
create  table sc
(
sno    char(2),
cno   char(2),
score   tinyint
)



-- 1
create view SCORE_VIEW
as 
select s.sno, sn, c.cn, score 
from s, sc, c
where s.sno = sc.sno and sc.cno = c.cno
-- 2
create view S_VIEW
as
select sno, sn,sex
from s
-- 3
insert into s values(9991102, 'jack')

sno   char(2),
sn char(8),
sex char(2),
age tinyint,
dept char(10)