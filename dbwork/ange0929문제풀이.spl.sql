



-- select ename,sal,NVL(comm,0)sal+NVL(comm,0) from emp; -- 컬럼명을 주목

-- 나중에 자바로 가져갈 경우 컬럼인덱스나 컬럼명으로 가져간다. 그래서 컬렴명이 복잔한 경우 
-- 별칭을 지정한다 
select ename as "사원명",sal as "연봉" from emp;
select ename 사원명, sal 연봉 from emp;
select empno "사원 번호", sal 연봉 from emp; --별칭에 공백이 있는 경우 반드시 ""안에 (as는 생략)

select ename 사원명,sal 연봉,NVL(comm,0) 수수료, sal+NVL(comm,0) 총연봉 from emp;

-- 총 글 갯수 출력
select count(*) from emp;
select count(*) count from emp;

-- 문자열을 이어서 출력
select ename||'님의 직업은'||job||'입니다' member from emp;

-- xx님의 총 연봉은 xxx 입니다 ( sal+comm, 널일 경우 100으로 계산, 제목은 회원 연봉.
select ename||'님의 연봉은'||(sal+NVL(comm,100))||'입니다' 회원연봉 from emp;

-- emp no 여러개 조회
select empno,ename from emp where empno=7369 or empno=7788 or empno=7900;

--여러개 조회시 in을 사용해보자
select empno, ename from emp where empno in (7369,7788,7900);

-- 위의 3개의 empno을 빼고 출력
select empno, ename from emp where empno not in (7369,7788,7900);

-- ename, job을 출력하는데 job이 salesman이거나 analyst , manager 3개의 직업만 출력
select ename, job  from emp where job in('SALESMAN','ANALYST','MANAGER');

-- 날짜로 조건
select * from emp where hiredate='80/12/17';
select * from emp where hiredate='1980/12/17';
select * from emp where hiredate='1980/01/01' and hiredate<='1981/10-10';

-- 현재 날짜 조회
select sysdate from dual;
--내일날짜조회
select sysdate+1 from dual;
--tc_char 변환함수를 이용해서 조회
select to_char(sysdate,'yyyy-mm-dd') from dual;
select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from dual; --mi :분 mm : 월
select to_char(sysdate,'yyyy-mm-dd pm hh:mi') from dual; -- am 또는 pm을 쓰면 오전 오후가 표시된다.
select to_char(sysdate,'yyyy-mm-dd') from dual;

-- emp 에서 ename, hiredate (yyyy-mm-dd)를 출력하는 데 1981년에 입사한 사람만 출력
select ename 사원명, to_char (hiredate, 'yyyy-mm-dd') 입사일 from emp where to_char(hiredate, 'yyyy') = 1981;

--그룹함수 : count, max, min avg, sum
select count(*) from emp;  -- 전체 데이타 갯수
select avg(sal) from emp; -- sal 의 평균 2073.21428571.....
select round(avg(sal),1) from emp; -- 보통 평균을 구할때는 round 함수와 같이 사용한다
select round(avg(sal),0) from emp; -- 2073
select round(avg(sal),-1) from emp; -- 2070
select round(avg(sal),-2) from emp; -- 2100

select sum(sal) from emp; --sal의 총 합계 29025
select min(sal) from emp; -- 제일 작은 급여
select max(sal) from emp; -- 제일 큰 급여

-- 제일 작은 급여를 받는 사람의 이름을 알아보세요 -- 쿼리안에 쿼리가 있는 구조는 서브쿠리
select ename,sal from emp where sal=(select min(sal) from emp);
-- 제일 큰 급여를 받ㅈ는 사람의 이름을 조회
select ename,sal from emp where sal=(select max(sal) from emp);

--SCOTT 의 직업과 같은 직업을 가진 사람들 조회(ename,job,sal)
select ename,job,sal from emp where job=(select job from emp where ename='SCOTT');

--allen 보다 더 높은 연봉을 받는 사람의 인원수는?
select count(*)l from emp where sal>(select sal from emp where ename='ALLEN');


--GROUP BY
-- job 직업별로 일단 인원수를 구햅자
select job 직업, count(*) 인원수 from emp group by job;
--위의 결과를 직업의 오름차순으로 출력
select job 직업, count(*) 인원수 from emp group by job order by 직업; -- 행의 명으로 오름차순 정렬
select job 직업, count(*) 인원수 from emp group by job order by 1; -- 행위치로 오름차순 정렬 (1번째 위치)

-- 인원수의 오름차순으로 출력
select job 직업, count(*) 인원수 from emp group by job order by 인원수; -- 행의 명으로 오름차순 정렬
select job 직업, count(*) 인원수 from emp group by job order by 2; -- 행위치로 오름차순 정렬 (2번쨰 위치)

--직업별로 인원수, 평균연봉과 최저연봉, 최고연봉을 출력해보자
select job 직업, count(*) 인원수, round(avg(sal),0) 평균연봉, max(sal) 최고연봉,
 min(sal) 최저연봉 from emp group by job;
 
 -- 그룹에 대한 조건을 줄 경우 HAVING
 -- 위의 SQL문에 인원수가 3명 이상인 그룹만 출력
 select job 직업, count(*) 인원수, round(avg(sal),0) 평균연봉, max(sal) 최고연봉,
 min(sal) 최저연봉 from emp group by job HAVING COUNT(*) >=3;
 
 -- 오라클 함수들
 -- 숫자함수
 SELECT ABS(-5),ABS(5) FROM DUAL; --ABS: 절대값으로 출력 (양수값)
 select ceil(2.1), ceil(2.9) from dual; -- ceil(숫자) : 무조건 올림 반올림 아니고 무조건 올려
 select floor(2.1), floor(2.9) from dual; -- floor(숫자): 무조건 내림
 select mod(7, 2) from dual; --mod : 나머지 1
 select power(2, 3) from dual; --power : 지수 승 8
 
 --변환함수
 select '7'+7 from dual; -- 문자 7 숫자 7 더하면? 알아서 해줌
 select to_number('7')+7 from dual;
 select to_char(sysdate, 'yyyy-mm-dd') from dual;
 
 --문자함수
 select concat('hello','world') from dual; -- 문자열 합치기
  select 'hello'||'world' from dual;
  
  --나중에 자바에서 단어입력하면 그 단어를 포함한 게시글을 출력하던가 할 때
  select *from board where subject like '%'||변수명||'%'; -- 오라클
  select * from board where subject like concat('%',변수명,'%'); -- mysql
  
  select LPAD(23500,10,'*') from dual; -- 총 10자리중 남는 왼쪽자리에 * 로 채우기
  select RPAD(23500,10,'*') from dual; -- 총 10자리중 남는 오른쪽 자리에 *로 채우기
  
select intcap('hello') from dual; -- 첫글자만 대문자로
select lower('hello') from dual; -- 전체 소문자로
 select upper('hello') from dual; -- 전체 대문자로
 
 select initcap(ename), lower(ename), upper(ename) from emp;
 
 select substr('hello kitty',3,3) from dual; -- 3번째부터 3글자 추출
 select substr('hello kitty',-3,3) from dual; -- 뒤에서 3번째부터 3글자 추출
 
 --ename,sal 출력(ename은 두글자만 추출해서 출력후 뒤에'***' 붙여서 출력
 --sal은 총 7자리로툴력하는데 앞에 **로 채워서 출력
 select substr(ename,1,2)||'***', LPAD(sal,7,'*') from emp;
 
 --양쪽 공백 제거
 select '*'||'          hello       '||'*' from dual;
  select '*'||trim('          hello       ')||'*' from dual;
  
select decode(2, 1, 'one', 2, 'two', 3, 'three', 4, 'four' ) FROM dual;
select ename,deptno,decode(deptno,10,'부산',20,'대구',30,'제주도') from emp;

--1번 문제
-- emp 테이블에서 ename a나 s로 시작하는 사람 출력
select * from emp where lower(ename) like 'a%' or lower(ename) like 's%';

--2번 문제
-- emp 테이블에서 ename 에서 두번째 글짜가 A 인사람 출력
select * from emp where ename like '_A%';

--3번 문제
--job 에서 같은 직업군일 경우 한번씩만 출력 (오름차순)
select DISTINCT job from emp order by job;

--4번 문제
-- job종류별로 인원수를 구하기 (인원수는 내림차순으로 출력)
select job,count(*) 인원수 from emp GROUP by job order by 1 desc;

-- 5번 문제 
-- job 종류별로 sal 평균급여를 구하라, 평근급여의 오름차순으로 출력
select job 직업종류, ROUND(avg(sal),0) 평균급여 from emp GROUP by job order by 2;

-- 6번문제
-- job 종류별로 sal의 최대값과 최소값을 구하라
select job 직업종류, max(sal) 최대값, min(sal) 최소값 from emp GROUP by job;

--7번문제
--deptno 가 10인경우 '홍보부' 20인경우 '개발부' 30인경우 '관리부' 부서를 구하여 ename, 부서 출력
select ename,deptno,decode(deptno,10,'홍보부',20,'개발부',30,'관리부') 부서
from emp;

-- 8 급여(sal)가 sal의 평균보다 더 높은 사람만 ename와 sal을 출력하시오
select ename,sal from emp where sal>(select avg(sal) from emp);

-- 9. hiredate 에서 월이 5월인 사람만 eanme과 hiredate를 출력
select ename,hiredate from emp where to_char(hiredate,'mm') = '05';

-- 10. SCOTT의 급여와 동일하거나 더 많이 받는 사원명과 급여를 출력하라
select ename,sal from emp where sal>=(select sal from emp where lower(ename)='scott');







