--�� - 
--����ȣ char(5) pk,
--�̸� varchar2(30),
--��ȭ��ȣ varchar2(15),
--�ּ� varchar2(100),
--�̸��� varchar2(50),
--���� char(2),
--������� date,
--����Ʈ number

CREATE TABLE CUSTOMER(
CUST_ID CHAR(5) PRIMARY KEY,
CU_NAME VARCHAR2(30) NOT NULL,              --NOT NULL�� �ݵ�� �����ؾ� ���� �ǹ�
TEL VARCHAR2(15),
ADDR VARCHAR2(100),
EMAIL VARCHAR2(50),
GEN CHAR(2),
BIRTH DATE,
CU_POINT NUMBER);

--�ŷ�ó - 
--����ڹ�ȣ char(12) pk,
--�ŷ�ó�� varchar2(30),
--�ּ� varchar2(100),
--��ȭ��ȣ varchar2(15),
--��ǥ�� varchar2(30)

CREATE TABLE ACCOUNTS(
ACC_NO CHAR(12) PRIMARY KEY,
ACC_NAME VARCHAR2(30) NOT NULL,
ADDR VARCHAR2(100) NULL,
TEL VARCHAR2(15) NOT NULL,
CEO VARCHAR2(30) NOT NULL);

--��ǰ -
--��ǰ��ȣ char(5),
--��ǰ�� varchar2(50), 
--����ڹ�ȣ char(12) fk,
--������ varchar2(30), 
--�԰� varchar2(30)

CREATE TABLE PRODUCTS(
PROD_NO CHAR(5) PRIMARY KEY,
PROD_NAME VARCHAR2(50),
ACC_NO CHAR(12),
BRAND VARCHAR2(30),
STAD VARCHAR2(30),
CONSTRAINT ACC_NO_FK FOREIGN KEY(ACC_NO) REFERENCES ACCOUNTS(ACC_NO)); 
--CONSTRAINT:�������� => ACC_NO�� FK�� ����  ACCOUNTS���̺��� ACC_NO�� �����϶�� �ǹ�


--�Ǹ� - 
--�ǸŹ�ȣ char(5) pk,
--�Ǹ��� date, 
--����ȣ char(5) fk,  
--����� date, 
--��ǰ��ȣ char(5) fk, 
--���� number, 
--�Ǹűݾ� number, 
--������� varchar2(20), 
--��� varchar2(1000)

CREATE TABLE SALES(
SAL_NO CHAR(5) PRIMARY KEY,
SALE_DATE DATE DEFAULT SYSDATE,     --�Ǹ����ڸ� �������� ������ ���� ��¥�� ����.
CUST_ID CHAR(5),
DEL_DATE DATE DEFAULT SYSDATE,
PROD_NO CHAR(5),
QUANTITY NUMBER,
AMOUNT NUMBER,
PATMENT VARCHAR2(20),
NOTE VARCHAR2(1000),
CONSTRAINT CUST_ID_FK FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(CUST_ID),
CONSTRAINT PROD_NO_FK FOREIGN KEY(PROD_NO) REFERENCES PRODUCTS(PROD_NO));
