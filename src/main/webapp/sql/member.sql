USE sampledb;

create table member ( 
    id varchar(10) not null,
    password varchar(10) not null,
    name varchar(10) not null,
    email  varchar(30),  
    primary key(id) 
) default CHARSET=utf8;

select * from member;
drop table member;
