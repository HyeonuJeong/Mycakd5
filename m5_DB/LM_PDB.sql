SELECT * FROM CUSTDEMO;


--2014 ~2015 �� ������ 4�� ȸ�� ���� ������

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR = substr(��������,1,4);
commit;

create table purbyyear as
select ����ȣ, year, sum(���űݾ�)
from purprod
group by ����ȣ, year
order by ����ȣ;

SELECT * FROM PURPROD;
