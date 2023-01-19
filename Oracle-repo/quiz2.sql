-- borad
create table board (bno number(3) CONSTRAINT board_pk_bno primary key,
writer varchar2(30),
subject varchar2(30),
writeday date);

--일단 board에 insert 하기
insert into board values(seq1.nextval,'호동이','오늘은 목요일이지?',sysdate);
insert into board values(seq1.nextval,'재석이','오늘 점심 뭐먹지?',sysdate);
insert into board values(seq1.nextval,'하하','김밥먹자',sysdate);
insert into board values(seq1.nextval,'형돈이','먹고 커피도 먹자',sysdate);
insert into board values(seq1.nextval,'우형','너무 좋다좋아',sysdate);

commit;
select *from board;

--answer : 자식테이블
--보모테이블의 글을 지우면 그글에 달린 댓글은 자동으로 삭제되도록 설정.
create table answer (num number(5) CONSTRAINT answer_pk_num primary key,
bno number(3) CONSTRAINT answeer_fk_bno REFERENCES board(bno) on DELETE CASCADE,
nickname varchar2(30),content varchar2(50));

--원하는 글번호에 댓글 추가
insert into answer values(seq1.nextval,15,'영자','내댓글 처음이네?');
insert into answer values(seq1.nextval,16,'호동','1박 2일!');
insert into answer values(seq1.nextval,17,'민','내댓글 처음이네?');
insert into answer values(seq1.nextval,18,'효리','배고파');
commit;

--join으로 출력해보기
select b.bno 글번호 , writer 작성자, subject 작성자글, nickname 댓글단사람,content 댓글내용,writeday 원글작성날짜
from board b, answer a
where b.bno = a.bno;

--원글 17번 삭제 후 댓글 11번에 달린 글 사라지는지 확인
delete from board where bno = 17;

select *from answer;

--board테이블 삭제될까?
drop table board;--삭제안됨 --외래 키에 의해 참조되는 고유/기본키가 테이블에 있음

--자식테이블 먼저 삭제
drop table answer;
drop table board; -- 외부키로 연결된 경우 자식테이블 먼저 삭제 후 부모테이블 삭제하기

--어제 만든 shop, cart1 ,car2삭제해보기
drop table car2;
drop table cart1;
drop table shop;
