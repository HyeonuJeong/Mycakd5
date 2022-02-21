select * from employees where job_id like '%\_A%' escape '\';
select * from employees where job_id like '%#_A%' escape '#';

--in > or ��Ż��
select * from employees where manager_id =101 or manager_id =102 or manager_id =103;
select * from employees where manager_id in (101,102,103);


--between and : and ��Ż��, �̸�, �ʰ��� ���� �������� �ʴ� ��� and�� ���
select * from employees where manager_id =101 and manager_id =102 and manager_id =103;
select * from employees where manager_id between 101 and 103;

-- is null/ is not null
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--�ֿ��Լ�
--mod
select * from employees where mod(employee_id,2)=1;
select * from employees where mod(employee_id,2)=0;
select mod(10,3) from dual;

--round()
select round(355.9555) from dual;
select round(355.9555,2) from dual;
select round(355.9555,-1) from dual;
select round(355.9555,0) from dual;

--trunc() �ݿø��� �ƴ϶� ���ڸ� ������
select trunc(45.5555,1) from dual;
select last_name, trunc(salary/12,2) from employees;


--��¥ �Լ�
select sysdate from dual;
select sysdate+1 from dual;
select last_name,round((sysdate - hire_date)) from employees; -- �ټ��ϼ�
select last_name,trunc((sysdate - hire_date)/365) from employees; -- �ټӳ�� ������ ä�����ϴ� trunc
select last_name, hire_date,add_months(hire_date,6) from employees;
select last_day(sysdate) from dual; -- ���� ��������  ���
select hire_date, next_day(hire_date,'��') from employees; -- ���� ������
select sysdate, next_day(sysdate,'�ݿ���') from dual;


--months_between()
select last_name, sysdate,hire_date,trunc(months_between(sysdate,hire_date)) �ټӰ��� from employees;

--����ȯ �Լ�
-- number character date
--to_date() ���ڿ��� ��¥��
-- to_number to_character to_date
select last_name, months_between('2012/12/31', hire_date) from employees;
select trunc(sysdate - to_date('2018/11/18')) from dual;

-- employees ���̺� �ִ�������(���,�̸�)�� ���Ͽ� ���� �������� �ټӿ���
select employee_id, last_name,trunc((sysdate - hire_date)/365) �ټӿ��� from employees;


select to_date('20210101'),
to_char(to_date('20210101'),'MonthDD YYYY',
'NLS_DATE_LANGUAGE=english') as format1 from dual;

select to_char(sysdate, ' yy/mm/dd hh24:mi:ss') from dual;
select to_char(sysdate, ' yy/mm/dd') from dual;
select to_char(sysdate, ' yyyy-mm-dd') from dual;
select to_char(sysdate, ' hh24 : mi : ss') from dual;
select to_char(sysdate, 'day') from dual;


--to_char
--9 ���ڸ� ���� ǥ��
--0 ����ǥ��, ���ڸ��� ����
--$ �޷���ȣ
--. �Ҽ����� ǥ��
--, Ư����ġ�� ǥ��
--MI �����ʿ� ? ��ȣ ǥ��
--PR �������� <>FH VYGUS
--EEEE ������ ǥ��
--������ 0���� ǥ��
--L ������ȭ

select salary, to_char(salary, '009999') from employees;
select to_char(-salary, '009999PR') from employees;
select to_char(1111, '99.99EEEE') from DUAL;
select to_char(1111, 'B9999.99') from dual;
select to_char(1111, 'L9999.99') from dual;

--width_bucket() ������, �ּҰ�, �ִ밪, bucket ����
select width_bucket(92,0,100,10) from dual;
select last_name,salary,width_bucket(salary,0,20000,4) from employees;


select employee_id, last_name,salary,
trunc((sysdate - hire_date)/365) �ټӿ���,
width_bucket(trunc((sysdate - hire_date)/365),0,20,29) ���
from employees;


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

--select last_name, TRUNC(moths_between(sysdate,hire_date),0), round(months_between(sysdate,hire_date),0)

select last_name, NEXT_DAY(ADD_MONTHS(hire_date,6),'������') "6���� �� ù ������"
from employees;

select job_id from employees;

select job_id,sum(salary) ��������,max(salary) �ְ��� ,min(salary) �������� 
, floor(avg(salary)) ��տ��� 
from employees


select job_id,sum(salary) ��������,max(salary) �ְ��� ,min(salary) �������� 
, floor(avg(salary)) ��տ��� 
from employees
group by job_id
having avg(salary) >=5000;
order by job_id desc;




select last_name, salary
from employees
where last_name like '%l%';

select job_id,hire_date
from employees
where job_id like '%PROG%';

select *
from employees
where salary>=10000 and manager_id=100;

select salay
from employees
where department_id <100;

select job_id
from employees
where department_id=101 or department_id=103;



select *
from employees;

select * from departments;

select employee_id, department_name
from employees e, departments d
where e.department_id = d.department_id and e.employee_id=110;


select employee_id, department_name
from employees e
join departments d on e.department_id = d.department_id
where employee_id=110;

select e.employee_id ���,e.last_name, e.job_id,j.job_title
from employees e ,jobs j
where employee_id=120 and e.job_id=j.job_id;

select employee_id ,concat(concat(first_name,' ') ,last_name) ,j.job_id,job_title
from employees e
join jobs j on e.job_id = j.job_id
where employee_id=120;

select concat(concat(a.first_name,' '),a.last_name), a.salary
from employees a
where a.salary > 
(
select max(b.salary)
from employees b
where b.department_id=100
);

SELECT employee_id , last_name , department_name , job_title
FROM employees e, departments d, jobs j
WHERE e.department_id=d.department_id AND e.job_id=j.job_id;


SELECT employee_id , last_name , department_name , job_title
FROM employees e

join departments d
on e.department_id = d.department_id

join jobs j
on e.job_id = j.job_id;

SELECT e.employee_id , e.last_name , m.last_name , m.manager_id
FROM employees e, employees m
where e.employee_id=m.manager_id;

SELECT e.employee_id , e.last_name , m.last_name , m.manager_id
FROM employees e, employees m
where e.employee_id=m.manager_id(+);

-- 2005�� ���� �Ի��� ���� 
SELECT employee_id , last_name , hire_date,department_name , job_title
FROM employees e, departments d, jobs j
WHERE e.department_id=d.department_id AND e.job_id=j.job_id and hire_date>='2005/01/01';

--��ձ޿����� ���� ����
select salary, last_name
from employees
where salary > (
select avg(b.salary)
from employees b  
);

--lastname king
SELECT last_name , hire_date , department_id
FROM employees
where last_name like 'King';

select employee_id, last_name,
case
    when salary > 20000 then '��ǥ�̻�'
    when salary > 15000 then '�̻�'
    when salary > 10000 then '����'
    when salary > 5000 then '�븮'
    else '���'
end as ����
from employees;
