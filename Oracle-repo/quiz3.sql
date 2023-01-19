create sequence seq_food2 start with 1 increment by 3 maxvalue 50 NOCACHE cycle;
create table food2 (fno number(20)  primary key,
food varchar2(30),
price varchar2(30),
shop varchar2(30),
loc varchar(30));

insert into food2 values(seq_food2.nextval,'김밥',3000,'김밥나라','논현로 13');
insert into food2 values(seq_food2.nextval,'떡볶이',4000,'신전떡볶이','논현로 14');
insert into food2 values(seq_food2.nextval,'커피',2000,'빽다방','논현로 15');
insert into food2 values(seq_food2.nextval,'순대',3500,'순대나라','논현로 16');

select * from food2;


create table jumun3 (num number(20)  primary key,
fno number(20)  REFERENCES food(fno) on DELETE CASCADE,
name varchar2(30),addr varchar2(30));



insert into jumun3 values(seq_food2.nextval,1,'이효리','역삼동 122-1');
insert into jumun3 values(seq_food2.nextval,4,'강호동','역삼동 125-2');
insert into jumun3 values(seq_food2.nextval,7,'유재석','역삼동 126-4');
insert into jumun3 values(seq_food2.nextval,10,'지성웅','역삼동127-6');


select f.fno 글번호 , name 주문자, food 음식명, price 가격,shop 상호명,loc 가게위치 ,addr 주문자위치
from food2 f, jumun3 j
where f.fno = j.fno;

commit;