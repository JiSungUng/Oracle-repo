--on delete cascade
--외부키로 연결이 되어있더라도 부모테이블의 데이터를 삭제하면 자식테이블의 데이터도 
--자동으로 삭제시켜주는 기능

--시퀀스생성
create sequence seq_shop;

--shop 테이블
create table shop(num number(5) primary key,
sangpum varchar2(30),color varchar2(20));

--5개의 상품추가
insert into shop values(seq_shop.nextval,'텀블러','pink');
insert into shop values(seq_shop.nextval,'커피잔','white');
insert into shop values(seq_shop.nextval,'티스푼','silver');
insert into shop values(seq_shop.nextval,'커피별점','gold');
insert into shop values(seq_shop.nextval,'에스프레소잔','black');

commit;

select *from shop;

--cart1테이블... 상품정보는 shop 테이블의 num값을 외부키로 지정해준다
create table cart1(idx number(5) primary key,
num number(5) CONSTRAINT cart_fk_num REFERENCES shop(num),
cnt number(5),guipday date);

--cart2... 상품정보는 shop테이블의 num값을 외부키로 지정해준다.
--부모테이블의 상품을 지우면 그 상품과 연결된 카트를 자동으로 지워준다.
create table car2(idx number(5) primary key,
num number(5) CONSTRAINT cart_fk2_num REFERENCES shop(num) on DELETE CASCADE,
cnt number(5) , guipday date);


--crt1에 상품추가
insert into cart1 values(seq_shop.nextval,1,2,sysdate); --1번 텀블러추가

insert into cart1 values(seq_shop.nextval, 5,1,sysdate);

--shop에 없는 상품 담기
--insert into cart1 valus(seq_shop.nextval,5,1,sysdate); -- 무결성 제약조건

insert into car2 values(seq_shop.nextval,3,4,sysdate);
insert into car2 values(seq_shop.nextval,2,5,sysdate);

commit;

--cart1에 1,5번 담겨있다
--shop에 있는 1번삭제해보기
delete from shop where num =1;

--4번을 아무도 카트에 안담음 ..삭제해도 오류안납니다.
delete from shop where num =4;

--확인 후 아까우니까살리자
ROLLBACK;

select * from shop;
select *from cart1;
select *from car2;

--car2에 담긴 3번 shop에서 삭제가 될까 ?
--yes! cascade 설정으로 부모테이블의 데이터를 지우면 자식테이블의 데이터도 같이 지워진다.
delete from shop where num =3;


--join을 위해서 car2에서 데이터 3개만 더 채우기
insert into cart1 values(seq_shop.nextval, 1,2,sysdate);
insert into cart1 values(seq_shop.nextval, 2,2,sysdate);
insert into cart1 values(seq_shop.nextval, 4,6,sysdate);
insert into cart1 values(seq_shop.nextval, 5,1,sysdate);

--cart1에 담긴상품을 shop테이블과 join해서 자세히 출력해보자
--방법1
select cart1.idx,shop.num,shop.sangpum,shop.color,cart1.cnt,cart1.guipday
from shop, cart1
where shop.num =cart1.num;

--방법2
select c.idx,s.num,s.sangpum,s.color,c.cnt,c.guipday
from shop s, cart1 c
where s.num =c.num;