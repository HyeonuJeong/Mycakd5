빅데이터 기반 AI 응용 솔루션 개발자 전문과정

교과목명 : 데이터베이스 구축 및 활용

- 평가일 : 22.02.25
- 성명 :  정현우
- 점수 : 83

--13 -2 15 -5 19 -5 20 -5
--※ HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)를 활용하여 다음 질문들을 수행하세요.
--Q1. HR EMPLOYEES 테이블에서 이름, 연봉, 10% 인상된 연봉을 출력하세요.
--A.
select last_name, salary, salary*1.1
from employees;
    
    
--Q2.  2005년 상반기에 입사한 사람들만 출력	
--A.        
select last_name,hire_date
from employees
where hire_date >='05/01/01' and hire_date <='05/06/30';


--Q3. 업무 SA_MAN, IT_PROG, ST_MAN 인 사람만 출력
--A.
select * from employees where JOB_ID in ('SA_MAN', 'IT_PROG', 'ST_MAN');
   
--Q4. manager_id 가 101에서 103인 사람만 출력
--A.   	
select * from employees where manager_id between 101 and 103;

--Q5. EMPLOYEES 테이블에서 LAST_NAME, HIRE_DATE 및 입사일의 6개월 후 첫 번째 월요일을 출력하세요.
--A.
select LAST_NAME, next_day(add_months(HIRE_DATE,6),'월')
from employees;


--Q6. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 현재일까지의 W_MONTH(근속월수)를 정수로 계산해서 출력하세요.(근속월수 기준 내림차순)
--A.
select EMPLoYEE_ID, LAST_NAME, SALARY, HIRE_DATE, trunc(months_between(sysdate,hire_date)) 근속월수
from employees
order by 근속월수 desc;

--Q7. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 W_YEAR(근속년수)를 계산해서 출력하세요.(근속년수 기준 내림차순)
--A.
select EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, trunc((sysdate-hire_date)/365) 근속년수
from employees
order by 근속년수 desc ;

--Q8. EMPLOYEE_ID가 홀수인 직원의 EMPLPYEE_ID와 LAST_NAME을 출력하세요.
--A. 
select employee_id,last_name
from employees
where mod(employee_id,2)=1;

--Q9. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME 및 M_SALARY(월급)을 출력하세요. 단 월급은 소수점 둘째자리까지만 표현하세요.
--A
select employee_id,last_name,round(salary/12,2) from employees;

--Q10. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 근속년수를 계산해서 아래사항을 추가한 후에 출력하세요.
--2001년 1월 1일 창업하여 현재까지 20년간 운영되온 회사는 직원의  근속년수에 따라 30 등급으로 나누어  등급에 따라 1000원의 BONUS를 지급.
--내림차순 정렬.    
--A.
select EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, width_bucket(trunc((sysdate-hire_date)/365),0,20,29) 등급, width_bucket(trunc((sysdate-hire_date)/365),0,20,29)*1000 보너스 
from employees;

--Q11. EMPLOYEES 테이블에서 commission_pct 의  Null값 갯수를  출력하세요.
--A.
select count(*)
from employees
where commission_pct is null;;

--Q12. EMPLOYEES 테이블에서 deparment_id 가 없는 직원을 추출하여  POSITION을 '신입'으로 출력하세요.
--A.
 
ALTER TABLE employees ADD position varchar2(20);

select department_id,NVL(position,'신입')
from employees
where department_id is null;

--Q13. 사번이 120번인 사람의 사번, 이름, 업무(job_id), 업무명(job_title)을 출력(join~on, where 로 조인하는 두 가지 방법 모두)
--A. 0.5개 틀림
select e.employee_id,e.last_name,e.job_id,j.job_title
from employees e, jobs j
where e.employee_id=120 and j.job_id=e.job_id;

select e.employee_id, e.last_name, j.job_id, j.job_title 
from employees e join jobs j  on e.job_id=j.job_id 
where employee_id=120;

--Q14.  employees 테이블에서 이름에 FIRST_NAME에 LAST_NAME을 붙여서 'NAME' 컬럼명으로 출력하세요.
--예) Steven King
--A. 


select concat(concat(first_name,' '),last_name) name
from employees;

--Q15. lmembers purprod 테이블로 부터 총구매액, 2014 구매액, 2015 구매액을 한번에 출력하세요.
--A.
select *
from purprod;

select (select sum(p1.구매금액) from purprod p1)  as amt,
(select sum(p2.구매금액) from purprod p2 where p2.구매일자 <20150101) as amt_2014,
(select sum(p3.구매금액) from purprod p3 where p3.구매일자 >20141231) as amt_2015
from dual;


--Q16. HR EMPLOYEES 테이블에서 escape 옵션을 사용하여 아래와 같이 출력되는 SQL문을 작성하세요.
--job_id 칼럼에서  _을 와일드카드가 아닌 문자로 취급하여 '_A'를 포함하는  모든 행을 출력
--A.
select job_id
from employees
where job_id like '%#_A%' escape '#';

--Q17. HR EMPLOYEES 테이블에서 SALARY, LAST_NAME 순으로 올림차순 정렬하여 출력하세요.
--A. 
select *
from employees
order by SALARY asc , LAST_NAME asc;

--Q18. Seo라는 사람의 부서명을 출력하세요.
--A.
select e.last_name,d.department_name
from employees e, departments d
where e.last_name='Seo' and e.department_id=d.department_id;

--Q19. LMEMBERS 데이터에서 고객별 구매금액의 합계를 구한 CUSPUR 테이블을 생성한 후 CUSTDEMO 테이블과 
--고객번호를 기준으로 결합하여 출력하세요.
--A.
CREATE TABLE CUSPUR
AS SELECT 고객번호, SUM(구매금액) 구매금액
FROM PURPROD
GROUP BY 고객번호
ORDER BY 고객번호;
SELECT * FROM CUSPUR;

--CUST와 CUSPUR 고객번호 기준 결합
SELECT C.*, CP.구매금액
FROM CUSTDEMO C, CUSPUR CP
WHERE C.고객번호 = CP.고객번호;


--Q20.PURPROD 테이블로 부터 아래 사항을 수행하세요.
-- 2년간 구매금액을 연간 단위로 분리하여 고객별, 제휴사별로 구매액을 표시하는 AMT_14, AMT_15 테이블 2개를 생성 (출력내용 : 고객번호, 제휴사, SUM(구매금액) 구매금액)
--AMT14와 AMT15 2개 테이블을 고객번호와 제휴사를 기준으로 FULL OUTER JOIN 적용하여 결합한 AMT_YEAR_FOJ 테이블 생성
--14년과 15년의 구매금액 차이를 표시하는 증감 컬럼을 추가하여 출력(단, 고객번호, 제휴사별로 구매금액 및 증감이 구분되어야 함)
--A.

SELECT * FROM PURPROD
WHERE YEAR <2015;
DESC PURPROD;

CREATE TABLE AMT14
AS SELECT 고객번호, 제휴사, SUM(구매금액) 구매금액 
FROM PURPROD
WHERE 구매일자 < 20150101
GROUP BY 고객번호, 제휴사
ORDER BY 고객번호;

select * from amt14;

CREATE TABLE AMT15
AS SELECT 고객번호, 제휴사, SUM(구매금액) 구매금액 
FROM PURPROD
WHERE 구매일자 > 20141231
GROUP BY 고객번호, 제휴사
ORDER BY 고객번호;

select * from amt15;

--FULL OUTER JOIN 테이블 생성
CREATE TABLE AMT_YEAR_FOJ
AS SELECT A4.고객번호, A4.제휴사, A4.구매금액 구매14, A5.구매금액 구매15
FROM AMT14 A4 FULL OUTER JOIN AMT15 A5
ON (A4.고객번호=A5.고객번호 AND A4.제휴사=A5.제휴사);

--FULL OUTER JOIN 적용시 증감 출력
SELECT 고객번호,제휴사, NVL(구매14,0) 구매14, NVL(구매15,0) 구매15,
(NVL(구매15,0)-NVL(구매14,0)) 증감
FROM AMT_YEAR_FOJ A;

DROP TABLE amt14;
DROP TABLE amt15;
DROP TABLE AMT_YEAR_FOJ;

--Q(BONUS). HR 테이블들을 분석해서 전체 현황을 설명할 수 있는 요약 테이블을 작성하세요. (예 : 부서별 평균 SALARY 순위)
--A.

--10년이상 장기 근속자
select EMPLOYEE_ID, LAST_NAME, HIRE_DATE, trunc((sysdate-hire_date)/365) 근속년수 
from employees
where trunc((sysdate-hire_date)/365)>=10;