select name,position from professor where name like '��%';
select * from emp where  sal>=1500;--comm??
select sal �޿�,comm Ŀ�̼�, sal+comm ���� from emp;
select empno,ename,hiredate from emp order by hiredate ;
select empno �����ȣ, ename ����� from emp WHERE job='CLERK' OR job='PRESIDENT' OR job='ANALYST'; 
select empno,ename,sal from emp order by sal desc;
select name, height , weight from student where grade =1 order by height desc,weight asc;
select empno,ename, job, deptno from emp where job ='CLERK' and deptno =10;
select empno,ename, hiredate from emp where hiredate >='82/01/01' or job='MANAGER';


select * from emp where ename like '_A%';--�̸��� �ι�° ���ڰ� A�� ���
select * from emp where ename like '__R%'; --�̸��� ����° ���ڰ� R�λ��


--Union &union all
select name from student where deptno1=101 union all select name from student where deptno2 =201;