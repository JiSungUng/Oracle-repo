--�׷��Լ�
select sum(sal) �հ� from emp;

--sal�� ���� ��ü�հ� ���(�Ҽ������� ���ڸ� �ݿø�)
select sum(sal) �հ�,round(Avg(sal),1) ��� from emp;

--�ְ�޿� �����޿�
select max(sal),min(sal) from emp;

--�Ի��� 81��
select * from emp where hiredate>='81/01/01' and hiredate<='81/12/31';
select * from emp where hiredate between '81/01/01' and '81/12/31';

select * from emp where to_char(hiredate,'YY') ='81';


--Group by: Ư���������� �������� �׷�ȭ�ϱ�
--professor ���� �а����� �������� ��ձ޿��� ����Ͻÿ�
select deptno"�а�" ,avg(pay)"��ձ޿�"
from professor
group by deptno;


--professor���� �а����� �������� �ѱ޿��� ����Ͻÿ�.
select deptno"�а�" ,sum(pay) "�ѱ޿�"
from professor
group by deptno;

--professor���� �а���, ���޺��� �������� ��ձ޿��� ����ϼ���.
select deptno "�а�" ,��������,avg(pay) "��ձ޿�"
from professor
group by deptno, ��������;

--student���� �г⺰ ���Ű�� �ְ�����Ը� ���Ͻÿ�.
select grade "�г�" , avg(height)"���Ű" , max(weight) "�ְ������"
from student
group by grade;

--professor ���� �������޺��� ��� pay�� �ְ� ���ʽ��� ���Ͻÿ�
select �������� , avg(pay),max(bonus) 
from professor
group by ��������;

--emp���� ������ ������ ���� ����� ���� ���Ͻÿ�
select job ���� ,count(empno) �����
from emp
group by job;

--job ���� ��ձ޿�
select job ����, round(avg(sal),1)��ձ޿�
from emp
group by job;
--job ���� �ְ�޿��� �����޿��� ���Ͻÿ�
select job ����, max(sal),min(sal)
from emp
group by job;

--[�Ұ� �Լ�] roolup

--group by ���� �־��� �������� �Ұ谪�� �����ش�.

--professor���� �а���, �������޺� �Ұ�
select deptno �а���ȣ , ��������,sum(pay) �ѱ޿�
from professor
group by ��������, rollup(deptno);

select deptno �а���ȣ, ��������, sum(pay) �ѱ޿�
from professor
group by deptno, rollup(��������);

select �������� , count(*), sum(pay)
from professor
group by rollup(��������);

select deptno �а���ȣ, ��������,sum(pay)�ѱ޿�
from professor
group by rollup(deptno,��������);

--cube : ��ü���ձ��� �������.
select deptno, ��������,count(*),sum(pay)
from professor
group by cube(deptno,��������);

select deptno
from emp
group by deptno;

--Having��
--where ���� �����Լ� ����� �� ����.
-- Having���� �����Լ��� ������ ���Ǻ��� �� ����Ѵ�.
-- Having ���� group by�� �Բ� ����� �ȴ�.


--Q.��ձ޿��� 450�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���Ѵ�.
select deptno, avg(pay)
from professor
group by deptno
having avg(pay)>=450;

--emp���� ��տ����� 2000�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���Ͻÿ�
select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>=2000;

--emp���� ������ �������� 2���̻��� ���� ����Ͻÿ�
select job ,count(*) �ο���
from emp
group by job
having count(*)>=2;

--emp���� ������ �������� 2���̻��̰� �ѱ޿��� 5000�̻���� ���
select job ����, count(*) cnt, sum(sal) �ѱ޿�
from emp
group by job
having count(*)>=2 and sum(sal)>5000;

--��� ���� ����Ͽ� �˻�
select job, sum(sal) �޿��հ�
from emp 
where job not in('SALESMAN') --���Ͻ��� ����
group by job
having sum(sal)>5000
order by sum(sal) desc;














