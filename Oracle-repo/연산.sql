
select * from emp where ename like '_A%';--�̸��� �ι�° ���ڰ� A�� ���
select * from emp where ename like '__R%'; --�̸��� ����° ���ڰ� R�λ��


--Union &union all
select name from student where deptno1=101 union all
select name from student where deptno2 =201;

select name from student where deptno1=103 union
select name from student where deptno2=203;

--�������� ������
--101�� �а��� 201�� �а��� ���������ϴ� ����� �̸��� ����Ͻÿ�.
select name from student where deptno1=101 intersect
select name from student where deptno2=201;

--emp���� ����� , �޿�, comm,�޿� *12�� �����̶�� �̸����� ����ϼ���
select sal*12+NVL(comm,0) as ���� from emp;

--count
select count(*) , count (hpage)from professor;

--sum
select count(bonus),sum(bonus) from professor;

--avg
select count(bonus),sum(bonus),avg(bonus) from professor;

--max ,min
select max(sal),min(sal) from emp;
select max(hiredate) �ֱ�,min(hiredate) ���ϸ��� from emp;

--�׷��Լ�
select count(*) from emp;

--sal�� ���
select round(avg(sal),2) from emp; --�Ҽ��� 2�ڸ�
select round(avg(sal(,1) from emp;--�Ҽ��� 1�ڸ�
select round(avg(sal),0)from emp; --�Ҽ������� �ݿø�
select round(avg(sal),-1) from emp; --10����
select round(avg(sal),-2) from emp; --100����

--�ֿܼ� ����Ҷ� dual
select sysdate from dual; -- ���糯¥
select sysdate+1 from dual; -- ���� ��¥
select to_char (sysdate,'YYYY-MM-DD') from dual;
select to_char(sysdate,'yyyy-mm-dd') from dual;
select to_char(sysdate,'yyyy-mm-dd hh24:mi') from dual;
select to_char (sysdate,'yyyy') from dual; -- yyyy ��� year�� ���� ����� ���´�.


--��������
--�����ȿ� ������ ���
--select �÷�1, �÷�2(from ���̺��
--where ���ǿ����� (select �÷��� from ���̺�� where ���� )��������


-- emp���̺��� SCOTT���� �޿��� ���� �޴� ����� �̸��� �޿��� ����ϼ���
select ename, sal from emp where sal>
(select sal from emp where ename ='SCOTT');

--���������� ���� ����ż� ������� ���������� �����ְ� �װ��� �޾Ƽ� �������� ����.

--emp���� ��ձ޿����� �� ���� �޴� ����� ���
select *from emp where sal >(select avg(sal) from emp);

--emp���� WARD�� ����� MGR�� ���� ���� ���� ����� ���
select * from emp where MGR=(select MGR from emp where ename ='WARD');

--professor ���� �������� ��ձ޿����� �޿��� ���� ����� ������ȣ,�̸�,�޿��� ��Ÿ���ÿ�)
select profno,name pay from professor where pay<(select avg(pay)from professor where position ='������');

--student����  4�г��� ���Ű���� ū ����� �̸�, ���̵�,Ű�� ���Ͻÿ�
select name , ID,height from student where height >(select avg(height) from student where grade=4);

--emp���� s�� �����ϴ� ����� �����μ������ �μ���ȣ�� �̸��� ����Ͻÿ�.
select deptno,ename from emp where deptno IN(select deptno from emp where ename LIKE ('S%'));




