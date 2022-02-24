--ASRESULT
insert into ASRESULT values('80001', 50000, 'ħ��', '�ϵ���� ��ü', '2022-02-03', 5, NULL);
insert into ASRESULT values('80002', 30000, '���', '���̽���ü', '2022-02-04', 5, NULL);
insert into ASRESULT values('80003', 00000, '��ǰ�ҷ�', '����ǰ��ȯ', '2022-02-06', 5, NULL);

--BRAND
insert into BRAND values('20001', '�Ｚ����', '��⵵ ������ ���뱸 �Ｚ�� 129', '02-2255-0114', '����Ʈ��', NULL, NULL);
insert into BRAND values('20002', 'LG����', '����Ư���� �������� ���Ǵ�� 128', ' 02-3777-1114', 'TV', NULL, NULL);
insert into BRAND values('20003', '����', '��󳲵� ���� �������2��14', '1588-8899', '������', NULL, NULL);?

INSERT INTO CUSTOMER VALUES('10001', '�̼���', '�������������굿', 'ABCD@NAVER.KR', '010-1234-5678', 'Y', '1997-06-17');
INSERT INTO CUSTOMER VALUES('10002', 'ȫ�浿', '���� Ư����', '1234@NAVER.KR', '010-9876-5432', 'N', '1978-02-19');
INSERT INTO CUSTOMER VALUES('10003', '�ƹ���', '��������Ž�浿', '��������@NAVER.KR', '016-0000-0000', 'Y', '2002-02-22');
--7���� (5�ڸ� ����-����� ���̵�(CU-ID), 30�̸� �̸�, 100�̸� �ּ�, 50�̸� �̸���, 15�̸� ��ȭ��ȣ, 5�̸� ȥ�ο��� Y-N , SYSDATE)

INSERT INTO IMPROV VALUES('11001','���� �׷��� �ȳ��Ϳ� ���ż� ���׳��� �ٽ� ������','10001');
INSERT INTO IMPROV VALUES('11002','���� ���� �;��','10002');
INSERT INTO IMPROV VALUES('11003','����Ŀ�','10003');
--3���� (5�ڸ� ����-������ȣ, 2000�̸� ���� ����, 5�ڸ� ����-����� ���̵�(CU-ID))

SELECT * FROM CUSTOMER;
SELECT * FROM IMPROV;

--��ȸ���̺�  INQUIRY
INSERT INTO INQUIRY(INQ_NO,CU_ID, PNO)
VALUES(90001, 10001, 60001);

INSERT INTO INQUIRY(INQ_NO,CU_ID, PNO)
VALUES(90002, 10002, 60002);

INSERT INTO INQUIRY(INQ_NO,CU_ID, PNO)
VALUES(90003, 10003, 60003);

--�����ڸ޴��� MANUAL
INSERT INTO MANUAL(MANUAL_ID,AS_MANUAL)
VALUES('12001','�Ｚ�׶��� �޴���: �����Ͻþ� �˾Ƽ� ���⸦ �ٶ��ϴ�.');

INSERT INTO MANUAL(MANUAL_ID,AS_MANUAL)
VALUES('12002','LG STYLER �޴���: �����Ͻþ� ����Ͻñ� �ٶ��ϴ�.');

INSERT INTO MANUAL(MANUAL_ID,AS_MANUAL)
VALUES('12003','APPLE IPHON �޴���: ������ ������ ���� �� ����Ͻñ� �ٶ��ϴ�.');

--����Ʈ���� ��� OPERATOR
INSERT INTO OPERATOR(OPID, REQNO, PNO, IMPNO)
VALUES('40001', '50001', '60001','11001');

INSERT INTO OPERATOR(OPID, REQNO, PNO, IMPNO)
VALUES('40002', '50002', '60002','11002');

INSERT INTO OPERATOR(OPID, REQNO, PNO, IMPNO)
VALUES('40003', '50003', '60003','11003');

---A/S ������ AS_SUPPLIER
INSERT INTO as_supplier(SUP_ID, AREA, AS_NAME, AS_TEL, AS_EMAIL, RANK)
VALUES('30001', '����', '�ֿ���', '010-2515-8746', 'ain8746@naver.com','�븮');
INSERT INTO as_supplier(SUP_ID, AREA, AS_NAME, AS_TEL, AS_EMAIL, RANK)
VALUES('30002', '����', '���⵿', '010-4187-5777', 'rlehd@naver.com','����');
INSERT INTO as_supplier(SUP_ID, AREA, AS_NAME, AS_TEL, AS_EMAIL, RANK)
VALUES('30003', '�λ�', '������', '010-4055-5239', 'tjdgnl@naver.com','����');

---A/S ��û
INSERT INTO asrequest(reqno, symptom, reqdate, exprocess)
VALUES('50001', '������� ��~�ϴ¼Ҹ�������', sysdate, SYSDATE + 3);
INSERT INTO asrequest(reqno, symptom, reqdate, exprocess)
VALUES('50002', 'TV���׳��� ��û�� "�Է½�ȣ�� ���ϰų� �����ϴ�." ��� ȭ���̺�����', sysdate, SYSDATE + 3);
INSERT INTO asrequest(reqno, symptom, reqdate, exprocess)
VALUES('50003', '��Ź�� �޼����ȵǿ�', sysdate, SYSDATE + 3);

alter table product add FOREIGN KEY(rno) REFERENCES Repair(rno);

insert into repair(rno, rdiv, rlist, pay) values(70001, '����', '��ǰ', 99999999);
insert into repair(rno, rdiv, rlist, pay) values(70002, '����', '�Ҹ�ǰ', 5000);
insert into repair(rno, rdiv, rlist, pay) values(70003, '���̺�', '��ǰ', 700000);

insert into product(pno,  pname,   psize, function, wperiod,            tip,      cu_manual,    excycle,   rno, Manual_ID)
			values(60001, '��Ź��',  '300L',  '��Ź���', sysdate, '���� �ڵ带 ���ٳ���', '����ó�� �����ϼ���', '������ 6����', 70001,    12001);
insert into product(pno,  pname,   psize, function, wperiod,            tip,      cu_manual,    excycle,   rno, Manual_ID)
			values(60002, '������',  '500L',  '�������', sysdate, '�� �� ������', '����ó�� �����ϼ���', '������ 3����', 70002,    12002); 
insert into product(pno,  pname,   psize, function, wperiod,            tip,      cu_manual,    excycle,   rno, Manual_ID)
			values(60003, '������',  '����',  '������', sysdate, '�õ� ���� Ű��', '����ó�� �����ϼ���', '������ 1��', 70003,    12003);

ALTER TABLE as_supplier
ADD CONSTRAINT impno
FOREIGN KEY (impno)
REFERENCES improv(impno);

select * from as_supplier;
SELECT * from asrequest;
SELECT * from asresult;
SELECT * from brand;
SELECT * from customer;
SELECT * from improv;
SELECT * from inquiry;
SELECT * from manual;
SELECT * from operator;
SELECT * from product;
SELECT * from repair;

select pno from product
where pname='��Ź��';

select cu_name, cu_tel, addr, pname from customer c, asrequest q, product p
where q.pno=(select pno from product
             where pname='��Ź��')
and c.cu_id=q.cu_id
and p.pno=q.pno;


commit;       





