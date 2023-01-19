--emp와 dept를 조인해서 emp 사람들의 직업을 출력해보자
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno;

select ename, dname
from emp e, dept d
where e.deptno=d.deptno;

--professor +department
--교수번호 교수명 학과명

select p.profno, p.name, d.dname
from professor p ,department d
where p.deptno = d.deptno;

--student +professor
--학번   학생명   지도교수번호   지도교수명
select s.studno, s.name ,s.profno, p.name
from student s, professor p
where s.profno = p.profno;

--학번 학생명 제 1 전공과목 
select s.studno,s.name , s.name
from student s ,department d
where s.deptno1= d.deptno;

--student와 department 이윤나의 제1 전공과 동일한 학생의 이름과 1전공 이름을 출력하세요
select s.name 이름,d.dname 제1전공
from student s,department d
where s.deptno1=(select deptno1 from student where name='이윤나') and s.deptno1=d.deptno;

--서진수 컴퓨터공학과

--professor에서 입사일이 김영조 교수보다 나중에 입사한 사람의 이름과 입사일 학과명을 출력하시오
select p.name 교수명 , p.hiredate 입사일 , d.dname 학과망
from professor p, department d
where p.deptno = d.deptno
and hiredate>(select hiredate from professor where name ='김영조');









