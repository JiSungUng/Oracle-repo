--//seq1: ���۰� : 5 ������ :2 ���� :30, ĳ��: no, cycle yes.
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;
--seq2 : ���۰�:1 ������:3 ĳ��:no
create sequence seq2 start with 1 increment by 3 nocache;
--seq3: ���۰�:1 ������:1 ĳ�� :no
create sequence seq3 nocache;

--���
select seq1.nextval, seq2.nextval,seq3.nextval from dual;
--����
drop sequence seq1;
drop sequence seq2;
drop sequence seq3;