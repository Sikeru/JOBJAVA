--��������(��û�� ����, ��ǰ����)
select cu_name �̸�, cu_email �̸���, cu_tel ��ȭ��ȣ, addr �ּ�, pname ��ǰ��, symptom ���� 
from asrequest q, customer c, product p
where q.pno=p.pno and
      q.cu_id = c.cu_id;

--ASó���������
select cu_name �̸�, cu_email �̸���, cu_tel ��ȭ��ȣ, addr �ּ�, pname ��ǰ��, cost ���, CAUSE ������ü ,ACTION ��ġ����
from asrequest q, customer c, product p, asresult r
where q.pno=p.pno 
  and q.cu_id = c.cu_id
  and q.reqno=r.reqno;
      
--���� ��� ǥ��
select substr(reqno,4,2) ��ȣ, reqdate ������ from asrequest;

--������Ȯ��
select pname ��ǰ��, tip ���������� from product;

--��Ź�� AS�� ��û�� ������
select cu_name ����, cu_tel ��ȭ��ȣ, addr �ּ�, pname ��ǰ�� from customer c, asrequest q, product p
where q.pno=(select pno from product
             where pname='��Ź��')
and c.cu_id=q.cu_id
and p.pno=q.pno;

--AS�������� ���������� ������� ������ǰ ��ȸ
select area ��������, pname ��ǰ�� from asrequest q, as_supplier s, customer c, product p
where q.cu_id=c.cu_id
  and q.sup_id=s.sup_id
  and q.pno = p.pno;

