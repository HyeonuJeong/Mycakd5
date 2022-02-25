DROP TABLE CUSTOMER1;
DROP TABLE ORDERS1;

CREATE TABLE CUSTOMER1
(
CID       CHAR(3) PRIMARY KEY,
NAME     VARCHAR2(20) ,
PHONE     CHAR(13)
);

CREATE TABLE ORDERS1
(    
OID      VARCHAR(10) PRIMARY KEY,
PID      VARCHAR2(20),
CID       CHAR(3),
PDATE     DATE
);

SAVEPOINT SV1;
INSERT INTO CUSTOMER1 VALUES('111','KIM','010-1111-1111');
INSERT INTO CUSTOMER1 VALUES('222','LEE','010-2222-2222');
INSERT INTO CUSTOMER1 VALUES('333','PARK','010-3333-2222');
INSERT INTO CUSTOMER1 VALUES('444','CHOI','010-3333-4444');
INSERT INTO CUSTOMER1 VALUES('555','JUNG','010-5555-2222');
ROLLBACK TO SV1;
INSERT INTO CUSTOMER1 VALUES('111','KIM','010-1111-1111');
INSERT INTO CUSTOMER1 VALUES('222','LEE','010-2222-2222');
INSERT INTO CUSTOMER1 VALUES('333','PARK','010-3333-2222');
INSERT INTO CUSTOMER1 VALUES('444','CHOI','010-3333-4444');
INSERT INTO CUSTOMER1 VALUES('555','JUNG','010-5555-2222');


SAVEPOINT SV2;
INSERT INTO ORDERS1 VALUES('1','101','111','22/02/19');
INSERT INTO ORDERS1 VALUES('2','201','222','22/02/20');
INSERT INTO ORDERS1 VALUES('3','303','333','22/02/21');
INSERT INTO ORDERS1 VALUES('4','4O2','444','22/02/22');
INSERT INTO ORDERS1 VALUES('5','504','555','22/02/23');
ROLLBACK TO SV2;
INSERT INTO ORDERS1 VALUES('1','101','111','22/02/19');
INSERT INTO ORDERS1 VALUES('2','201','777','22/02/20');
INSERT INTO ORDERS1 VALUES('3','303','333','22/02/21');
INSERT INTO ORDERS1 VALUES('4','4O2','888','22/02/22');
INSERT INTO ORDERS1 VALUES('5','504','555','22/02/23');

ALTER TABLE CUSTOMER1 ADD PWD NUMBER;
ALTER TABLE CUSTOMER1 DROP COLUMN PWD;
ALTER TABLE ORDERS1 MODIFY(PID CHAR(3));
ALTER TABLE CUSTOMER1 RENAME COLUMN PHONE TO TEL;


commit;

SELECT * FROM ORDERS1;
SELECT * FROM CUSTOMER1;


--INNER JOIN CID�� ���� �� ���
SELECT *
FROM CUSTOMER1 INNER JOIN ORDERS1 ON ORDERS1.CID = CUSTOMER1.CID;

--LEFT OUTER JOIN ����CID�� �ִ� �� ���
SELECT *
FROM CUSTOMER1 LEFT OUTER JOIN ORDERS1 ON ORDERS1.CID = CUSTOMER1.CID;

--RIGHT OUTER JOIN ������CID�� �ִ� �� ���
SELECT *
FROM CUSTOMER1 RIGHT OUTER JOIN ORDERS1 ON ORDERS1.CID = CUSTOMER1.CID;

--FULL OUTER JOIN ��Ī �ȵǴ� ���鵵 ��� ���
SELECT *
FROM CUSTOMER1 FULL OUTER JOIN ORDERS1 ON ORDERS1.CID = CUSTOMER1.CID;

--union ������
select cid from CUSTOMER1
union all
select cid from ORDERS1;


--intersect ������
select cid from CUSTOMER1
intersect
select cid from ORDERS1;

--minus ������
select cid from CUSTOMER1
minus
select cid from ORDERS1;


--����
 --Q. HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���. 
select * from employees where job_id like '%!_A%' escape '!';

 --Q.  employees ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King
 select concat(concat(first_name,' '),last_name) name
 from employees;
 

--Q. Seo��� ����� �μ����� ����ϼ���.
select e.last_name, e.department_id, d.department_name
from employees e,departments d
where last_name='Seo' and e.department_id = d.department_id;

--Q. HR���̺��� �м��ؼ� ��ü ��Ȳ�� ���� �� �� �ִ� ��� ���̺� 3�� �ۼ��ϼ���
--��) �μ��� ��������
SELECT e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e,  departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;


select e.last_name, d.department_name 
from employees e, departments d
where lower(e.last_name) = 'seo' and d.department_id=e.department_id;

--Ŀ�̼��� �޴� ������
SELECT e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e,  departments d
WHERE e.department_id = d.department_id AND e.commission_pct IS NOT NULL;

-- ȸ��μ� ������� 
SELECT e.first_name, d.department_name
FROM employees e,  departments d
WHERE e.department_id = d.department_id AND d.department_name = INITCAP('ACCOUNTING');


select * from sample1;
select * from sample2;
select * from sample3;
desc sample3


desc PURPROD;
select * from PURPROD;

select YEAR 
from PURPROD
GROUP BY YEAR;

select column_name from user_tab_columns;

select sum(���űݾ�), round(avg(���űݾ�))
from purprod
where year=2014;

select ����ȣ
from purprod
where year=2014;

CREATE TABLE TFT AS
SELECT ����ȣ, YEAR, SUM(���űݾ�) �����հ�,round(avg(���űݾ�)) �������
FROM PURPROD
GROUP BY ����ȣ, YEAR
ORDER BY ����ȣ, YEAR;


select *
from tft ;


create table tru as 
select * from purprod;


--�ǽ��� ��
update tru set ��з��ڵ� = 101 
where ���޻� = 'B' and ��з��ڵ� between 29 and 36
or ���޻� = 'B' and ��з��ڵ� between 44 and 45
or ���޻� = 'B' and ��з��ڵ� between 49 and 51
or ���޻� = 'B' and ��з��ڵ� = 66
or ���޻� = 'B' and ��з��ڵ� between 68 and 71
or ���޻� = 'B' and ��з��ڵ� = 90; -- 521


-- ��
update tru set ��з��ڵ� = 102 
where ���޻� = 'B' and ��з��ڵ� between 1 and 7
or ���޻� = 'B' and ��з��ڵ� between 9 and 16
or ���޻� = 'B' and ��з��ڵ� = 43
or ���޻� = 'B' and ��з��ڵ� between 46 and 48
or ���޻� = 'B' and ��з��ڵ� between 37 and 38
or ���޻� = 'B' and ��з��ڵ� between 52 and 65
or ���޻� = 'B' and ��з��ڵ� = 67
or ���޻� = 'B' and ��з��ڵ� between 72 and 83
or ���޻� = 'B' and ��з��ڵ� = 89
or ���޻� = 'B' and ��з��ڵ� between 91 and 92; -- 1353

-- ��
update tru set ��з��ڵ� = 103
where ���޻� = 'B' and ��з��ڵ� = 8
or ���޻� = 'B' and ��з��ڵ� between 17 and 28
or ���޻� = 'B' and ��з��ڵ� between 39 and 42
or ���޻� = 'B' and ��з��ڵ� between 84 and 88; -- 750


-- 101,102,103�� ���� ���� �ǽ���(1,2,3)������ �ѹ��� ������Ʈ
update tru set ��з��ڵ� = 1
where ���޻� = 'B' and ��з��ڵ� = 101;

update tru set ��з��ڵ� = 2
where ���޻� = 'B' and ��з��ڵ� = 102;

update tru set ��з��ڵ� = 3
where ���޻� = 'B' and ��з��ڵ� = 103;
-- 1.2.3 ���� �ٲ����� �ѹ��� Ȯ��


-- ��
update tru set ��з��ڵ� = 101
where ���޻� = 'A' and ��з��ڵ� between 2 and 6
or ���޻� = 'A' and ��з��ڵ� = 8;

-- ��
update tru set ��з��ڵ� = 102
where ���޻� = 'A' and ��з��ڵ� =1; 


--���޻�A
-- ��
update tru set ��з��ڵ� = 103
where ���޻� = 'A' and ��з��ڵ� = 7
or ���޻� = 'A' and ��з��ڵ� = 9; 

-- �ڵ� 1,2,3 ���� ����
update tru set ��з��ڵ� = 1
where ���޻� = 'A' and ��з��ڵ� = 101;

update tru set ��з��ڵ� = 2
where ���޻� = 'A' and ��з��ڵ� = 102;




-- ���޻� C
-- ��
update tru set ��з��ڵ� = 102
where ���޻� = 'C' and ��з��ڵ� between 1 and 15; 
--  8,354,801

-- ��
update tru set ��з��ڵ� = 103
where ���޻� = 'C' and ��з��ڵ� between 16 and 17; -- 1,024,435

-- �ڵ� 2,3 ���� ����
update tru set ��з��ڵ� = 2
where ���޻� = 'C' and ��з��ڵ� = 102;

update tru set ��з��ڵ� = 3
where ���޻� = 'C' and ��з��ڵ� = 103;

update tru set ��з��ڵ� = 3
where ���޻� = 'A' and ��з��ڵ� = 103;


-- ���޻� D
-- ��
update tru set ��з��ڵ� = 102
where ���޻� = 'D' and ��з��ڵ� = 4 ; 

-- ��
update tru set ��з��ڵ� = 103
where ���޻� = 'D' and ��з��ڵ� between 5 and 8
or ���޻� = 'D' and ��з��ڵ� between 1 and 3; 

-- �ڵ� 2,3 ���� ����
update tru set ��з��ڵ� = 2
where ���޻� = 'D' and ��з��ڵ� = 102;

update tru set ��з��ڵ� = 3
where ���޻� = 'D' and ��з��ڵ� = 103;

select * from tru where ���޻�='B';

