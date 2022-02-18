DESC BOOK;
SELECT * FROM BOOK;
SELECT BOOKNAME,PRICE FROM BOOK;
SELECT PUBLISHER FROM BOOK;
SELECT DISTINCT PUBLISHER FROM BOOK;
SELECT * 
FROM BOOK
WHERE PRICE < 10000;
--Q. ������ 10000�� �̻� 20000�� ������ ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE 10000 <= PRICE AND PRICE <= 20000;
--Q. ���ǻ簡 �½�����, Ȥ�� ���ѹ̵���� ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����' OR PUBLISHER = '���ѹ̵��';
SELECT * FROM BOOK WHERE PUBLISHER IN ('�½�����','���ѹ̵��');
--Q. ���ǻ簡 �½�����, Ȥ�� ���ѹ̵� �ƴ� ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE PUBLISHER NOT IN ('�½�����','���ѹ̵��');
--Q. �����̸��� �౸�� ���Ե� ���ǻ縦 �˻��ϼ���.
select PUBLISHER from BOOK where BOOKNAME like '%�౸%';
select * from BOOK where BOOKNAME like '%�౸%';
--[����] �����̸��� ���� �� ��° ��ġ�� ����� ���ڿ��� ���� ������ �˻��ϼ���.
-- _�� Ư�� ��ġ�� �Ѱ��� ���ڿ� ��ġ
-- %�� 0�� �̻��� ���ڿ� ��ġ
SELECT BOOKNAME,PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE'_��%';
--[����] �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��ϼ���.
SELECT * 
FROM BOOK
WHERE BOOKNAME LIKE '%�౸%' AND PRICE >= 20000;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME DESC;

--Q. ������ ���ݼ����� �˻��ϰ� ������ ������ �̸������� �˻��ϼ���.
SELECT * FROM BOOK ORDER BY PRICE,BOOKNAME;
--Q. ������ ������ ������������ �˻��ϰ� ���� ������ ���ٸ� ���ǻ��� ������������ ����ϼ���.
select * from book
order by price Desc,publisher;

SELECT * FROM ORDERS;
SELECT SUM(SALEPRICE)
FROM ORDERS;

SELECT SUM(SALEPRICE) AS "�Ѹ���"
FROM ORDERS;

--Q.CUSTID �� 2���� ���� �ֹ��� ������ ���Ǹž��� ���ϼ���.
select sum(SALEPRICE) AS "�� �Ǹž�" from ORDERS where CUSTID=2;
SELECT SUM(SALEPRICE) AS TOTAL,
AVG(SALEPRICE) AS AVERAGE,
MIN(SALEPRICE) AS MINIMUM,
MAX(SALEPRICE) AS MAXIMUM
FROM ORDERS;

SELECT COUNT(*) FROM ORDERS;

--Q. CUSTID�� ���������� ���Ǹž��� ����ϼ���.
SELECT CUSTID, COUNT(*) AS ��������, SUM(SALEPRICE) AS "�� �Ǹž�"
FROM ORDERS
GROUP BY CUSTID;

--Q. ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���ϼ���. �� �α� �̻� ������ ���� ������
SELECT CUSTID, COUNT(*) AS ��������
FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;

SELECT * FROM CUSTOMER;

SELECT * 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.CUSTID;

--Q. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ���̸����� �����ϼ���.
SELECT NAME, SUM(SALEPRICE)
FROM CUSTOMER,ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME
ORDER BY CUSTOMER.NAME;

--Q. ���� �̸��� ���� �ֹ��� ������ �̸��� ���ϼ���.
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM CUSTOMER,ORDERS,BOOK
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND ORDERS.BOOKID= BOOK.BOOKID;

SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C,ORDERS O,BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID= B.BOOKID;

--[����] ������ 20,000�� ������ �ֹ��� ���� �̸��� ������ �̸��� ���ϼ���.
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE
FROM BOOK B, CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND O.BOOKID=B.BOOKID AND B.PRICE=20000;

--[����] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���ϼ���.
--outer join ���������� �������� ���ϴ��� �ش� ���� ��Ÿ��
SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+);
--[����] ���� ��� ������ �̸��� ����ϼ���.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE=(SELECT MAX(PRICE) FROM BOOK);
SELECT * FROM BOOK;

--[����] ������ ������ ���� �ִ� ���� �̸��� �˻��ϼ���.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
--[����] ���ѹ̵��� ������ ������ ������ ���� �̸��� ����ϼ���.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS
WHERE BOOKID IN (SELECT BOOKID FROM BOOK
WHERE PUBLISHER = '���ѹ̵��'));

--q. ���ǻ� ���� ���ǻ��� ��յ��� ���ݺ��� ��ѵ���
select * from book;
select b1.bookname
from book b1
where b1.price>(select avg(b2.price)
from book b2 where b2.publisher=b1.publisher);

select * from customer;
select * from orders;
select name
from customer
minus
select name
from customer
where custid in(select custid from orders);

select name, adress
from customer
where custid IN(select custid from orders);

-- ���� 3-47 Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� �����ѹα� �λꡯ���� �����Ͻÿ�.
UPDATE Customer
SET address='���ѹα� �λ�'
WHERE custid=5;

-- ���� 3-48 Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
UPDATE Customer
SET address = (SELECT address
	FROM Customer
	WHERE name='�迬��')
WHERE name='�ڼ���';

-- ���� 3-49 Customer ���̺��� ����ȣ�� 5�� ���� �����Ͻÿ�.
DELETE
FROM Customer
WHERE custid=5;

-- ���� 3-50 ��� ���� �����Ͽ���.
DELETE
FROM Customer;

-- ���� ��� �ֹ��ݾ��� ��� ������ �ݿø� �� ��
SELECT	custid "����ȣ", ROUND(SUM(saleprice)/COUNT(*), -2) "��ձݾ�"
FROM	Orders
GROUP BY	custid;

-- [���� 4-4] �������� �߱��� ���Ե� ������ �󱸷� ������ �� ���� ����� ���̽ÿ�.
SELECT	bookid, REPLACE(bookname, '�߱�', '��') bookname, publisher, price
FROM	Book;

-- [���� 4-5] �½��������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ���̽ÿ�.
SELECT 	bookname "����", LENGTH(bookname) "���ڼ�",	LENGTHB(bookname) "����Ʈ��"
FROM 	Book
WHERE 	publisher='�½�����';

select * from customer;
INSERT INTO customer VALUES(5, '�ڼ���', '����', null);

select * from customer;

select SUBSTR(name,1,1) ��, count(*) �ο���
from customer
group by substr(name,1,1);
--
select orderdate, orderdate+10 from orders;

SELECT orderid,orderdate,custid,bookid
FROM orders
WHERE orderdate='2020-07-07';

select custid, name, phone
from customer
where custid<=2;
select * from orders;

SELECT orderid, saleprice
FROM orders
WHERE saleprice <= (select avg(saleprice) from orders);

SELECT	orderid, custid, saleprice
FROM	Orders md
WHERE	saleprice > (SELECT   AVG(saleprice)
			     FROM	Orders so
			     WHERE	md.custid=so.custid);
select *
from customer
where customer.address like '%���ѹα�%';
SELECT	SUM(saleprice)
FROM	orders
WHERE	orders.custid in (SELECT customer.custid
			   FROM	customer
			   WHERE customer.address LIKE '%���ѹα�%');

select orderid,saleprice
from orders
where saleprice > (
select max(saleprice)
from orders
where custid = 3
);

create view vw_customer
as select *
from customer
where address like '���ѹα�';

--����ȣ, �ֹ���ȣ,�ֹ��ݾ�
--create view v
--as select *
--from 
--where address like '���ѹα�';

SELECT	SUM(saleprice) "total"
FROM	Orders od
WHERE	EXISTS (SELECT  *
			 FROM	   Customer cs
			 WHERE	   address LIKE '%���ѹα�%' AND cs.custid=od.custid);

SELECT	(SELECT    name
	  	FROM	     Customer cs
		 	WHERE    cs.custid=od.custid) "name", SUM(saleprice) "total"
FROM	Orders od
GROUP BY	od.custid;

select count(*)
from employees
where commission_pct is null;

select *
from employees
where mod(employee_id,2)=1;

select last_name, hire_date,last_DAY(ADD_MONTHS(hire_date,1)) "�Ի� ������ ����"
from employees;

select hire_date,next_day(hire_date,'��') from employees;