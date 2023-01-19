-- borad
create table board (bno number(3) CONSTRAINT board_pk_bno primary key,
writer varchar2(30),
subject varchar2(30),
writeday date);

--�ϴ� board�� insert �ϱ�
insert into board values(seq1.nextval,'ȣ����','������ ���������?',sysdate);
insert into board values(seq1.nextval,'�缮��','���� ���� ������?',sysdate);
insert into board values(seq1.nextval,'����','������',sysdate);
insert into board values(seq1.nextval,'������','�԰� Ŀ�ǵ� ����',sysdate);
insert into board values(seq1.nextval,'����','�ʹ� ��������',sysdate);

commit;
select *from board;

--answer : �ڽ����̺�
--�������̺��� ���� ����� �ױۿ� �޸� ����� �ڵ����� �����ǵ��� ����.
create table answer (num number(5) CONSTRAINT answer_pk_num primary key,
bno number(3) CONSTRAINT answeer_fk_bno REFERENCES board(bno) on DELETE CASCADE,
nickname varchar2(30),content varchar2(50));

--���ϴ� �۹�ȣ�� ��� �߰�
insert into answer values(seq1.nextval,15,'����','����� ó���̳�?');
insert into answer values(seq1.nextval,16,'ȣ��','1�� 2��!');
insert into answer values(seq1.nextval,17,'��','����� ó���̳�?');
insert into answer values(seq1.nextval,18,'ȿ��','�����');
commit;

--join���� ����غ���
select b.bno �۹�ȣ , writer �ۼ���, subject �ۼ��ڱ�, nickname ��۴ܻ��,content ��۳���,writeday �����ۼ���¥
from board b, answer a
where b.bno = a.bno;

--���� 17�� ���� �� ��� 11���� �޸� �� ��������� Ȯ��
delete from board where bno = 17;

select *from answer;

--board���̺� �����ɱ�?
drop table board;--�����ȵ� --�ܷ� Ű�� ���� �����Ǵ� ����/�⺻Ű�� ���̺� ����

--�ڽ����̺� ���� ����
drop table answer;
drop table board; -- �ܺ�Ű�� ����� ��� �ڽ����̺� ���� ���� �� �θ����̺� �����ϱ�

--���� ���� shop, cart1 ,car2�����غ���
drop table car2;
drop table cart1;
drop table shop;
