--�������� ����(unique)�� ���� �������ִ� ����Ŭ ��ü-
--������ ���� ,1���� 1�� ����
create sequence seq1;

--��ü������ Ȯ��
select * from seq;

--���� ������ ���� �߻��ؼ� �ֿܼ� ���
select seq1.nextval from dual;

--���� ������ �߻��� �������� 
select seq1.currval from dual;

drop sequence seq1;

--10���� 5�� �����ϴ� ������ ����-chache���� ���ֱ�
create sequence seq_1 start with 10 increment by 5 nocache;

--������ �߻�
select seq_1.nextval from dual;

--�������� ����.. start with�� �����Ұ�, maxvalue���� ������ �� �� ���� ������ �ٽ� ó������ ��������
alter sequence seq_1 increment by 10 maxvalue 100 cycle;

drop sequence seq_1;