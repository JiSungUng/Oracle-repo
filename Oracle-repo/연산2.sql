--전체테이블 확인
select * from tab;

--test라는 테이블 생성
--primary key 는 기본키를 의미하는데 not null+nuique 를 합친 기능
create table test (num number(5) primary key,name varchar2(20),score number(6,2),birth date);

--구조확인
desc test;

--test에 데이터 insert 하기
insert into test values(1,'지성웅',67.1,'2023-01-01');

--test에 일부데이터 insert하기
insert into test(num,name) values(2,'김호동');

--전체데이터조회
select * from test;

--일부 컬럼만 조회
select num,name from test;

--데이터 더추가 (sysdate 는 현재날짜를 의미)
insert into test values(3,'이효리',88,sysdate);

--나이를 저장할 컬럼을 추가, 초기값은 null이 추가됨
alter table test add age number(5);

--주소를 저장할 컬럼을 만들고 초기값을 강남구라고 지정
alter table test add addr varchar2(30) default '강남구';

--주소의 문자타입이 30바이트인데 50바이트로 수정
alter table test modify addr varchar2(50);

--age의 타입을 varchar2(10)로 변경하고 초기값을 '10'으로 변경하기
--기존의 null은 그냥 남고 새롭게 insert 한 것부터 적용
alter table test modify age varchar2(10) default '10';

insert into test(num,name,addr) values (5,'김영미','서울여의도');

insert into test values(6,'김수연',89,sysdate,22,'서울 마포구');
insert into test values(7,'박수연',89,sysdate,22,'서울 마포구');
insert into test values(8,'윤수연',89,sysdate,22,'서울 마포구');

--전체출력
select *from test;

--정렬
select * from test order by num desc;

--age라는 컬럼을 삭제
alter table test drop column age;

--addr 삭제
alter table test drop column addr;

--score 컬럼명을 jumsoo로 변경해보자
alter table test rename column score to jumsoo;
--birth를 birthday로
alter table test rename column birth to birthday;

--test 테이블 삭제
drop table test;













