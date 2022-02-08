select * from emp
where deptno = 20 or deptno = 30;

--in()�� or
select * from emp
where deptno in(20,30);

select * from emp
where deptno not in(20,30);

--�μ���ȣ�� 20�� �μ��̸� ������ 3000�̻��� ��� ���� ��ȸ
select * from emp
where deptno=20 and sal>=3000;

select * from emp
where sal between 2000 and 3000;

select * from emp
where ename like '_I%';

select * from emp
where comm is not null;

select * from emp where deptno = 20 UNION
select * from emp where deptno = 30;

select * from emp minus
select * from emp where deptno = 30;

select * from emp INTERSECT
select * from emp where deptno = 30;

--p.125 �ر����� �ѹ���!
--1��
select * from emp
where ename like '%S';

--2��
--������ ������ ��� ��ҹ��ڸ� �����ϴ� �����Ұ�
select * from emp
where deptno = 30 and job = 'SALESMAN';

--3��
select * from emp
where deptno in(20,30) and sal>2000;

--4��
select * from emp
where sal>=2000 and sal <=3000;

--5��
select ename, empno, sal, deptno
from emp
where ename like '%E%' and deptno = 30 and sal between 1000 and 2000;

--lower �����͸� �ҹ��ڷ� �ٲ۴�.
select empno, lower(ename), sal from emp;

--initcap �������� ù���ڸ� �빮�ڷ� �ٲ۴�.
--���Ⱑ �ִ� ��� �ܾ��� ù���ڸ� �빮�ڷ� �ٲ۴�.
select empno, initcap(ename), sal from emp;

--�������� ���̸� ��ȯ�Ѵ�.
select empno, ename, length(ename), sal from emp;

--length�� ���ڼ��� ��ȯ�Ѵ�. lengthb�� ������ ũ��(����Ʈ)�� ��ȯ�Ѵ�.
select length('�ѱ��Ӵ�'), lengthb('�ѱ��Ӵ�') from dual;

select empno, substr(ename, 3, 2) from emp;
select empno, substr(ename, 3) from emp;

CREATE TABLE "TEST" 
   (	"CODE" VARCHAR2(50 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"PRICE" NUMBER, 
	"AMOUNT" NUMBER, 
	"SALEDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into TEST
SET DEFINE OFF;
Insert into TEST (CODE,NAME,PRICE,AMOUNT,SALEDATE) values ('�����-kr-230L','�Ｚ',2300000,1000,to_date('22/02/04','RR/MM/DD'));
Insert into TEST (CODE,NAME,PRICE,AMOUNT,SALEDATE) values ('��ġ�����-kr-800L','�Ｚ',3300000,100,to_date('22/02/04','RR/MM/DD'));

select * from test;

select instr(code, '-',1), name, price from test;
select substr(code, 1, instr(code, '-',1)-1), name , price from test;
select substr(code, instr(code, '-', instr(code, '-', 1)+1)+1), name , price from test;

select '801104-1432512', replace('8011404-1432512','1432512','*') from dual;
select replace('1234-5678-9009','-',' ') from dual;
select rpad('oracle', 10, '#') from dual;
select lpad('256-2462', 13, '(042)') from dual;
select concat(code, name) from test;
select trim('   trim   ') from dual;


select round(avg(sal),2) from emp;
select trunc(avg(sal),3) from emp;
select ceil(avg(sal)) from emp;
select mod(5,3)from dual;
select sysdate from dual;
select add_months(sysdate, 12) from dual;

select to_date('1980-2-14') from dual;

select * from test
where to_char(saledate,'yyyy-mm-dd') = '2022-02-04';
select to_char(saledate, 'yyyy-mm-dd') from test;

select round(months_between(sysdate, to_date('1997-07-20'))) from dual;
select last_day(add_months(sysdate, 24)) from dual;
select next_day(sysdate, '������') from dual;

-- +�� ����������̱� ������ �ڵ�����ȯ�� ���� ���ڿ��ӿ��� ���ڷ� ����Ѵ�.
select empno, ename, empno+'500'
from emp
where ename = 'SCOTT';

select 'abcd' || to_char(empno), ename
from emp
where ename = 'SCOTT';

select 1234 || to_char(empno), ename
from emp
where ename = 'SCOTT';

select to_char(sysdate,'yyyy-mm-dd dy') from dual;

select 123 +'1234' from dual;
select * from emp;

--null�ΰ�� ������ �����ͷ� ��ȯ
select ename, nvl(comm,'0') from emp;
select ename, nvl2(comm, 'O', 'X') from emp;

