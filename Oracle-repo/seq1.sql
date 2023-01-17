--//seq1: 시작값 : 5 증가값 :2 끝값 :30, 캐시: no, cycle yes.
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;
--seq2 : 시작값:1 증가값:3 캐시:no
create sequence seq2 start with 1 increment by 3 nocache;
--seq3: 시작값:1 증가값:1 캐시 :no
create sequence seq3 nocache;

--출력
select seq1.nextval, seq2.nextval,seq3.nextval from dual;
--삭제
drop sequence seq1;
drop sequence seq2;
drop sequence seq3;