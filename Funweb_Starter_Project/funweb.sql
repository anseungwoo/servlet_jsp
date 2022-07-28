show databases;
create database funweb;
use funweb;
show tables;
drop table board;

create table member(
id varchar(20) not null primary key,
passwd varchar(20) not null,
name varchar(20) not null,
email varchar(50) unique,
address varchar(100) not null,
phoneNumber varchar(20) not null,
mobilePhoneNumber varchar(20) not null,
date DATE not null
);

show tables;
DESC board;
delete from member where idx=1;
select * from member;
select * from board;

create table file_board(
idx int not null primary key,
passwd varchar(20) not null,
name varchar(20) not null,
subject varchar(50) not null,
content varchar(2000) not null,
real_file varchar(100) not null,
original_file varchar(100) not null,
readcount int not null,
date DATE not null
);

create table file_board(
idx int not null primary key,
passwd varchar(20) not null,
name varchar(20) not null,
subject varchar(50) not null,
content varchar(2000) not null,
real_file varchar(100) not null,
original_file varchar(100) not null,
readcount int not null,
date DATE not null
);
SELECT * FROM board where subject Like '%추가%' ORDER BY idx DESC LIMIT 0,10;

