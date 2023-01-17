--����������
create sequence seq1 nocache;
--���̺����
create table person (num number(5) primary key,
name varchar2(20),
job varchar2(30),
gender varchar(10),
age number(5),
hp varchar2(20),
birth date);

select * from person;

--birth -> birthday ����
alter table person rename column birth to birthday;

desc person;

--��ȸ ����
insert into person values (seq1.nextval,'������','�����Ͼ�','����',25,'010-1111-2222','1998-04-05');
insert into person values (seq1.nextval,'�̿���','����','����',27,'010-1441-2422','1996-11-21');
insert into person values (seq1.nextval,'��ξ�','������','����',24,'010-3131-2332','1999-7-21');
insert into person values (seq1.nextval,'�̽ÿ�','��ġ������','����',25,'010-6661-2222','1998-03-05');
insert into person values (seq1.nextval,'�Źξ�','�л�','����',23,'010-5151-5252','2000-9-01');
insert into person values (seq1.nextval,'������','����','����',23,'010-1431-2152','1998-8-11');
insert into person values (seq1.nextval,'�ֺ���','���α׷���','����',25,'070-5711-7722','1998-7-24');
insert into person values (seq1.nextval,'�����','ȸ���','����',24,'010-3881-8822','1998-07-29');
insert into person values (seq1.nextval,'�輺ȣ','�ڿ���','����',26,'010-2199-9292','1998-02-07');

select count(*) from person;

--��������
commit;

--�̸��� ���
select * from person order by name;
--������ �������
select * from person order by age desc;

--���� ��������, �̸���������
select * from person order by gender asc ,name asc;

--����(�ߺ�����)
select distinct job from person;

--�̸��� �������� ������
select * from person where name='������';
--���� �达�� ��� ���
select * from person where name like '��%';
--�̸��� �ι�° ���ڰ� '��'�� ��� ���
select * from person where name like '_��%';

--�ڵ����� 010�� �츶
select * from person where hp like'010%';
--person ���̺��� ������ 10���� ��� ���
select * from person where birthday like'___10%';
select * from person where to_char(birthday,'mm')='10';
--98����� ����� ����Ͻÿ�
select * from person where to_char(birthday,'yy')='98';

--���� �̾��̰ų� �达�� ��� ���
select * from person where name like '��%' or name like '��%';
--�����̸鼭 ���̰� 25�� �̻��� ��� ���
select * from person where gender ='����' and age>=25;
--��ճ��̱��ϱ�
select avg(age) from person;

--��ճ��̺��� ���� ����� �̸��� ����, ���̸� ����Ͻÿ�(��������)
select name, job,age from person where age >=(select avg(age) from person);

--����,3���� ������ ���̸� �����ϱ�
update person set job='����' , age =29;

select * from person;

--�߸������Ѱ� ������� �ǵ�����
rollback;

update person set job ='����' , age = 29 where num =3;

--�达�̸鼭 ������ ����� ������ ���ڷ� �����ϱ�
update person set gender ='����' where job='����'and name like '��%';










