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

ALTER TABLE PURPROD ADD �б� varchar2 (10);
UPDATE PURPROD SET �б�=(CASE WHEN substr(��������,1,6)<201404  THEN '14_1'
        WHEN substr(��������,1,6)<201407  THEN '14_2'
        WHEN substr(��������,1,6)<201410  THEN '14_3'
        WHEN substr(��������,1,6)<201501  THEN '14_4'
        WHEN substr(��������,1,6)<201504  THEN '15_1'
        WHEN substr(��������,1,6)<201507  THEN '15_2'
        WHEN substr(��������,1,6)<201510  THEN '15_3'
        ELSE '15_4' 
    END);
COMMIT;

CREATE TABLE onlyb AS
SELECT * FROM PURPROD
where ���޻�='B';

SELECT * FROM PURPROD;
SELECT * FROM s_pur_copy;
SELECT * FROM jbu;
drop table PRO_NEW;


(SELECT * FROM PURPROD S,jbu P 
where P.���غз�=S.�Һз��ڵ�);


select column_name from user_tab_columns where table_name= 'PURPROD';


CREATE TABLE pbs AS
select ����ȣ,�б�,��ǰ�з�,count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�
from purbun
group by ��ǰ�з�, ����ȣ, �б�
order by ����ȣ;

select * from pbs;
SELECT * FROM PURPROD S,jbu P 
where P.���غз�=S.�Һз��ڵ�;

select * from PURPROD;

select ����ȣ,�б�,��ǰ�з�,count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�
from (SELECT * FROM PURPROD S,jbu P 
where P.���غз�=S.�Һз��ڵ�)
where �б� not in ('14_1','14_2','14_3','14_4')
group by ��ǰ�з�, ����ȣ, �б�
order by ����ȣ;


-- 1~6�⸸
select ����ȣ,�б�,��ǰ�з�,count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�
from (SELECT * FROM PURPROD S,jbu P 
where P.���غз�=S.�Һз��ڵ�)
where �б� not in ('15_3','15_4')
group by ��ǰ�з�, ����ȣ, �б�
order by ����ȣ);


select ����ȣ,��ǰ�з�, count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�
from (SELECT * FROM PURPROD S,jbu P 
where P.���غз�=S.�Һз��ڵ�)
where �б� not in '15_4'
group by ����ȣ,��ǰ�з�
order by ����ȣ;

select ����ȣ,��з��ڵ�, count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�
from PURPROD
where �б� not in '15_4'
group by ����ȣ,��з��ڵ�
order by ����ȣ;

select ����ȣ,���޻�, count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�
from PURPROD
where �б� not in '15_4'
group by ����ȣ,���޻�
order by ����ȣ;

select ����ȣ,�б�, count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�
from PURPROD
where �б� not in '1  5_4'
group by ����ȣ,�б�
order by ����ȣ;

--�з��ڵ庰 
SELECT ����ȣ,�Һз��ڵ�,count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�,round(SUM(���űݾ�)/count(��������)) 
FROM s_pur_copy
group by �Һз��ڵ�,����ȣ
order by ����ȣ;

--�⵵��
SELECT ����ȣ, YEAR,SUM(���űݾ�) ���űݾ�, count(��������) ����Ƚ��,round(SUM(���űݾ�)/count(��������))
FROM s_pur_copy
GROUP BY ����ȣ, YEAR
ORDER BY ����ȣ;

--�б⺰
select ����ȣ,�б�, count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�,round(SUM(���űݾ�)/count(��������))
from s_pur_copy
group by ����ȣ,�б�
order by ����ȣ;

--�ݱ⺰
select ����ȣ,�ݱ�, count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�,round(SUM(���űݾ�)/count(��������))
from s_pur_copy
group by ����ȣ,�ݱ�
order by ����ȣ,�ݱ� DESC;

--���޻纰
select ����ȣ,���޻�, count(��������) ����Ƚ�� ,sum(���űݾ�) �ѱ��ž�,round(SUM(���űݾ�)/count(��������))
from s_pur_copy
group by ����ȣ,���޻�
order by ����ȣ;






SELECT *
from purprod;

SELECT * FROM halfyear;

--�ݱ⺰ ����Ƚ�� �� ���űݾ�
--����Ƚ���� �þ����� ���ž��� �پ�� �̽��߻�?
select * from onlyb;
SELECT year, count(��������) ����Ƚ�� ,sum(���űݾ�) ���űݾ�
FROM onlyb
group by year;

-- �̽�close
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



SELECT ����ȣ, 
FROM PURPROD
GROUP BY ����ȣ, YEAR
ORDER BY ����ȣ;



CREATE TABLE pur_amt AS
SELECT ����ȣ cusno, sum(���űݾ�) puramt
FROM PURPROD
GROUP BY ����ȣ 
ORDER BY ����ȣ; 



--�����Ƽ ������
create table cor_pur as
select * from purprod;

select * from PURBUN;

update PURPROD set ���űݾ� = ���űݾ�/1.01620302175834
where �������� between 20140101 and 20140331; --3,217,669

update PURPROD set ���űݾ� = ���űݾ�/0.970792475064181
where �������� between 20140401 and 20140630; --3,491,713��

update PURPROD set ���űݾ� = ���űݾ�/0.885105845713564
where �������� between 20140701 and 20140930; --3,563,754

update PURPROD set ���űݾ� = ���űݾ�/1.12760405706831
where �������� between 20141001 and 20141231; -- 3,598,378

update PURPROD set ���űݾ� = ���űݾ�/0.988770710623332
where �������� between 20150101 and 20150331; --3,619,223

update PURPROD set ���űݾ� = ���űݾ�/0.932539514386203
where �������� between 20150401 and 20150630;  --3,854,875

update PURPROD set ���űݾ� = ���űݾ�/0.88791897961778
where �������� between 20150701 and 20150930;  --3,795,633

update PURPROD set ���űݾ� = ���űݾ�/1.2103055214204
where �������� between 20151001 and 20151231; --

