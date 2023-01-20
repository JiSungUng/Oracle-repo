create sequence seq_info;

--Å×ÀÌ÷ם
create table info(
    num number(5) primary key,
    name varchar2(30),
    addr varchar2(50),
    writeday date
);
select * from info;