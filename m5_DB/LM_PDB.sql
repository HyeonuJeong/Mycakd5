SELECT * FROM CUSTDEMO;


--2014 ~2015 년 사이의 4개 회사 구매 데이터

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR = substr(구매일자,1,4);
commit;

create table purbyyear as
select 고객번호, year, sum(구매금액)
from purprod
group by 고객번호, year
order by 고객번호;

SELECT * FROM PURPROD;
