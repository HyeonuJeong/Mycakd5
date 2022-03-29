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

ALTER TABLE PURPROD ADD 분기 varchar2 (10);
UPDATE PURPROD SET 분기=(CASE WHEN substr(구매일자,1,6)<201404  THEN '14_1'
        WHEN substr(구매일자,1,6)<201407  THEN '14_2'
        WHEN substr(구매일자,1,6)<201410  THEN '14_3'
        WHEN substr(구매일자,1,6)<201501  THEN '14_4'
        WHEN substr(구매일자,1,6)<201504  THEN '15_1'
        WHEN substr(구매일자,1,6)<201507  THEN '15_2'
        WHEN substr(구매일자,1,6)<201510  THEN '15_3'
        ELSE '15_4' 
    END);
COMMIT;

CREATE TABLE onlyb AS
SELECT * FROM PURPROD
where 제휴사='B';

SELECT * FROM PURPROD;
SELECT * FROM s_pur_copy;
SELECT * FROM jbu;
drop table PRO_NEW;


(SELECT * FROM PURPROD S,jbu P 
where P.기준분류=S.소분류코드);


select column_name from user_tab_columns where table_name= 'PURPROD';


CREATE TABLE pbs AS
select 고객번호,분기,상품분류,count(구매일자) 구매횟수 ,sum(구매금액) 총구매액
from purbun
group by 상품분류, 고객번호, 분기
order by 고객번호;

select * from pbs;
SELECT * FROM PURPROD S,jbu P 
where P.기준분류=S.소분류코드;

select * from PURPROD;

select 고객번호,분기,상품분류,count(구매일자) 구매횟수 ,sum(구매금액) 총구매액
from (SELECT * FROM PURPROD S,jbu P 
where P.기준분류=S.소분류코드)
where 분기 not in ('14_1','14_2','14_3','14_4')
group by 상품분류, 고객번호, 분기
order by 고객번호;


-- 1~6기만
select 고객번호,분기,상품분류,count(구매일자) 구매횟수 ,sum(구매금액) 총구매액
from (SELECT * FROM PURPROD S,jbu P 
where P.기준분류=S.소분류코드)
where 분기 not in ('15_3','15_4')
group by 상품분류, 고객번호, 분기
order by 고객번호);


select 고객번호,상품분류, count(구매일자) 구매횟수 ,sum(구매금액) 총구매액
from (SELECT * FROM PURPROD S,jbu P 
where P.기준분류=S.소분류코드)
where 분기 not in '15_4'
group by 고객번호,상품분류
order by 고객번호;

select 고객번호,사분류코드, count(구매일자) 구매횟수 ,sum(구매금액) 총구매액
from PURPROD
where 분기 not in '15_4'
group by 고객번호,사분류코드
order by 고객번호;

select 고객번호,제휴사, count(구매일자) 구매횟수 ,sum(구매금액) 총구매액
from PURPROD
where 분기 not in '15_4'
group by 고객번호,제휴사
order by 고객번호;

select 고객번호,분기, count(구매일자) 구매횟수 ,sum(구매금액) 총구매액
from PURPROD
where 분기 not in '1  5_4'
group by 고객번호,분기
order by 고객번호;

--분류코드별 
SELECT 고객번호,소분류코드,count(구매일자) 구매횟수 ,sum(구매금액) 총구매액,round(SUM(구매금액)/count(구매일자)) 
FROM s_pur_copy
group by 소분류코드,고객번호
order by 고객번호;

--년도별
SELECT 고객번호, YEAR,SUM(구매금액) 구매금액, count(구매일자) 구매횟수,round(SUM(구매금액)/count(구매일자))
FROM s_pur_copy
GROUP BY 고객번호, YEAR
ORDER BY 고객번호;

--분기별
select 고객번호,분기, count(구매일자) 구매횟수 ,sum(구매금액) 총구매액,round(SUM(구매금액)/count(구매일자))
from s_pur_copy
group by 고객번호,분기
order by 고객번호;

--반기별
select 고객번호,반기, count(구매일자) 구매횟수 ,sum(구매금액) 총구매액,round(SUM(구매금액)/count(구매일자))
from s_pur_copy
group by 고객번호,반기
order by 고객번호,반기 DESC;

--제휴사별
select 고객번호,제휴사, count(구매일자) 구매횟수 ,sum(구매금액) 총구매액,round(SUM(구매금액)/count(구매일자))
from s_pur_copy
group by 고객번호,제휴사
order by 고객번호;






SELECT *
from purprod;

SELECT * FROM halfyear;

--반기별 구매횟수 및 구매금액
--구매횟수는 늘었으나 구매액은 줄어듬 이슈발생?
select * from onlyb;
SELECT year, count(구매일자) 구매횟수 ,sum(구매금액) 구매금액
FROM onlyb
group by year;

-- 이슈close
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



SELECT 고객번호, 
FROM PURPROD
GROUP BY 고객번호, YEAR
ORDER BY 고객번호;



CREATE TABLE pur_amt AS
SELECT 고객번호 cusno, sum(구매금액) puramt
FROM PURPROD
GROUP BY 고객번호 
ORDER BY 고객번호; 



--시즈날리티 보정값
create table cor_pur as
select * from purprod;

select * from PURBUN;

update PURPROD set 구매금액 = 구매금액/1.01620302175834
where 구매일자 between 20140101 and 20140331; --3,217,669

update PURPROD set 구매금액 = 구매금액/0.970792475064181
where 구매일자 between 20140401 and 20140630; --3,491,713개

update PURPROD set 구매금액 = 구매금액/0.885105845713564
where 구매일자 between 20140701 and 20140930; --3,563,754

update PURPROD set 구매금액 = 구매금액/1.12760405706831
where 구매일자 between 20141001 and 20141231; -- 3,598,378

update PURPROD set 구매금액 = 구매금액/0.988770710623332
where 구매일자 between 20150101 and 20150331; --3,619,223

update PURPROD set 구매금액 = 구매금액/0.932539514386203
where 구매일자 between 20150401 and 20150630;  --3,854,875

update PURPROD set 구매금액 = 구매금액/0.88791897961778
where 구매일자 between 20150701 and 20150930;  --3,795,633

update PURPROD set 구매금액 = 구매금액/1.2103055214204
where 구매일자 between 20151001 and 20151231; --

