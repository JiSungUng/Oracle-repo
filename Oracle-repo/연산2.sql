--��ü���̺� Ȯ��
select * from tab;

--test��� ���̺� ����
--primary key �� �⺻Ű�� �ǹ��ϴµ� not null+nuique �� ��ģ ���
create table test (num number(5) primary key,name varchar2(20),score number(6,2),birth date);

--����Ȯ��
desc test;

--test�� ������ insert �ϱ�
insert into test values(1,'������',67.1,'2023-01-01');

--test�� �Ϻε����� insert�ϱ�
insert into test(num,name) values(2,'��ȣ��');

--��ü��������ȸ
select * from test;

--�Ϻ� �÷��� ��ȸ
select num,name from test;

--������ ���߰� (sysdate �� ���糯¥�� �ǹ�)
insert into test values(3,'��ȿ��',88,sysdate);

--���̸� ������ �÷��� �߰�, �ʱⰪ�� null�� �߰���
alter table test add age number(5);

--�ּҸ� ������ �÷��� ����� �ʱⰪ�� ��������� ����
alter table test add addr varchar2(30) default '������';

--�ּ��� ����Ÿ���� 30����Ʈ�ε� 50����Ʈ�� ����
alter table test modify addr varchar2(50);

--age�� Ÿ���� varchar2(10)�� �����ϰ� �ʱⰪ�� '10'���� �����ϱ�
--������ null�� �׳� ���� ���Ӱ� insert �� �ͺ��� ����
alter table test modify age varchar2(10) default '10';

insert into test(num,name,addr) values (5,'�迵��','���￩�ǵ�');

insert into test values(6,'�����',89,sysdate,22,'���� ������');
insert into test values(7,'�ڼ���',89,sysdate,22,'���� ������');
insert into test values(8,'������',89,sysdate,22,'���� ������');

--��ü���
select *from test;

--����
select * from test order by num desc;

--age��� �÷��� ����
alter table test drop column age;

--addr ����
alter table test drop column addr;

--score �÷����� jumsoo�� �����غ���
alter table test rename column score to jumsoo;
--birth�� birthday��
alter table test rename column birth to birthday;

--test ���̺� ����
drop table test;













