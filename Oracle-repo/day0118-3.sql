create table sawon ( num number(5) CONSTRAINT sawon_pk_num primary key,
name varchar2(20),
gender varchar(10),
buseo varchar2(20) CONSTRAINT sawon_ck_buseo check(buseo in('������','ȫ����','���ߺ�')),
pay number(10) default 1000000);

--������
create sequence seq_sawon;

--�߰� 10
insert into sawon values(seq_sawon.nextval,'�̽±�','����','ȫ����',3450000);
insert into sawon values(seq_sawon.nextval,'�̿���','����','������',2680000);
insert into sawon values(seq_sawon.nextval,'��±�','����','���ߺ�',3200000);
insert into sawon values(seq_sawon.nextval,'�����','����','���ߺ�',2980000);
insert into sawon values(seq_sawon.nextval,'�̽±�','����','������',3950000);
insert into sawon values(seq_sawon.nextval,'���϶�','����','ȫ����',3450000);
insert into sawon values(seq_sawon.nextval,'�±�','����','ȫ����',3250000);
insert into sawon values(seq_sawon.nextval,'������','����','������',3450000);
insert into sawon values(seq_sawon.nextval,'ȫ����','����','���ߺ�',2870000);



--�μ��� �ο����� �ְ�޿� �����޿� ��ȸ (���� ǥ���ϰ� �ο����ڿ� ���̶�� ǥ��)
select buseo �μ���, count(buseo)||'��' �ο���, max(pay) �ְ�޿�,min(pay) �����޿�
from sawon
group by buseo;
--ȭ�����
select buseo �μ��� ,count(buseo)||'��'�ο���,to_char(max(pay),'L999,999,999') �ְ�޿�
from sawon
group by buseo;

--���� �ο����� ��ձ޿�, �ְ�޿�, �����޿� ���Ͻÿ�
select gender ���� ,count(gender) �ο���, avg(pay) ��ձ޿�, max(pay) �ְ�޿�, min(pay) �����޿�
from sawon
group by gender;

--�μ��� �ο��� 4�� �̻��� ��쿡�� ��� �ο��� ��ձ޿��� ���Ѵ�.
select buseo, count(buseo), avg(pay)
from sawon
group by buseo
having count(buseo)>=2;

-- �������� �����ϱ�
--sawon�� sawon_ck_buseo�� ������ ����.
alter table sawon drop CONSTRAINT sawon_ck_buseo;

insert into sawon values(seq_sawon.nextval,'�̿���','����','�ؿܰ��ߺ�',5550000);
commit;

--sawon�� name �÷��� unique �������� �߰��غ��� (sawon_uk_name)
alter table sawon add CONSTRAINT sawon_uk_name UNIQUE(name); --UNIQUE (�÷���)

