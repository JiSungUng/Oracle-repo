select name,position from professor where name like '김%';
select * from emp where  sal>=1500;--comm??
select sal 급여,comm 커미션, sal+comm 총합 from emp;
select empno,ename,hiredate from emp order by hiredate ;
select empno 사원번호, ename 사원명 from emp WHERE job='CLERK' OR job='PRESIDENT' OR job='ANALYST'; 
select empno,ename,sal from emp order by sal desc;
select name, height , weight from student where grade =1 order by height desc,weight asc;
select empno,ename, job, deptno from emp where job ='CLERK' and deptno =10;
select empno,ename, hiredate from emp where hiredate >='82/01/01' or job='MANAGER';


select * from emp where ename like '_A%';--이름의 두번째 글자가 A인 사람
select * from emp where ename like '__R%'; --이름의 세번째 글자가 R인사람


--Union &union all
select name from student where deptno1=101 union all select name from student where deptno2 =201;