create sequence seq_men start with 1 increment by 2 nocache;

create table member (sno number(10) primary key,
name varchar2(20),
depart varchar2(20),
position varchar2(20),
gender varchar(20),
pay number(10),
bounus number(10)
);

select *from member;