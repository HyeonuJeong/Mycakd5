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


--INNER JOIN CID가 같은 값 출력
SELECT *
FROM CUSTOMER1 INNER JOIN ORDERS1 ON ORDERS1.CID = CUSTOMER1.CID;

--LEFT OUTER JOIN 왼쪽CID에 있는 값 출력
SELECT *
FROM CUSTOMER1 LEFT OUTER JOIN ORDERS1 ON ORDERS1.CID = CUSTOMER1.CID;

--RIGHT OUTER JOIN 오른쪽CID에 있는 값 출력
SELECT *
FROM CUSTOMER1 RIGHT OUTER JOIN ORDERS1 ON ORDERS1.CID = CUSTOMER1.CID;

--FULL OUTER JOIN 매칭 안되는 값들도 모두 출력
SELECT *
FROM CUSTOMER1 FULL OUTER JOIN ORDERS1 ON ORDERS1.CID = CUSTOMER1.CID;

--union 합집합
select cid from CUSTOMER1
union all
select cid from ORDERS1;


--intersect 교집합
select cid from CUSTOMER1
intersect
select cid from ORDERS1;

--minus 차집합
select cid from CUSTOMER1
minus
select cid from ORDERS1;


--과제
 --Q. HR EMPLOYEES 테이블에서 escape 옵션을 사용하여 아래와 같이 출력되는 SQL문을 작성하세요. 
select * from employees where job_id like '%!_A%' escape '!';

 --Q.  employees 테이블에서 이름에 FIRST_NAME에 LAST_NAME을 붙여서 'NAME' 컬럼명으로 출력하세요.
--예) Steven King
 select concat(concat(first_name,' '),last_name) name
 from employees;
 

--Q. Seo라는 사람의 부서명을 출력하세요.
select e.last_name, e.department_id, d.department_name
from employees e,departments d
where last_name='Seo' and e.department_id = d.department_id;

--Q. HR테이블을 분석해서 전체 현황을 설명 할 수 있는 요약 테이블 3개 작성하세요
--예) 부서별 연봉순위
SELECT e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e,  departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;


select e.last_name, d.department_name 
from employees e, departments d
where lower(e.last_name) = 'seo' and d.department_id=e.department_id;

--커미션을 받는 직원만
SELECT e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e,  departments d
WHERE e.department_id = d.department_id AND e.commission_pct IS NOT NULL;

-- 회계부서 직원목록 
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

select sum(구매금액), round(avg(구매금액))
from purprod
where year=2014;

select 고객번호
from purprod
where year=2014;

CREATE TABLE TFT AS
SELECT 고객번호, YEAR, SUM(구매금액) 구매합계,round(avg(구매금액)) 구매평균
FROM PURPROD
GROUP BY 고객번호, YEAR
ORDER BY 고객번호, YEAR;


select *
from tft ;


create table tru as 
select * from purprod;


--의식주 의
update tru set 대분류코드 = 101 
where 제휴사 = 'B' and 대분류코드 between 29 and 36
or 제휴사 = 'B' and 대분류코드 between 44 and 45
or 제휴사 = 'B' and 대분류코드 between 49 and 51
or 제휴사 = 'B' and 대분류코드 = 66
or 제휴사 = 'B' and 대분류코드 between 68 and 71
or 제휴사 = 'B' and 대분류코드 = 90; -- 521


-- 식
update tru set 대분류코드 = 102 
where 제휴사 = 'B' and 대분류코드 between 1 and 7
or 제휴사 = 'B' and 대분류코드 between 9 and 16
or 제휴사 = 'B' and 대분류코드 = 43
or 제휴사 = 'B' and 대분류코드 between 46 and 48
or 제휴사 = 'B' and 대분류코드 between 37 and 38
or 제휴사 = 'B' and 대분류코드 between 52 and 65
or 제휴사 = 'B' and 대분류코드 = 67
or 제휴사 = 'B' and 대분류코드 between 72 and 83
or 제휴사 = 'B' and 대분류코드 = 89
or 제휴사 = 'B' and 대분류코드 between 91 and 92; -- 1353

-- 주
update tru set 대분류코드 = 103
where 제휴사 = 'B' and 대분류코드 = 8
or 제휴사 = 'B' and 대분류코드 between 17 and 28
or 제휴사 = 'B' and 대분류코드 between 39 and 42
or 제휴사 = 'B' and 대분류코드 between 84 and 88; -- 750


-- 101,102,103을 보기 쉽게 의식주(1,2,3)순으로 한번더 업데이트
update tru set 대분류코드 = 1
where 제휴사 = 'B' and 대분류코드 = 101;

update tru set 대분류코드 = 2
where 제휴사 = 'B' and 대분류코드 = 102;

update tru set 대분류코드 = 3
where 제휴사 = 'B' and 대분류코드 = 103;
-- 1.2.3 으로 바꼈는지 한번더 확인


-- 의
update tru set 대분류코드 = 101
where 제휴사 = 'A' and 대분류코드 between 2 and 6
or 제휴사 = 'A' and 대분류코드 = 8;

-- 식
update tru set 대분류코드 = 102
where 제휴사 = 'A' and 대분류코드 =1; 


--제휴사A
-- 주
update tru set 대분류코드 = 103
where 제휴사 = 'A' and 대분류코드 = 7
or 제휴사 = 'A' and 대분류코드 = 9; 

-- 코드 1,2,3 으로 수정
update tru set 대분류코드 = 1
where 제휴사 = 'A' and 대분류코드 = 101;

update tru set 대분류코드 = 2
where 제휴사 = 'A' and 대분류코드 = 102;




-- 제휴사 C
-- 식
update tru set 대분류코드 = 102
where 제휴사 = 'C' and 대분류코드 between 1 and 15; 
--  8,354,801

-- 주
update tru set 대분류코드 = 103
where 제휴사 = 'C' and 대분류코드 between 16 and 17; -- 1,024,435

-- 코드 2,3 으로 수정
update tru set 대분류코드 = 2
where 제휴사 = 'C' and 대분류코드 = 102;

update tru set 대분류코드 = 3
where 제휴사 = 'C' and 대분류코드 = 103;

update tru set 대분류코드 = 3
where 제휴사 = 'A' and 대분류코드 = 103;


-- 제휴사 D
-- 식
update tru set 대분류코드 = 102
where 제휴사 = 'D' and 대분류코드 = 4 ; 

-- 주
update tru set 대분류코드 = 103
where 제휴사 = 'D' and 대분류코드 between 5 and 8
or 제휴사 = 'D' and 대분류코드 between 1 and 3; 

-- 코드 2,3 으로 수정
update tru set 대분류코드 = 2
where 제휴사 = 'D' and 대분류코드 = 102;

update tru set 대분류코드 = 3
where 제휴사 = 'D' and 대분류코드 = 103;

select * from tru where 제휴사='B';

