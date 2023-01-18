--on delete cascade
--�ܺ�Ű�� ������ �Ǿ��ִ��� �θ����̺��� �����͸� �����ϸ� �ڽ����̺��� �����͵� 
--�ڵ����� ���������ִ� ���

--����������
create sequence seq_shop;

--shop ���̺�
create table shop(num number(5) primary key,
sangpum varchar2(30),color varchar2(20));

--5���� ��ǰ�߰�
insert into shop values(seq_shop.nextval,'�Һ�','pink');
insert into shop values(seq_shop.nextval,'Ŀ����','white');
insert into shop values(seq_shop.nextval,'Ƽ��Ǭ','silver');
insert into shop values(seq_shop.nextval,'Ŀ�Ǻ���','gold');
insert into shop values(seq_shop.nextval,'������������','black');

commit;

select *from shop;

--cart1���̺�... ��ǰ������ shop ���̺��� num���� �ܺ�Ű�� �������ش�
create table cart1(idx number(5) primary key,
num number(5) CONSTRAINT cart_fk_num REFERENCES shop(num),
cnt number(5),guipday date);

--cart2... ��ǰ������ shop���̺��� num���� �ܺ�Ű�� �������ش�.
--�θ����̺��� ��ǰ�� ����� �� ��ǰ�� ����� īƮ�� �ڵ����� �����ش�.
create table car2(idx number(5) primary key,
num number(5) CONSTRAINT cart_fk2_num REFERENCES shop(num) on DELETE CASCADE,
cnt number(5) , guipday date);


--crt1�� ��ǰ�߰�
insert into cart1 values(seq_shop.nextval,1,2,sysdate); --1�� �Һ��߰�

insert into cart1 values(seq_shop.nextval, 5,1,sysdate);

--shop�� ���� ��ǰ ���
--insert into cart1 valus(seq_shop.nextval,5,1,sysdate); -- ���Ἲ ��������

insert into car2 values(seq_shop.nextval,3,4,sysdate);
insert into car2 values(seq_shop.nextval,2,5,sysdate);

commit;

--cart1�� 1,5�� ����ִ�
--shop�� �ִ� 1�������غ���
delete from shop where num =1;

--4���� �ƹ��� īƮ�� �ȴ��� ..�����ص� �����ȳ��ϴ�.
delete from shop where num =4;

--Ȯ�� �� �Ʊ��ϱ�츮��
ROLLBACK;

select * from shop;
select *from cart1;
select *from car2;

--car2�� ��� 3�� shop���� ������ �ɱ� ?
--yes! cascade �������� �θ����̺��� �����͸� ����� �ڽ����̺��� �����͵� ���� ��������.
delete from shop where num =3;


--join�� ���ؼ� car2���� ������ 3���� �� ä���
insert into cart1 values(seq_shop.nextval, 1,2,sysdate);
insert into cart1 values(seq_shop.nextval, 2,2,sysdate);
insert into cart1 values(seq_shop.nextval, 4,6,sysdate);
insert into cart1 values(seq_shop.nextval, 5,1,sysdate);

--cart1�� ����ǰ�� shop���̺�� join�ؼ� �ڼ��� ����غ���
--���1
select cart1.idx,shop.num,shop.sangpum,shop.color,cart1.cnt,cart1.guipday
from shop, cart1
where shop.num =cart1.num;

--���2
select c.idx,s.num,s.sangpum,s.color,c.cnt,c.guipday
from shop s, cart1 c
where s.num =c.num;