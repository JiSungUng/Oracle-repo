--emp�� dept�� �����ؼ� emp ������� ������ ����غ���
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno;

select ename, dname
from emp e, dept d
where e.deptno=d.deptno;

--professor +department
--������ȣ ������ �а���

select p.profno, p.name, d.dname
from professor p ,department d
where p.deptno = d.deptno;

--student +professor
--�й�   �л���   ����������ȣ   ����������
select s.studno, s.name ,s.profno, p.name
from student s, professor p
where s.profno = p.profno;

--�й� �л��� �� 1 �������� 
select s.studno,s.name , s.name
from student s ,department d
where s.deptno1= d.deptno;

--student�� department �������� ��1 ������ ������ �л��� �̸��� 1���� �̸��� ����ϼ���
select s.name �̸�,d.dname ��1����
from student s,department d
where s.deptno1=(select deptno1 from student where name='������') and s.deptno1=d.deptno;

--������ ��ǻ�Ͱ��а�

--professor���� �Ի����� �迵�� �������� ���߿� �Ի��� ����� �̸��� �Ի��� �а����� ����Ͻÿ�
select p.name ������ , p.hiredate �Ի��� , d.dname �а���
from professor p, department d
where p.deptno = d.deptno
and hiredate>(select hiredate from professor where name ='�迵��');









