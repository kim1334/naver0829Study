



-- select ename,sal,NVL(comm,0)sal+NVL(comm,0) from emp; -- �÷����� �ָ�

-- ���߿� �ڹٷ� ������ ��� �÷��ε����� �÷������� ��������. �׷��� �÷Ÿ��� ������ ��� 
-- ��Ī�� �����Ѵ� 
select ename as "�����",sal as "����" from emp;
select ename �����, sal ���� from emp;
select empno "��� ��ȣ", sal ���� from emp; --��Ī�� ������ �ִ� ��� �ݵ�� ""�ȿ� (as�� ����)

select ename �����,sal ����,NVL(comm,0) ������, sal+NVL(comm,0) �ѿ��� from emp;

-- �� �� ���� ���
select count(*) from emp;
select count(*) count from emp;

-- ���ڿ��� �̾ ���
select ename||'���� ������'||job||'�Դϴ�' member from emp;

-- xx���� �� ������ xxx �Դϴ� ( sal+comm, ���� ��� 100���� ���, ������ ȸ�� ����.
select ename||'���� ������'||(sal+NVL(comm,100))||'�Դϴ�' ȸ������ from emp;

-- emp no ������ ��ȸ
select empno,ename from emp where empno=7369 or empno=7788 or empno=7900;

--������ ��ȸ�� in�� ����غ���
select empno, ename from emp where empno in (7369,7788,7900);

-- ���� 3���� empno�� ���� ���
select empno, ename from emp where empno not in (7369,7788,7900);

-- ename, job�� ����ϴµ� job�� salesman�̰ų� analyst , manager 3���� ������ ���
select ename, job  from emp where job in('SALESMAN','ANALYST','MANAGER');

-- ��¥�� ����
select * from emp where hiredate='80/12/17';
select * from emp where hiredate='1980/12/17';
select * from emp where hiredate='1980/01/01' and hiredate<='1981/10-10';

-- ���� ��¥ ��ȸ
select sysdate from dual;
--���ϳ�¥��ȸ
select sysdate+1 from dual;
--tc_char ��ȯ�Լ��� �̿��ؼ� ��ȸ
select to_char(sysdate,'yyyy-mm-dd') from dual;
select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from dual; --mi :�� mm : ��
select to_char(sysdate,'yyyy-mm-dd pm hh:mi') from dual; -- am �Ǵ� pm�� ���� ���� ���İ� ǥ�õȴ�.
select to_char(sysdate,'yyyy-mm-dd') from dual;

-- emp ���� ename, hiredate (yyyy-mm-dd)�� ����ϴ� �� 1981�⿡ �Ի��� ����� ���
select ename �����, to_char (hiredate, 'yyyy-mm-dd') �Ի��� from emp where to_char(hiredate, 'yyyy') = 1981;

--�׷��Լ� : count, max, min avg, sum
select count(*) from emp;  -- ��ü ����Ÿ ����
select avg(sal) from emp; -- sal �� ��� 2073.21428571.....
select round(avg(sal),1) from emp; -- ���� ����� ���Ҷ��� round �Լ��� ���� ����Ѵ�
select round(avg(sal),0) from emp; -- 2073
select round(avg(sal),-1) from emp; -- 2070
select round(avg(sal),-2) from emp; -- 2100

select sum(sal) from emp; --sal�� �� �հ� 29025
select min(sal) from emp; -- ���� ���� �޿�
select max(sal) from emp; -- ���� ū �޿�

-- ���� ���� �޿��� �޴� ����� �̸��� �˾ƺ����� -- �����ȿ� ������ �ִ� ������ ������
select ename,sal from emp where sal=(select min(sal) from emp);
-- ���� ū �޿��� �ޤ��� ����� �̸��� ��ȸ
select ename,sal from emp where sal=(select max(sal) from emp);

--SCOTT �� ������ ���� ������ ���� ����� ��ȸ(ename,job,sal)
select ename,job,sal from emp where job=(select job from emp where ename='SCOTT');

--allen ���� �� ���� ������ �޴� ����� �ο�����?
select count(*)l from emp where sal>(select sal from emp where ename='ALLEN');


--GROUP BY
-- job �������� �ϴ� �ο����� ������
select job ����, count(*) �ο��� from emp group by job;
--���� ����� ������ ������������ ���
select job ����, count(*) �ο��� from emp group by job order by ����; -- ���� ������ �������� ����
select job ����, count(*) �ο��� from emp group by job order by 1; -- ����ġ�� �������� ���� (1��° ��ġ)

-- �ο����� ������������ ���
select job ����, count(*) �ο��� from emp group by job order by �ο���; -- ���� ������ �������� ����
select job ����, count(*) �ο��� from emp group by job order by 2; -- ����ġ�� �������� ���� (2���� ��ġ)

--�������� �ο���, ��տ����� ��������, �ְ����� ����غ���
select job ����, count(*) �ο���, round(avg(sal),0) ��տ���, max(sal) �ְ���,
 min(sal) �������� from emp group by job;
 
 -- �׷쿡 ���� ������ �� ��� HAVING
 -- ���� SQL���� �ο����� 3�� �̻��� �׷츸 ���
 select job ����, count(*) �ο���, round(avg(sal),0) ��տ���, max(sal) �ְ���,
 min(sal) �������� from emp group by job HAVING COUNT(*) >=3;
 
 -- ����Ŭ �Լ���
 -- �����Լ�
 SELECT ABS(-5),ABS(5) FROM DUAL; --ABS: ���밪���� ��� (�����)
 select ceil(2.1), ceil(2.9) from dual; -- ceil(����) : ������ �ø� �ݿø� �ƴϰ� ������ �÷�
 select floor(2.1), floor(2.9) from dual; -- floor(����): ������ ����
 select mod(7, 2) from dual; --mod : ������ 1
 select power(2, 3) from dual; --power : ���� �� 8
 
 --��ȯ�Լ�
 select '7'+7 from dual; -- ���� 7 ���� 7 ���ϸ�? �˾Ƽ� ����
 select to_number('7')+7 from dual;
 select to_char(sysdate, 'yyyy-mm-dd') from dual;
 
 --�����Լ�
 select concat('hello','world') from dual; -- ���ڿ� ��ġ��
  select 'hello'||'world' from dual;
  
  --���߿� �ڹٿ��� �ܾ��Է��ϸ� �� �ܾ ������ �Խñ��� ����ϴ��� �� ��
  select *from board where subject like '%'||������||'%'; -- ����Ŭ
  select * from board where subject like concat('%',������,'%'); -- mysql
  
  select LPAD(23500,10,'*') from dual; -- �� 10�ڸ��� ���� �����ڸ��� * �� ä���
  select RPAD(23500,10,'*') from dual; -- �� 10�ڸ��� ���� ������ �ڸ��� *�� ä���
  
select intcap('hello') from dual; -- ù���ڸ� �빮�ڷ�
select lower('hello') from dual; -- ��ü �ҹ��ڷ�
 select upper('hello') from dual; -- ��ü �빮�ڷ�
 
 select initcap(ename), lower(ename), upper(ename) from emp;
 
 select substr('hello kitty',3,3) from dual; -- 3��°���� 3���� ����
 select substr('hello kitty',-3,3) from dual; -- �ڿ��� 3��°���� 3���� ����
 
 --ename,sal ���(ename�� �α��ڸ� �����ؼ� ����� �ڿ�'***' �ٿ��� ���
 --sal�� �� 7�ڸ��������ϴµ� �տ� **�� ä���� ���
 select substr(ename,1,2)||'***', LPAD(sal,7,'*') from emp;
 
 --���� ���� ����
 select '*'||'          hello       '||'*' from dual;
  select '*'||trim('          hello       ')||'*' from dual;
  
select decode(2, 1, 'one', 2, 'two', 3, 'three', 4, 'four' ) FROM dual;
select ename,deptno,decode(deptno,10,'�λ�',20,'�뱸',30,'���ֵ�') from emp;

--1�� ����
-- emp ���̺��� ename a�� s�� �����ϴ� ��� ���
select * from emp where lower(ename) like 'a%' or lower(ename) like 's%';

--2�� ����
-- emp ���̺��� ename ���� �ι�° ��¥�� A �λ�� ���
select * from emp where ename like '_A%';

--3�� ����
--job ���� ���� �������� ��� �ѹ����� ��� (��������)
select DISTINCT job from emp order by job;

--4�� ����
-- job�������� �ο����� ���ϱ� (�ο����� ������������ ���)
select job,count(*) �ο��� from emp GROUP by job order by 1 desc;

-- 5�� ���� 
-- job �������� sal ��ձ޿��� ���϶�, ��ٱ޿��� ������������ ���
select job ��������, ROUND(avg(sal),0) ��ձ޿� from emp GROUP by job order by 2;

-- 6������
-- job �������� sal�� �ִ밪�� �ּҰ��� ���϶�
select job ��������, max(sal) �ִ밪, min(sal) �ּҰ� from emp GROUP by job;

--7������
--deptno �� 10�ΰ�� 'ȫ����' 20�ΰ�� '���ߺ�' 30�ΰ�� '������' �μ��� ���Ͽ� ename, �μ� ���
select ename,deptno,decode(deptno,10,'ȫ����',20,'���ߺ�',30,'������') �μ�
from emp;

-- 8 �޿�(sal)�� sal�� ��պ��� �� ���� ����� ename�� sal�� ����Ͻÿ�
select ename,sal from emp where sal>(select avg(sal) from emp);

-- 9. hiredate ���� ���� 5���� ����� eanme�� hiredate�� ���
select ename,hiredate from emp where to_char(hiredate,'mm') = '05';

-- 10. SCOTT�� �޿��� �����ϰų� �� ���� �޴� ������ �޿��� ����϶�
select ename,sal from emp where sal>=(select sal from emp where lower(ename)='scott');







