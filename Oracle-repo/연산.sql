
select * from emp where ename like '_A%';--이름의 두번째 글자가 A인 사람
select * from emp where ename like '__R%'; --이름의 세번째 글자가 R인사람


--Union &union all
select name from student where deptno1=101 union all
select name from student where deptno2 =201;

select name from student where deptno1=103 union
select name from student where deptno2=203;

--두집합의 교집합
--101번 학과와 201번 학과를 복수전공하는 사람의 이름을 출력하시오.
select name from student where deptno1=101 intersect
select name from student where deptno2=201;

--emp에서 사원명 , 급여, comm,급여 *12를 연봉이라는 이름으로 출력하세요
select sal*12+NVL(comm,0) as 연봉 from emp;

--count
select count(*) , count (hpage)from professor;

--sum
select count(bonus),sum(bonus) from professor;

--avg
select count(bonus),sum(bonus),avg(bonus) from professor;

--max ,min
select max(sal),min(sal) from emp;
select max(hiredate) 최근,min(hiredate) 제일먼저 from emp;

--그룹함수
select count(*) from emp;

--sal의 평균
select round(avg(sal),2) from emp; --소수점 2자리
select round(avg(sal(,1) from emp;--소수점 1자리
select round(avg(sal),0)from emp; --소수점없이 반올림
select round(avg(sal),-1) from emp; --10단위
select round(avg(sal),-2) from emp; --100단위

--콘솔에 출력할때 dual
select sysdate from dual; -- 현재날짜
select sysdate+1 from dual; -- 내일 날짜
select to_char (sysdate,'YYYY-MM-DD') from dual;
select to_char(sysdate,'yyyy-mm-dd') from dual;
select to_char(sysdate,'yyyy-mm-dd hh24:mi') from dual;
select to_char (sysdate,'yyyy') from dual; -- yyyy 대신 year을 쓰면 영어로 나온다.


--서브쿼리
--쿼리안에 쿼리가 담김
--select 컬럼1, 컬럼2(from 테이블명
--where 조건연산자 (select 컬럼명 from 테이블명 where 조건 )메인쿼리


-- emp테이블에서 SCOTT보다 급여를 많이 받는 사람의 이름과 급여를 출력하세요
select ename, sal from emp where sal>
(select sal from emp where ename ='SCOTT');

--서브쿼리가 먼저 수행돼서 결과값을 메인쿼리에 전해주고 그값을 받아서 메인쿼리 수행.

--emp에서 평균급여보다 더 많이 받는 사람의 목록
select *from emp where sal >(select avg(sal) from emp);

--emp에서 WARD인 사람의 MGR과 같은 값을 가진 사람의 목록
select * from emp where MGR=(select MGR from emp where ename ='WARD');

--professor 에서 조교수의 평균급여보다 급여가 낮은 사람의 교수번호,이름,급여를 나타내시오)
select profno,name pay from professor where pay<(select avg(pay)from professor where position ='조교수');

--student에서  4학년의 평균키보다 큰 사람의 이름, 아이디,키를 구하시오
select name , ID,height from student where height >(select avg(height) from student where grade=4);

--emp에서 s로 시작하는 사람과 같은부서사람의 부서번호와 이름을 출력하시오.
select deptno,ename from emp where deptno IN(select deptno from emp where ename LIKE ('S%'));




