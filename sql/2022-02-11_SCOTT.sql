CREATE TABLE SAMPLE(
NO NUMBER,
NAME VARCHAR2(20),
ADDRESS VARCHAR2(30),
TEL VARCHAR2(20));

--데이터 삭제
DELETE FROM 테이블명
WHERE 조건;

DELETE FROM SAMPLE
WHERE ADDRESS LIKE '%대전%';

--테이블복사
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;
SELECT * FROM EMP_TEMP;

CREATE TABLE DEPT_EMP
AS 
SELECT EMPNO, ENAME, DNAME, HIREDATE, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT * FROM DEPT_EMP;
COMMIT;
DELETE FROM DEPT_EMP
WHERE EMPNO>7500;
ROLLBACK;
