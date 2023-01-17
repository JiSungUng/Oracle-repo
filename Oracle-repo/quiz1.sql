--복습문제
--1. professor에서 정교수를 full professor로 변경하시오
update professor set position='full professor' where position ='정교수';
--2. professor에서 position을 교수직급으로 변경하세요
alter table professor rename column position to 교수직급;
--3. emp에서 TotSal열을 추가하시오
alter table emp add totsal varchar2(20);
--4.totsal에 sal과 comm을 더하여 데이터를 추가하세요
update emp set TotSal=sal+NVL(comm,0);
select * from emp;

update emp set totsal =sal+comm;
-- 5. professor에서 position열을 문자열(30)로 변경하시오
 alter table professor modify name varchar2(30);

--6. department에서 102는 소프트웨어 공학과 103은 의료IT공학과로 추가하시오.
insert into department (deptno,dname)values(102,'소프트웨어공학과'); 
insert into department (deptno,dname)values(103,'의료IT공학과'); 
--7.emp에서 입사일이 81/02/20인 사람의 이름,부서번호, 월급을 출력하시오.
select ename,deptno,sal from emp where to_char(hiredate,'yy/mm/dd')='81/02/20';
--8. dept2에서 울산지사를 제주지사로 변경하시오
update dept2 set area ='제주지사' where area='울산지사';
--9.emp에서 입사일이 5월인 사람만 출력하시오
select * from emp where to_char(hiredate,'mm')=05;
--10. emp에서 FORD의 연봉과 같은 연봉을 받는 사람의 이름과 연봉을 출력하시오.
select ename, sal from emp where sal=(select sal from emp where ename='FORD');
