--그룹함수
select sum(sal) 합계 from emp;

--sal에 대한 전체합계 평균(소수점이하 한자리 반올림)
select sum(sal) 합계,round(Avg(sal),1) 평균 from emp;

--최고급여 최저급여
select max(sal),min(sal) from emp;

--입사일 81년
select * from emp where hiredate>='81/01/01' and hiredate<='81/12/31';
select * from emp where hiredate between '81/01/01' and '81/12/31';

select * from emp where to_char(hiredate,'YY') ='81';


--Group by: 특정조건으로 세부적인 그룹화하기
--professor 에서 학과별로 교수들의 평균급여를 출력하시오
select deptno"학과" ,avg(pay)"평균급여"
from professor
group by deptno;


--professor에서 학과별로 교수들의 총급여를 출력하시오.
select deptno"학과" ,sum(pay) "총급여"
from professor
group by deptno;

--professor에서 학과별, 직급별로 교수들의 평균급여를 출력하세요.
select deptno "학과" ,교수직급,avg(pay) "평균급여"
from professor
group by deptno, 교수직급;

--student에서 학년별 평균키와 최고몸무게를 구하시오.
select grade "학년" , avg(height)"평균키" , max(weight) "최고몸무게"
from student
group by grade;

--professor 에서 교수직급별로 평균 pay와 최고 보너스를 구하시오
select 교수직급 , avg(pay),max(bonus) 
from professor
group by 교수직급;

--emp에서 동일한 직무를 가진 사람의 수를 구하시오
select job 직무 ,count(empno) 사원수
from emp
group by job;

--job 별로 평균급여
select job 직무, round(avg(sal),1)평균급여
from emp
group by job;
--job 별로 최고급여와 최저급여를 구하시오
select job 직무, max(sal),min(sal)
from emp
group by job;

--[소계 함수] roolup

--group by 절에 주어진 조건으로 소계값을 구해준다.

--professor에서 학과별, 교수직급별 소개
select deptno 학과번호 , 교수직급,sum(pay) 총급여
from professor
group by 교수직급, rollup(deptno);

select deptno 학과번호, 교수직급, sum(pay) 총급여
from professor
group by deptno, rollup(교수직급);

select 교수직급 , count(*), sum(pay)
from professor
group by rollup(교수직급);

select deptno 학과번호, 교수직급,sum(pay)총급여
from professor
group by rollup(deptno,교수직급);

--cube : 전체총합까지 출력해줌.
select deptno, 교수직급,count(*),sum(pay)
from professor
group by cube(deptno,교수직급);

select deptno
from emp
group by deptno;

--Having절
--where 절은 집계함수 사용할 수 없다.
-- Having절은 집계함수를 가지고 조건비교할 때 사용한다.
-- Having 절은 group by와 함께 사용이 된다.


--Q.평균급여가 450이상인 부서의 부서번호와 평균급여를 구한다.
select deptno, avg(pay)
from professor
group by deptno
having avg(pay)>=450;

--emp에서 평균연봉이 2000이상인 부서의 부서번호와 평균급여를 구하시오
select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>=2000;

--emp에서 직군별 직원수가 2명이상인 곳만 출력하시오
select job ,count(*) 인원수
from emp
group by job
having count(*)>=2;

--emp에서 직군별 직원수가 2명이상이고 총급여가 5000이상곳만 출력
select job 직군, count(*) cnt, sum(sal) 총급여
from emp
group by job
having count(*)>=2 and sum(sal)>5000;

--모든 절을 사용하여 검색
select job, sum(sal) 급여합계
from emp 
where job not in('SALESMAN') --세일스맨 제외
group by job
having sum(sal)>5000
order by sum(sal) desc;














