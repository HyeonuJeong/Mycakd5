--2014 ~ 2015�� ������ 4�� ȸ�� ���� ������
SELECT COUNT(*) FROM PURPROD;
--�� �Ӽ����� : 19383��(����)
SELECT * FROM CUSTDEMO;
SELECT COUNT(*) FROM custdemo;
SELECT * FROM COMPET;
SELECT * FROM CHANNEL;
SELECT * FROM MEMBERSHIP;
SELECT * FROM PRODCL;
SELECT * FROM PURPROD;

--# ���� �м�(���� �м�)
SELECT YEAR, ROUND(SUM(���űݾ�)/1000000) �ѱ��ž�, ROUND(AVG(���űݾ�)) ��ձ��ž�
FROM PURPROD
GROUP BY YEAR;

--# �� �Ӽ�
--����, ���ɺ�, ��������,�پ��� ���պ� ���� ��ȭ 
--����� �̿�, ����� �̿�, �¶��� ä�ο� ���� ���� Ư�̼�

--# �� �����ൿ ������ ��ȭ
--�پ��� �� ������ ���� ����, ��ǰ ���� ����, ���� ����(�ð�, ��� ��)

--# ���� ȯ�濡 ���� ����(������)

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR=substr(��������,1,4);

ALTER TABLE PURPROD ADD �ݱ� varchar2 (10);
UPDATE PURPROD SET �ݱ�=(CASE WHEN substr(��������,1,6)<201407  THEN '14ss'
        WHEN substr(��������,1,6)<201501  THEN '14fw'
        WHEN substr(��������,1,6)<201507  THEN '15ss'
        ELSE '15fw'
    END);
COMMIT;

CREATE TABLE onlyb AS
SELECT * FROM PURPROD
where ���޻�='B';



SELECT * FROM onlyb;

--�з��ڵ庰 
SELECT ����ȣ,�Һз��ڵ�,count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž� FROM onlyb
group by �Һз��ڵ�,����ȣ
order by �Һз��ڵ�;



drop table halfyear;
CREATE TABLE halfyear AS
select ����ȣ,�ݱ�, count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�
from onlyb
group by ����ȣ,�ݱ�
order by ����ȣ;

SELECT * FROM halfyear;

--�ݱ⺰ ����Ƚ�� �� ���űݾ�
--Ƚ���� �þ����� ���ž��� �پ�� �̽��߻�?
select * from onlyb;
SELECT year, count(��������) ����Ƚ�� ,sum(���űݾ�) ���űݾ�
FROM onlyb
group by year;

-- �̽��� �ƴѰŰ���. �̽�close
SELECT �ݱ�,sum(����Ƚ��),sum(�ѱ��ž�) FROM halfyear
group by �ݱ�;

SELECT ����ȣ,�ݱ�,sum(����Ƚ��),sum(�ѱ��ž�) FROM halfyear
group by �ݱ�,����ȣ;

-- ǰ��  ����Ƚ�� �� ���űݾ� 
SELECT �Һз��ڵ�,count(��������) ����Ƚ�� ,sum(���űݾ�) ���űݾ�
FROM onlyb
group by �Һз��ڵ�
order by �Һз��ڵ�;




select * from demo order by ����ȣ;


CREATE TABLE PURBYYEAR AS
SELECT ����ȣ, YEAR, SUM(���űݾ�) ���ž�
FROM PURPROD
GROUP BY ����ȣ, YEAR
ORDER BY ����ȣ;

SELECT * FROM PURBYYEAR;



select * from comp;

CREATE TABLE pur_amt AS
SELECT ����ȣ cusno, sum(���űݾ�) puramt
FROM PURPROD
GROUP BY ����ȣ 
ORDER BY ����ȣ; 


