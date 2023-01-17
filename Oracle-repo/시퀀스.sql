--시퀀스는 유일(unique)한 값을 생성해주는 오라클 객체-
--시퀀스 생성 ,1부터 1씩 증가
create sequence seq1;

--전체시퀀스 확인
select * from seq;

--다음 시퀀스 값을 발생해서 콘솔에 출력
select seq1.nextval from dual;

--현재 마지막 발생한 시퀀스값 
select seq1.currval from dual;

drop sequence seq1;

--10부터 5씩 증가하는 시퀀스 생성-chache값은 없애기
create sequence seq_1 start with 10 increment by 5 nocache;

--시퀀스 발생
select seq_1.nextval from dual;

--시퀀스를 수정.. start with는 수정불가, maxvalue까지 지정한 후 그 값이 나오면 다시 처음부터 나오도록
alter sequence seq_1 increment by 10 maxvalue 100 cycle;

drop sequence seq_1;