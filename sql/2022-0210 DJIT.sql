--�Ƶ�ٽ��� ����ȭ�� ������ ���� ����ȣ, �̸�, ���Ǹűݾװ� ������ ���ϼ���.
SELECT C.CUST_ID, CU_NAME, SUM(AMOUNT) �հ�ݾ�,  SUM(QUANTITY) �Ѽ���
FROM CUSTOMER C, SALES S,  PRODUCTS P
WHERE S.CUST_ID = C.CUST_ID 
AND S.PROD_NO = P.PROD_NO 
AND PROD_NAME = '����ȭ' AND BRAND = '�Ƶ�ٽ�'
GROUP BY C.CUST_ID, CU_NAME
ORDER BY CU_NAME;

--2,000,000 ���ϴ� VIP, 2,000,000�ʰ� 70,000,000���ϴ� VVIP, ���̻��� VVIP+�� ����� ��ȸ�Ѵ�.
SELECT CU_NAME, SUM(AMOUNT) TOT,
CASE WHEN SUM(AMOUNT) > 70000000 THEN 'VVIP++'
           WHEN SUM(AMOUNT) BETWEEN 2000000 AND 70000000 THEN 'VVIP'
           ELSE 'VIP'
END AS GRADE
FROM CUSTOMER C, SALES S
WHERE C.CUST_ID = S.CUST_ID
GROUP BY CU_NAME
ORDER BY CU_NAME;

--�Ǹ� ���� �� ��������� �������� ������ ���Ǹ�� ����ȣ, �̸��� ��ȸ�Ѵ�.
SELECT PROD_NAME, C.CUST_ID, CU_NAME
FROM PRODUCTS P, CUSTOMER C, SALES S
WHERE S.CUST_ID = C.CUST AND S.PROD_NO = P.PROD_NO
AND PAYMENT = '����';

--���� ������ ��� �� �̸�, �� ����� ���� ��Ʈ
SELECT CU_NAME, NOTE, C.ADDR
FROM CUSTOMER C, SALES S
WHERE C.CUST_ID = S.CUST_ID AND ADDR LIKE '%���� ����%';

--������ �����ϴ� ��� �ֿ� ����Ű�� ������ ���� �̸�, ���̵�, �ּ�
SELECT CU_NAME, C.CUST_ID, C.ADDR
FROM CUSTOMER C, PRODUCTS P, SALES S
WHERE S.CUST_ID=C.CUST_ID AND P.PROD_NO=S.PROD_NO AND BRAND='����Ű';

--������ �����ϴ� ��� �ֿ� ����Ű�� ������ ���� �̸�, ���̵�, �ּ� ī�����
SELECT CU_NAME, C.CUST_ID, C.ADDR
FROM CUSTOMER C, PRODUCTS P, SALES S
WHERE S.CUST_ID=C.CUST_ID AND P.PROD_NO=S.PROD_NO AND BRAND='����Ű' AND PAYMENT='ī��';

--������ �����ϰ� ��� ���� ����, ��ȭ��ȣ
SELECT CU_NAME, TEL
FROM CUSTOMER C, SALES S
WHERE C.CUST_ID=S.CUST_ID AND NOTE IS NULL AND ADDR LIKE '%����%';

--������ �������� �ʴ� ���� ������ܺ� �հ�, �ּҸ� �˾ƺ���
SELECT CU_NAME, SUM(AMOUNT), PAYMENT
FROM CUSTOMER C, SALES S
WHERE C.CUST_ID = S.CUST_ID AND
              C.CUST_ID IN (SELECT CUST_ID
                                      FROM CUSTOMER
                                      WHERE ADDR NOT LIKE '%����%')
            GROUP BY CU_NAME, PAYMENT;
            
--���� ���� �ȸ� ��ǰ�� �Ǹűݾ��� ��
SELECT PROD_NAME
FROM PRODUCTS
WHERE PROD_NO=(SELECT PROD_NO
                                  FROM(SELECT PROD_NO, SUM(QUANTITY) TOT
                                              FROM SALES
                                              GROUP BY PROD_NO)
                                  WHERE TOT =(SELECT MAX(TOT)
                                                           FROM(SELECT PROD_NO, SUM(QUANTITY) TOT
                                                           FROM SALES
                                                           GROUP BY PROD_NO)));
                                                           

--��ǰ�� �Ǹűݾ��� 5�� �̻��� ��ǰ
SELECT PROD_NAME, TOT
FROM(SELECT PROD_NAME, SUM(AMOUNT) TOT
            FROM SALES S, PRODUCTS P
            WHERE S.PROD_NO = P.PROD_NO
            GROUP BY PROD_NAME) TEMP
WHERE TOT >= 500000000
ORDER BY TOT DESC;

--��ǰ�� ������ ���帹�� �ŷ�ó
SELECT ACC_NAME
FROM(SELECT ACC_NAME, COUNT(*) CNT
            FROM ACCOUNTS A, PRODUCTS P
            WHERE P.ACC_NO = A.ACC_NO
            GROUP BY ACC_NAME)
WHERE CNT = (SELECT MAX(CNT)
                            FROM(SELECT ACC_NAME, COUNT(*) CNT
                             FROM ACCOUNTS A, PRODUCTS P
                            WHERE P.ACC_NO = A.ACC_NO
                            GROUP BY ACC_NAME));

--�ϳ��� �ȸ��� ���� ��ǰ
SELECT PROD_NAME
FROM PRODUCTS
WHERE PROD_NO IN (
        SELECT DISTINCT P.PROD_NO
        FROM PRODUCTS P, SALES S
        WHERE P.PROD_NO=S.PROD_NO(+)
        MINUS
        SELECT DISTINCT P.PROD_NO
        FROM PRODUCTS P, SALES S
        WHERE P.PROD_NO=S.PROD_NO);



