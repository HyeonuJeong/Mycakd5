--2014 ~ 2015년 사이의 4개 회사 구매 데이터
SELECT COUNT(*) FROM PURPROD;
--고객 속성정보 : 19383명(고객수)
SELECT * FROM CUSTDEMO;
SELECT COUNT(*) FROM custdemo;
SELECT * FROM COMPET;
SELECT * FROM CHANNEL;
SELECT * FROM MEMBERSHIP;
SELECT * FROM PRODCL;
SELECT * FROM PURPROD;

--# 구매 분석(매출 분석)
SELECT YEAR, ROUND(SUM(구매금액)/1000000) 총구매액, ROUND(AVG(구매금액)) 평균구매액
FROM PURPROD
GROUP BY YEAR;

--# 고객 속성
--성별, 연령별, 거주지별,다양한 조합별 매출 변화 
--경쟁사 이용, 멤버십 이용, 온라인 채널에 대한 매출 특이성

--# 고객 구매행동 패턴의 변화
--다양한 고객 유형별 구매 증감, 상품 구매 패턴, 구매 형태(시간, 장소 등)

--# 유통 환경에 대한 이해(도매인)

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR=substr(구매일자,1,4);

ALTER TABLE PURPROD ADD 반기 varchar2 (10);
UPDATE PURPROD SET 반기=(CASE WHEN substr(구매일자,1,6)<201407  THEN '14ss'
        WHEN substr(구매일자,1,6)<201501  THEN '14fw'
        WHEN substr(구매일자,1,6)<201507  THEN '15ss'
        ELSE '15fw'
    END);
COMMIT;

CREATE TABLE onlyb AS
SELECT * FROM PURPROD
where 제휴사='B';



SELECT * FROM onlyb;

--분류코드별 
SELECT 고객번호,소분류코드,count(구매일자) 구매횟수 ,sum(구매금액) 총구매액 FROM onlyb
group by 소분류코드,고객번호
order by 소분류코드;



drop table halfyear;
CREATE TABLE halfyear AS
select 고객번호,반기, count(구매일자) 구매횟수 ,sum(구매금액) 총구매액
from onlyb
group by 고객번호,반기
order by 고객번호;

SELECT * FROM halfyear;

--반기별 구매횟수 및 구매금액
--횟수는 늘었으나 구매액은 줄어듬 이슈발생?
select * from onlyb;
SELECT year, count(구매일자) 구매횟수 ,sum(구매금액) 구매금액
FROM onlyb
group by year;

-- 이슈가 아닌거같다. 이슈close
SELECT 반기,sum(구매횟수),sum(총구매액) FROM halfyear
group by 반기;

SELECT 고객번호,반기,sum(구매횟수),sum(총구매액) FROM halfyear
group by 반기,고객번호;

-- 품목별  구매횟수 및 구매금액 
SELECT 소분류코드,count(구매일자) 구매횟수 ,sum(구매금액) 구매금액
FROM onlyb
group by 소분류코드
order by 소분류코드;




select * from demo order by 고객번호;


CREATE TABLE PURBYYEAR AS
SELECT 고객번호, YEAR, SUM(구매금액) 구매액
FROM PURPROD
GROUP BY 고객번호, YEAR
ORDER BY 고객번호;

SELECT * FROM PURBYYEAR;



select * from comp;

CREATE TABLE pur_amt AS
SELECT 고객번호 cusno, sum(구매금액) puramt
FROM PURPROD
GROUP BY 고객번호 
ORDER BY 고객번호; 


