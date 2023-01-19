create sequence seq_food2 start with 1 increment by 3 maxvalue 50 NOCACHE cycle;
create table food2 (fno number(20)  primary key,
food varchar2(30),
price varchar2(30),
shop varchar2(30),
loc varchar(30));

insert into food2 values(seq_food2.nextval,'���',3000,'��䳪��','������ 13');
insert into food2 values(seq_food2.nextval,'������',4000,'����������','������ 14');
insert into food2 values(seq_food2.nextval,'Ŀ��',2000,'���ٹ�','������ 15');
insert into food2 values(seq_food2.nextval,'����',3500,'���볪��','������ 16');

select * from food2;


create table jumun3 (num number(20)  primary key,
fno number(20)  REFERENCES food(fno) on DELETE CASCADE,
name varchar2(30),addr varchar2(30));



insert into jumun3 values(seq_food2.nextval,1,'��ȿ��','���ﵿ 122-1');
insert into jumun3 values(seq_food2.nextval,4,'��ȣ��','���ﵿ 125-2');
insert into jumun3 values(seq_food2.nextval,7,'���缮','���ﵿ 126-4');
insert into jumun3 values(seq_food2.nextval,10,'������','���ﵿ127-6');


select f.fno �۹�ȣ , name �ֹ���, food ���ĸ�, price ����,shop ��ȣ��,loc ������ġ ,addr �ֹ�����ġ
from food2 f, jumun3 j
where f.fno = j.fno;

commit;