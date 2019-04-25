use jxsk

go

create table C(cno char(10))

insert into T(tno) values(5)

alter table C add ccc int default 4

create unique index TND_CN on C(cno)

go 

select * from C with(index(TND_CN))

select * from C

drop index C.TND_CN


/* 1 */
select * from T

create clustered index IX_TNO on T(tno)

drop index T.IX_TNO

/* 2 */
create unique index IX_CNO on SC(cno)
create index TND_SCORE on SC(score DESC)

drop index SC.IX_CNO
insert into SC(score) values(1)

select * from SC with(index(TND_SCORE))
select * from SC with(index(IX_CNO))
/* 3 */

create table S(sno int primary key)
insert into S values(10)
create unique index IX_SNO on S(sno)

select * from S with(index(IX_SNO))