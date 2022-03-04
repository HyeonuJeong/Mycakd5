������ ��� AI ���� �ַ�� ������ ��������

������� : �����ͺ��̽� ���� �� Ȱ��

- ���� : 22.02.25
- ���� :  ������
- ���� : 83

--13 -2 15 -5 19 -5 20 -5
--�� HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)�� Ȱ���Ͽ� ���� �������� �����ϼ���.
--Q1. HR EMPLOYEES ���̺��� �̸�, ����, 10% �λ�� ������ ����ϼ���.
--A.
select last_name, salary, salary*1.1
from employees;
    
    
--Q2.  2005�� ��ݱ⿡ �Ի��� ����鸸 ���	
--A.        
select last_name,hire_date
from employees
where hire_date >='05/01/01' and hire_date <='05/06/30';


--Q3. ���� SA_MAN, IT_PROG, ST_MAN �� ����� ���
--A.
select * from employees where JOB_ID in ('SA_MAN', 'IT_PROG', 'ST_MAN');
   
--Q4. manager_id �� 101���� 103�� ����� ���
--A.   	
select * from employees where manager_id between 101 and 103;

--Q5. EMPLOYEES ���̺��� LAST_NAME, HIRE_DATE �� �Ի����� 6���� �� ù ��° �������� ����ϼ���.
--A.
select LAST_NAME, next_day(add_months(HIRE_DATE,6),'��')
from employees;


--Q6. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �����ϱ����� W_MONTH(�ټӿ���)�� ������ ����ؼ� ����ϼ���.(�ټӿ��� ���� ��������)
--A.
select EMPLoYEE_ID, LAST_NAME, SALARY, HIRE_DATE, trunc(months_between(sysdate,hire_date)) �ټӿ���
from employees
order by �ټӿ��� desc;

--Q7. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_YEAR(�ټӳ��)�� ����ؼ� ����ϼ���.(�ټӳ�� ���� ��������)
--A.
select EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, trunc((sysdate-hire_date)/365) �ټӳ��
from employees
order by �ټӳ�� desc ;

--Q8. EMPLOYEE_ID�� Ȧ���� ������ EMPLPYEE_ID�� LAST_NAME�� ����ϼ���.
--A. 
select employee_id,last_name
from employees
where mod(employee_id,2)=1;

--Q9. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME �� M_SALARY(����)�� ����ϼ���. �� ������ �Ҽ��� ��°�ڸ������� ǥ���ϼ���.
--A
select employee_id,last_name,round(salary/12,2) from employees;

--Q10. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �ټӳ���� ����ؼ� �Ʒ������� �߰��� �Ŀ� ����ϼ���.
--2001�� 1�� 1�� â���Ͽ� ������� 20�Ⱓ ��ǿ� ȸ��� ������  �ټӳ���� ���� 30 ������� ������  ��޿� ���� 1000���� BONUS�� ����.
--�������� ����.    
--A.
select EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, width_bucket(trunc((sysdate-hire_date)/365),0,20,29) ���, width_bucket(trunc((sysdate-hire_date)/365),0,20,29)*1000 ���ʽ� 
from employees;

--Q11. EMPLOYEES ���̺��� commission_pct ��  Null�� ������  ����ϼ���.
--A.
select count(*)
from employees
where commission_pct is null;;

--Q12. EMPLOYEES ���̺��� deparment_id �� ���� ������ �����Ͽ�  POSITION�� '����'���� ����ϼ���.
--A.
 
ALTER TABLE employees ADD position varchar2(20);

select department_id,NVL(position,'����')
from employees
where department_id is null;

--Q13. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���(join~on, where �� �����ϴ� �� ���� ��� ���)
--A. 0.5�� Ʋ��
select e.employee_id,e.last_name,e.job_id,j.job_title
from employees e, jobs j
where e.employee_id=120 and j.job_id=e.job_id;

select e.employee_id, e.last_name, j.job_id, j.job_title 
from employees e join jobs j  on e.job_id=j.job_id 
where employee_id=120;

--Q14.  employees ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King
--A. 


select concat(concat(first_name,' '),last_name) name
from employees;

--Q15. lmembers purprod ���̺�� ���� �ѱ��ž�, 2014 ���ž�, 2015 ���ž��� �ѹ��� ����ϼ���.
--A.
select *
from purprod;

select (select sum(p1.���űݾ�) from purprod p1)  as amt,
(select sum(p2.���űݾ�) from purprod p2 where p2.�������� <20150101) as amt_2014,
(select sum(p3.���űݾ�) from purprod p3 where p3.�������� >20141231) as amt_2015
from dual;


--Q16. HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���.
--job_id Į������  _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ�  ��� ���� ���
--A.
select job_id
from employees
where job_id like '%#_A%' escape '#';

--Q17. HR EMPLOYEES ���̺��� SALARY, LAST_NAME ������ �ø����� �����Ͽ� ����ϼ���.
--A. 
select *
from employees
order by SALARY asc , LAST_NAME asc;

--Q18. Seo��� ����� �μ����� ����ϼ���.
--A.
select e.last_name,d.department_name
from employees e, departments d
where e.last_name='Seo' and e.department_id=d.department_id;

--Q19. LMEMBERS �����Ϳ��� ���� ���űݾ��� �հ踦 ���� CUSPUR ���̺��� ������ �� CUSTDEMO ���̺�� 
--����ȣ�� �������� �����Ͽ� ����ϼ���.
--A.
CREATE TABLE CUSPUR
AS SELECT ����ȣ, SUM(���űݾ�) ���űݾ�
FROM PURPROD
GROUP BY ����ȣ
ORDER BY ����ȣ;
SELECT * FROM CUSPUR;

--CUST�� CUSPUR ����ȣ ���� ����
SELECT C.*, CP.���űݾ�
FROM CUSTDEMO C, CUSPUR CP
WHERE C.����ȣ = CP.����ȣ;


--Q20.PURPROD ���̺�� ���� �Ʒ� ������ �����ϼ���.
-- 2�Ⱓ ���űݾ��� ���� ������ �и��Ͽ� ����, ���޻纰�� ���ž��� ǥ���ϴ� AMT_14, AMT_15 ���̺� 2���� ���� (��³��� : ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ�)
--AMT14�� AMT15 2�� ���̺��� ����ȣ�� ���޻縦 �������� FULL OUTER JOIN �����Ͽ� ������ AMT_YEAR_FOJ ���̺� ����
--14��� 15���� ���űݾ� ���̸� ǥ���ϴ� ���� �÷��� �߰��Ͽ� ���(��, ����ȣ, ���޻纰�� ���űݾ� �� ������ ���еǾ�� ��)
--A.

SELECT * FROM PURPROD
WHERE YEAR <2015;
DESC PURPROD;

CREATE TABLE AMT14
AS SELECT ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ� 
FROM PURPROD
WHERE �������� < 20150101
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;

select * from amt14;

CREATE TABLE AMT15
AS SELECT ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ� 
FROM PURPROD
WHERE �������� > 20141231
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;

select * from amt15;

--FULL OUTER JOIN ���̺� ����
CREATE TABLE AMT_YEAR_FOJ
AS SELECT A4.����ȣ, A4.���޻�, A4.���űݾ� ����14, A5.���űݾ� ����15
FROM AMT14 A4 FULL OUTER JOIN AMT15 A5
ON (A4.����ȣ=A5.����ȣ AND A4.���޻�=A5.���޻�);

--FULL OUTER JOIN ����� ���� ���
SELECT ����ȣ,���޻�, NVL(����14,0) ����14, NVL(����15,0) ����15,
(NVL(����15,0)-NVL(����14,0)) ����
FROM AMT_YEAR_FOJ A;

DROP TABLE amt14;
DROP TABLE amt15;
DROP TABLE AMT_YEAR_FOJ;

--Q(BONUS). HR ���̺���� �м��ؼ� ��ü ��Ȳ�� ������ �� �ִ� ��� ���̺��� �ۼ��ϼ���. (�� : �μ��� ��� SALARY ����)
--A.

--10���̻� ��� �ټ���
select EMPLOYEE_ID, LAST_NAME, HIRE_DATE, trunc((sysdate-hire_date)/365) �ټӳ�� 
from employees
where trunc((sysdate-hire_date)/365)>=10;