create table sawon ( num number(5) CONSTRAINT sawon_pk_num primary key,
name varchar2(20),
gender varchar(10),
buseo varchar2(20) CONSTRAINT sawon_ck_buseo check(buseo in('교육부','홍보부','개발부')),
pay number(10) default 1000000);

--시퀀스
create sequence seq_sawon;

--추가 10
insert into sawon values(seq_sawon.nextval,'이승기','남자','홍보부',3450000);
insert into sawon values(seq_sawon.nextval,'이영자','여자','교육부',2680000);
insert into sawon values(seq_sawon.nextval,'김승기','남자','개발부',3200000);
insert into sawon values(seq_sawon.nextval,'김승현','남자','개발부',2980000);
insert into sawon values(seq_sawon.nextval,'이승기','남자','교육부',3950000);
insert into sawon values(seq_sawon.nextval,'주하랑','여자','홍보부',3450000);
insert into sawon values(seq_sawon.nextval,'승기','남자','홍보부',3250000);
insert into sawon values(seq_sawon.nextval,'이지민','여자','교육부',3450000);
insert into sawon values(seq_sawon.nextval,'홍라희','남자','개발부',2870000);



--부서별 인원수와 최고급여 최저급여 조회 (제목도 표기하고 인원수뒤에 명이라고 표기)
select buseo 부서명, count(buseo)||'명' 인원수, max(pay) 최고급여,min(pay) 최저급여
from sawon
group by buseo;
--화폐단위
select buseo 부서명 ,count(buseo)||'명'인원수,to_char(max(pay),'L999,999,999') 최고급여
from sawon
group by buseo;

--성별 인원수와 평균급여, 최고급여, 최저급여 구하시오
select gender 성별 ,count(gender) 인원수, avg(pay) 평균급여, max(pay) 최고급여, min(pay) 최저급여
from sawon
group by gender;

--부서별 인원이 4명 이상인 경우에만 출력 인원과 평균급여를 구한다.
select buseo, count(buseo), avg(pay)
from sawon
group by buseo
having count(buseo)>=2;

-- 제약조건 제거하기
--sawon의 sawon_ck_buseo를 제거해 본다.
alter table sawon drop CONSTRAINT sawon_ck_buseo;

insert into sawon values(seq_sawon.nextval,'이영희','여자','해외개발부',5550000);
commit;

--sawon에 name 컬럼에 unique 제약조건 추가해보기 (sawon_uk_name)
alter table sawon add CONSTRAINT sawon_uk_name UNIQUE(name); --UNIQUE (컬럼명)

