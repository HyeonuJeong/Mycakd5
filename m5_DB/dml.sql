select * from employees where job_id like '%\_A%' escape '\';
select * from employees where job_id like '%#_A%' escape '#';

--in > or 대신사용
select * from employees where manager_id =101 or manager_id =102 or manager_id =103;
select * from employees where manager_id in (101,102,103);


--between and : and 대신사용, 미만, 초과와 같이 포함하지 않는 경우 and를 사용
select * from employees where manager_id =101 and manager_id =102 and manager_id =103;
select * from employees where manager_id between 101 and 103;

-- is null/ is not null
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--주요함수
--mod
select * from employees where mod(employee_id,2)=1;
select * from employees where mod(employee_id,2)=0;
select mod(10,3) from dual;

--round()
select round(355.9555) from dual;
select round(355.9555,2) from dual;
select round(355.9555,-1) from dual;
select round(355.9555,0) from dual;

--trunc() 반올림이 아니라 뒷자리 버리기
select trunc(45.5555,1) from dual;
select last_name, trunc(salary/12,2) from employees;


--날짜 함수
select sysdate from dual;
select sysdate+1 from dual;
select last_name,round((sysdate - hire_date)) from employees; -- 근속일수
select last_name,trunc((sysdate - hire_date)/365) from employees; -- 근속년수 만으로 채워야하니 trunc
select last_name, hire_date,add_months(hire_date,6) from employees;
select last_day(sysdate) from dual; -- 달의 마지막날  출력
select hire_date, next_day(hire_date,'월') from employees; -- 다음 월요일
select sysdate, next_day(sysdate,'금요일') from dual;


--months_between()
select last_name, sysdate,hire_date,trunc(months_between(sysdate,hire_date)) 근속개월 from employees;

--형변환 함수
-- number character date
--to_date() 문자열을 날짜로
-- to_number to_character to_date
select last_name, months_between('2012/12/31', hire_date) from employees;
select trunc(sysdate - to_date('2018/11/18')) from dual;

-- employees 테이블에 있는직원들(사번,이름)에 대하여 현재 기준으로 근속연수
select employee_id, last_name,trunc((sysdate - hire_date)/365) 근속연수 from employees;


select to_date('20210101'),
to_char(to_date('20210101'),'MonthDD YYYY',
'NLS_DATE_LANGUAGE=english') as format1 from dual;

select to_char(sysdate, ' yy/mm/dd hh24:mi:ss') from dual;
select to_char(sysdate, ' yy/mm/dd') from dual;
select to_char(sysdate, ' yyyy-mm-dd') from dual;
select to_char(sysdate, ' hh24 : mi : ss') from dual;
select to_char(sysdate, 'day') from dual;


--to_char
--9 한자리 숫자 표현
--0 숫자표현, 앞자리수 유지
--$ 달러기호
--. 소수점을 표시
--, 특정위치에 표시
--MI 오른쪽에 ? 기호 표시
--PR 음수값을 <>FH VYGUS
--EEEE 과학적 표현
--공백을 0으로 표현
--L 지역통화

select salary, to_char(salary, '009999') from employees;
select to_char(-salary, '009999PR') from employees;
select to_char(1111, '99.99EEEE') from DUAL;
select to_char(1111, 'B9999.99') from dual;
select to_char(1111, 'L9999.99') from dual;

--width_bucket() 지정값, 최소값, 최대값, bucket 개수
select width_bucket(92,0,100,10) from dual;
select last_name,salary,width_bucket(salary,0,20000,4) from employees;


select employee_id, last_name,salary,
trunc((sysdate - hire_date)/365) 근속연수,
width_bucket(trunc((sysdate - hire_date)/365),0,20,29) 등급
from employees;


DESC BOOK;
SELECT * FROM BOOK;
SELECT BOOKNAME,PRICE FROM BOOK;
SELECT PUBLISHER FROM BOOK;
SELECT DISTINCT PUBLISHER FROM BOOK;
SELECT * 
FROM BOOK
WHERE PRICE < 10000;
--Q. 가격이 10000원 이상 20000원 이하인 도서를 검색하세요.
SELECT * FROM BOOK WHERE 10000 <= PRICE AND PRICE <= 20000;
--Q. 출판사가 굿스포츠, 혹은 대한미디어인 도서를 검색하세요.
SELECT * FROM BOOK WHERE PUBLISHER = '굿스포츠' OR PUBLISHER = '대한미디어';
SELECT * FROM BOOK WHERE PUBLISHER IN ('굿스포츠','대한미디어');
--Q. 출판사가 굿스포츠, 혹은 대한미디어가 아닌 도서를 검색하세요.
SELECT * FROM BOOK WHERE PUBLISHER NOT IN ('굿스포츠','대한미디어');
--Q. 도서이름에 축구가 포함된 출판사를 검색하세요.
select PUBLISHER from BOOK where BOOKNAME like '%축구%';
select * from BOOK where BOOKNAME like '%축구%';
--[과제] 도서이름의 왼쪽 두 번째 위치에 구라는 문자열을 갖는 도서를 검색하세요.
-- _은 특정 위치의 한개의 문자와 일치
-- %은 0개 이상의 문자와 일치
SELECT BOOKNAME,PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE'_구%';
--[과제] 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하세요.
SELECT * 
FROM BOOK
WHERE BOOKNAME LIKE '%축구%' AND PRICE >= 20000;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME DESC;

--Q. 도서를 가격순으로 검색하고 가격이 같으면 이름순으로 검색하세요.
SELECT * FROM BOOK ORDER BY PRICE,BOOKNAME;
--Q. 도서를 가격의 내림차순으로 검색하고 만약 가격이 같다면 출판사의 오름차순으로 출력하세요.
select * from book
order by price Desc,publisher;

SELECT * FROM ORDERS;
SELECT SUM(SALEPRICE)
FROM ORDERS;

SELECT SUM(SALEPRICE) AS "총매출"
FROM ORDERS;

--Q.CUSTID 가 2번인 고객이 주문한 도서의 총판매액을 구하세요.
select sum(SALEPRICE) AS "총 판매액" from ORDERS where CUSTID=2;
SELECT SUM(SALEPRICE) AS TOTAL,
AVG(SALEPRICE) AS AVERAGE,
MIN(SALEPRICE) AS MINIMUM,
MAX(SALEPRICE) AS MAXIMUM
FROM ORDERS;

SELECT COUNT(*) FROM ORDERS;

--Q. CUSTID별 도서수량과 총판매액을 출력하세요.
SELECT CUSTID, COUNT(*) AS 도서수량, SUM(SALEPRICE) AS "총 판매액"
FROM ORDERS
GROUP BY CUSTID;

--Q. 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하세요. 단 두권 이상 구매한 고객에 한정함
SELECT CUSTID, COUNT(*) AS 도서수량
FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;

SELECT * FROM CUSTOMER;

SELECT * 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.CUSTID;

--Q. 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객이름별로 정렬하세요.
SELECT NAME, SUM(SALEPRICE)
FROM CUSTOMER,ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME
ORDER BY CUSTOMER.NAME;

--Q. 고객의 이름과 고객이 주문한 도서의 이름을 구하세요.
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM CUSTOMER,ORDERS,BOOK
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND ORDERS.BOOKID= BOOK.BOOKID;

SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C,ORDERS O,BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID= B.BOOKID;

--[과제] 가격이 20,000인 도서를 주문한 고객의 이름과 도서의 이름을 구하세요.
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE
FROM BOOK B, CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND O.BOOKID=B.BOOKID AND B.PRICE=20000;

--[과제] 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하세요.
--outer join 조인조건을 만족하지 못하더라도 해당 행을 나타냄
SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+);
--[과제] 가장 비싼 도서의 이름을 출력하세요.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE=(SELECT MAX(PRICE) FROM BOOK);
SELECT * FROM BOOK;

--[과제] 도서를 구매한 적이 있는 고객의 이름을 검색하세요.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
--[과제] 대한미디어에서 출판한 도서를 구매한 고객의 이름을 출력하세요.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS
WHERE BOOKID IN (SELECT BOOKID FROM BOOK
WHERE PUBLISHER = '대한미디어'));

--q. 출판사 별로 출판사의 평균도서 가격보다 비싼도서
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

-- 질의 3-47 Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.
UPDATE Customer
SET address='대한민국 부산'
WHERE custid=5;

-- 질의 3-48 Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
UPDATE Customer
SET address = (SELECT address
	FROM Customer
	WHERE name='김연아')
WHERE name='박세리';

-- 질의 3-49 Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE
FROM Customer
WHERE custid=5;

-- 질의 3-50 모든 고객을 삭제하여라.
DELETE
FROM Customer;

-- 고객별 평균 주문금액을 백원 단위로 반올림 한 값
SELECT	custid "고객번호", ROUND(SUM(saleprice)/COUNT(*), -2) "평균금액"
FROM	Orders
GROUP BY	custid;

-- [질의 4-4] 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.
SELECT	bookid, REPLACE(bookname, '야구', '농구') bookname, publisher, price
FROM	Book;

-- [질의 4-5] 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수, 바이트 수를 보이시오.
SELECT 	bookname "제목", LENGTH(bookname) "글자수",	LENGTHB(bookname) "바이트수"
FROM 	Book
WHERE 	publisher='굿스포츠';

select * from customer;
INSERT INTO customer VALUES(5, '박세리', '대전', null);

select * from customer;

select SUBSTR(name,1,1) 성, count(*) 인원수
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
where customer.address like '%대한민국%';
SELECT	SUM(saleprice)
FROM	orders
WHERE	orders.custid in (SELECT customer.custid
			   FROM	customer
			   WHERE customer.address LIKE '%대한민국%');

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
where address like '대한민국';

--고객번호, 주문번호,주문금액
--create view v
--as select *
--from 
--where address like '대한민국';

SELECT	SUM(saleprice) "total"
FROM	Orders od
WHERE	EXISTS (SELECT  *
			 FROM	   Customer cs
			 WHERE	   address LIKE '%대한민국%' AND cs.custid=od.custid);

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

select last_name, hire_date,last_DAY(ADD_MONTHS(hire_date,1)) "입사 다음달 말일"
from employees;

select hire_date,next_day(hire_date,'월') from employees;

--select last_name, TRUNC(moths_between(sysdate,hire_date),0), round(months_between(sysdate,hire_date),0)

select last_name, NEXT_DAY(ADD_MONTHS(hire_date,6),'월요일') "6개월 뒤 첫 월요일"
from employees;

select job_id from employees;

select job_id,sum(salary) 연봉총합,max(salary) 최고연봉 ,min(salary) 최저연봉 
, floor(avg(salary)) 평균연봉 
from employees


select job_id,sum(salary) 연봉총합,max(salary) 최고연봉 ,min(salary) 최저연봉 
, floor(avg(salary)) 평균연봉 
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

select e.employee_id 사번,e.last_name, e.job_id,j.job_title
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

-- 2005년 이후 입사한 직원 
SELECT employee_id , last_name , hire_date,department_name , job_title
FROM employees e, departments d, jobs j
WHERE e.department_id=d.department_id AND e.job_id=j.job_id and hire_date>='2005/01/01';

--평균급여보다 높은 직원
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
    when salary > 20000 then '대표이사'
    when salary > 15000 then '이사'
    when salary > 10000 then '부장'
    when salary > 5000 then '대리'
    else '사원'
end as 직급
from employees;
