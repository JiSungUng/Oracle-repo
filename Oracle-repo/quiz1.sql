--��������
--1. professor���� �������� full professor�� �����Ͻÿ�
update professor set position='full professor' where position ='������';
--2. professor���� position�� ������������ �����ϼ���
alter table professor rename column position to ��������;
--3. emp���� TotSal���� �߰��Ͻÿ�
alter table emp add totsal varchar2(20);
--4.totsal�� sal�� comm�� ���Ͽ� �����͸� �߰��ϼ���
update emp set TotSal=sal+NVL(comm,0);
select * from emp;

update emp set totsal =sal+comm;
-- 5. professor���� position���� ���ڿ�(30)�� �����Ͻÿ�
 alter table professor modify name varchar2(30);

--6. department���� 102�� ����Ʈ���� ���а� 103�� �Ƿ�IT���а��� �߰��Ͻÿ�.
insert into department (deptno,dname)values(102,'����Ʈ������а�'); 
insert into department (deptno,dname)values(103,'�Ƿ�IT���а�'); 
--7.emp���� �Ի����� 81/02/20�� ����� �̸�,�μ���ȣ, ������ ����Ͻÿ�.
select ename,deptno,sal from emp where to_char(hiredate,'yy/mm/dd')='81/02/20';
--8. dept2���� ������縦 ��������� �����Ͻÿ�
update dept2 set area ='��������' where area='�������';
--9.emp���� �Ի����� 5���� ����� ����Ͻÿ�
select * from emp where to_char(hiredate,'mm')=05;
--10. emp���� FORD�� ������ ���� ������ �޴� ����� �̸��� ������ ����Ͻÿ�.
select ename, sal from emp where sal=(select sal from emp where ename='FORD');
