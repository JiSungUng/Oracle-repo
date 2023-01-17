--시퀀스생성
create sequence seq1 nocache;
--테이블생성
create table person (num number(5) primary key,
name varchar2(20),
job varchar2(30),
gender varchar(10),
age number(5),
hp varchar2(20),
birth date);

select * from person;

--birth -> birthday 변경
alter table person rename column birth to birthday;

desc person;

--조회 연습
insert into person values (seq1.nextval,'지성웅','엔지니어','남자',25,'010-1111-2222','1998-04-05');
insert into person values (seq1.nextval,'이우형','교사','남자',27,'010-1441-2422','1996-11-21');
insert into person values (seq1.nextval,'김민아','공무원','여자',24,'010-3131-2332','1999-7-21');
insert into person values (seq1.nextval,'이시영','유치원교사','남자',25,'010-6661-2222','1998-03-05');
insert into person values (seq1.nextval,'신민아','학생','여자',23,'010-5151-5252','2000-9-01');
insert into person values (seq1.nextval,'이지민','교사','여자',23,'010-1431-2152','1998-8-11');
insert into person values (seq1.nextval,'최보현','프로그래머','여자',25,'070-5711-7722','1998-7-24');
insert into person values (seq1.nextval,'박재승','회사원','남자',24,'010-3881-8822','1998-07-29');
insert into person values (seq1.nextval,'김성호','자영업','남자',26,'010-2199-9292','1998-02-07');

select count(*) from person;

--최종저장
commit;

--이름순 출력
select * from person order by name;
--나이의 역순출력
select * from person order by age desc;

--성별 오름차순, 이름오름차순
select * from person order by gender asc ,name asc;

--직업(중복제거)
select distinct job from person;

--이름이 지성웅인 사람출력
select * from person where name='지성웅';
--성이 김씨인 사람 출력
select * from person where name like '김%';
--이름중 두번째 글자가 '민'인 사람 출력
select * from person where name like '_민%';

--핸드폰이 010인 살마
select * from person where hp like'010%';
--person 테이블에서 생일이 10월인 사람 출력
select * from person where birthday like'___10%';
select * from person where to_char(birthday,'mm')='10';
--98년생인 사람만 출력하시오
select * from person where to_char(birthday,'yy')='98';

--성이 이씨이거나 김씨인 사람 출력
select * from person where name like '이%' or name like '김%';
--여자이면서 나이가 25살 이상인 사람 출력
select * from person where gender ='여자' and age>=25;
--평균나이구하기
select avg(age) from person;

--평균나이보다 많은 사람의 이름과 직업, 나이를 출력하시오(서브쿼리)
select name, job,age from person where age >=(select avg(age) from person);

--수정,3번의 직업과 나이를 수정하기
update person set job='교수' , age =29;

select * from person;

--잘못수정한거 원래대로 되돌리기
rollback;

update person set job ='교수' , age = 29 where num =3;

--김씨이면서 교사인 사람의 성별을 남자로 수정하기
update person set gender ='남자' where job='교사'and name like '김%';










