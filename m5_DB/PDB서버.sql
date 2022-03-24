SELECT * FROM s_pur_copy order by 소분류코드; 
SELECT * FROM custdemo;
SELECT * FROM prodcl;

SELECT * FROM comp;
SELECT * FROM membership;
SELECT * FROM channel;



--create table s_pur_copy as select * from s_pur_copy;
-- create table 새로만들 테이블 명 as select * from 대분류코드 있는 본인의 테이블명
select * from s_pur_copy;
-- A제휴사
-- 편의품 1
update s_pur_copy set 소분류코드 = 1 
where 제휴사 = 'A' and 소분류코드 between 'A010101' and 'A010624'
or 제휴사 = 'A' and 소분류코드 between 'A010656'  and 'A011004'
or 제휴사 = 'A' and 소분류코드 between 'A090101'  and 'A090105'
or 제휴사 = 'A' and 소분류코드 = 'A030110'
or 제휴사 = 'A' and 소분류코드 between 'A090107'  and 'A090310'
or 제휴사 = 'A' and 소분류코드 = 'A030112';

-- 선매품 2
update s_pur_copy set 소분류코드 = 2 
where 제휴사 = 'A' and 소분류코드 between 'A020101'  and 'A020603'
or 제휴사 = 'A' and 소분류코드 between 'A020607'  and 'A030109'
or 제휴사 = 'A' and 소분류코드 = 'A030111'
or 제휴사 = 'A' and 소분류코드 between 'A040201'  and 'A070304'
or 제휴사 = 'A' and 소분류코드 between 'A070501'  and 'A070608'
or 제휴사 = 'A' and 소분류코드 between 'A090311'  and 'A090610'
or 제휴사 = 'A' and 소분류코드 = 'A030113';

-- 전문품 3
update s_pur_copy set 소분류코드 = 3
where 제휴사 = 'A' and 소분류코드 between 'A070401'  and 'A070403'
or 제휴사 = 'A' and 소분류코드 between 'A080101'  and 'A080125'
or 제휴사 = 'A' and 소분류코드 = 'A090701' ;
drop table purbyyear;
drop table S_PUR_COPY;
commit;
-- 기타 4
update s_pur_copy set 소분류코드 = 4
where 제휴사 = 'A' and 소분류코드 between 'A010625'  and 'A010655'
or 제휴사 = 'A' and 소분류코드 between 'A011101'  and 'A011109'
or 제휴사 = 'A' and 소분류코드 = 'A030114'
or 제휴사 = 'A' and 소분류코드 between 'A020604'  and 'A020606'
or 제휴사 = 'A' and 소분류코드 = 'A011101'
or 제휴사 = 'A' and 소분류코드 = 'A090106';

-- B제휴사
select * from s_pur_copy where 제휴사 = 'B';
update s_pur_copy set 소분류코드 = 1 
where 제휴사 = 'B' and 소분류코드 between 'B010101' and 'B050512'
or 제휴사 = 'B' and 소분류코드 between 'B050701'  and 'B071101'
or 제휴사 = 'B' and 소분류코드 between 'B090201'  and 'B130211'
or 제휴사 = 'B' and 소분류코드 between 'B130401'  and 'B200602'
or 제휴사 = 'B' and 소분류코드 between 'B200801'  and 'B220206'
or 제휴사 = 'B' and 소분류코드 between 'B220501'  and 'B220601'
or 제휴사 = 'B' and 소분류코드 between 'B230201'  and 'B230212'
or 제휴사 = 'B' and 소분류코드 between 'B240101'  and 'B260101'
or 제휴사 = 'B' and 소분류코드 = 'B260103'
or 제휴사 = 'B' and 소분류코드 between 'B260109'  and 'B260111'
or 제휴사 = 'B' and 소분류코드 between 'B260114'  and 'B260310'
or 제휴사 = 'B' and 소분류코드 between 'B260501'  and 'B260508'
or 제휴사 = 'B' and 소분류코드 between 'B260701'  and 'B260807'
or 제휴사 = 'B' and 소분류코드 between 'B261001'  and 'B261004'
or 제휴사 = 'B' and 소분류코드 between 'B281101'  and 'B281106'
or 제휴사 = 'B' and 소분류코드 between 'B340101'  and 'B340410'
or 제휴사 = 'B' and 소분류코드 between 'B380101'  and 'B380802'
or 제휴사 = 'B' and 소분류코드 between 'B430101'  and 'B431101'
or 제휴사 = 'B' and 소분류코드 between 'B450301'  and 'B450312'
or 제휴사 = 'B' and 소분류코드 between 'B460101'  and 'B480501'
or 제휴사 = 'B' and 소분류코드 between 'B520101'  and 'B550206'
or 제휴사 = 'B' and 소분류코드 between 'B550401'  and 'B660805'
or 제휴사 = 'B' and 소분류코드 between 'B700501'  and 'B700502'
or 제휴사 = 'B' and 소분류코드 between 'B720101'  and 'B750103'
or 제휴사 = 'B' and 소분류코드 between 'B750401'  and 'B750402'
or 제휴사 = 'B' and 소분류코드 between 'B760101'  and 'B840406'
or 제휴사 = 'B' and 소분류코드 between 'B860101'  and 'B860603'
or 제휴사 = 'B' and 소분류코드 between 'B870301'  and 'B870302'
or 제휴사 = 'B' and 소분류코드 between 'B870403'  and 'B870703'
or 제휴사 = 'B' and 소분류코드 between 'B890101'  and 'B920603'; -- 1734

update s_pur_copy set 소분류코드 = 2 
where 제휴사 = 'B' and 소분류코드 between 'B050601' and 'B050607'
or 제휴사 = 'B' and 소분류코드 between 'B130301'  and 'B130306'
or 제휴사 = 'B' and 소분류코드 between 'B200701'  and 'B200705'
or 제휴사 = 'B' and 소분류코드 between 'B220301'  and 'B220402'
or 제휴사 = 'B' and 소분류코드 between 'B220701'  and 'B230106'
or 제휴사 = 'B' and 소분류코드 between 'B230301'  and 'B230503'
or 제휴사 = 'B' and 소분류코드 between 'B260106'  and 'B260108'
or 제휴사 = 'B' and 소분류코드 between 'B260112'  and 'B260113'
or 제휴사 = 'B' and 소분류코드 between 'B260401'  and 'B260405'
or 제휴사 = 'B' and 소분류코드 between 'B260601'  and 'B260617'
or 제휴사 = 'B' and 소분류코드 between 'B260901'  and 'B260903'
or 제휴사 = 'B' and 소분류코드 between 'B261005'  and 'B270506'
or 제휴사 = 'B' and 소분류코드 between 'B270701'  and 'B280305'
or 제휴사 = 'B' and 소분류코드 between 'B280501'  and 'B281004'
or 제휴사 = 'B' and 소분류코드 between 'B281201'  and 'B330803'
or 제휴사 = 'B' and 소분류코드 between 'B350101'  and 'B360802'
or 제휴사 = 'B' and 소분류코드 between 'B390101'  and 'B421301'
or 제휴사 = 'B' and 소분류코드 between 'B440101'  and 'B440902'
or 제휴사 = 'B' and 소분류코드 between 'B450501'  and 'B450702'
or 제휴사 = 'B' and 소분류코드 between 'B450704'  and 'B451901'
or 제휴사 = 'B' and 소분류코드 between 'B490101'  and 'B510309'
or 제휴사 = 'B' and 소분류코드 between 'B550301'  and 'B550308'
or 제휴사 = 'B' and 소분류코드 between 'B680101'  and 'B700405'
or 제휴사 = 'B' and 소분류코드 between 'B700503'  and 'B710304'
or 제휴사 = 'B' and 소분류코드 between 'B750201'  and 'B750304'
or 제휴사 = 'B' and 소분류코드 between 'B750501'  and 'B750502'
or 제휴사 = 'B' and 소분류코드 between 'B850101'  and 'B850204'
or 제휴사 = 'B' and 소분류코드 between 'B870101'  and 'B870105'
or 제휴사 = 'B' and 소분류코드 between 'B870201'  and 'B870203'
or 제휴사 = 'B' and 소분류코드 between 'B870401'  and 'B870402'
or 제휴사 = 'B' and 소분류코드 between 'B880101'  and 'B880302'; -- 762

update s_pur_copy set 소분류코드 = 3 
where 제휴사 = 'B' and 소분류코드 between 'B450101' and 'B450206'
or 제휴사 = 'B' and 소분류코드 between 'B450401'  and 'B450402'
or 제휴사 = 'B' and 소분류코드 = 'B450703'; -- 14

update s_pur_copy set 소분류코드 = 4 
where 제휴사 = 'B' and 소분류코드 between 'B080101' and 'B090103'
or 제휴사 = 'B' and 소분류코드 = 'B260102'
or 제휴사 = 'B' and 소분류코드 between 'B260104'  and 'B260105'
or 제휴사 = 'B' and 소분류코드 between 'B270601'  and 'B270606'
or 제휴사 = 'B' and 소분류코드 = 'B280401'
or 제휴사 = 'B' and 소분류코드 between 'B370101'  and 'B371003'
or 제휴사 = 'B' and 소분류코드 between 'B510401'  and 'B510503'
or 제휴사 = 'B' and 소분류코드 between 'B670101'  and 'B670405'; -- 114

-- C제휴사
update s_pur_copy set 소분류코드 = 1 
where 제휴사 = 'C' and 소분류코드 between 'C010101' and 'C130603'
or 제휴사 = 'C' and 소분류코드 between 'C130701'  and 'C170310'
or 제휴사 = 'C' and 소분류코드 between 'C170316'  and 'C170317'
or 제휴사 = 'C' and 소분류코드 between 'C170326'  and 'C170329'
or 제휴사 = 'C' and 소분류코드 between 'C170357'  and 'C170435'
or 제휴사 = 'C' and 소분류코드 between 'C170535'  and 'C170655'
or 제휴사 = 'C' and 소분류코드 = 'C170657'
or 제휴사 = 'C' and 소분류코드 = 'C170660'
or 제휴사 = 'C' and 소분류코드 between 'C170662'  and 'C170663'
or 제휴사 = 'C' and 소분류코드 between 'C170665'  and 'C170701'; -- 900

update s_pur_copy set 소분류코드 = 2 
where 제휴사 = 'C' and 소분류코드 between 'C130604' and 'C130608'
or 제휴사 = 'C' and 소분류코드 between 'C170311'  and 'C170315'
or 제휴사 = 'C' and 소분류코드 between 'C170318'  and 'C170325'
or 제휴사 = 'C' and 소분류코드 between 'C170330'  and 'C170356'
or 제휴사 = 'C' and 소분류코드 between 'C170436'  and 'C170534'
or 제휴사 = 'C' and 소분류코드 = 'C170656'
or 제휴사 = 'C' and 소분류코드 between 'C170658'  and 'C170659'
or 제휴사 = 'C' and 소분류코드 = 'C170661'
or 제휴사 = 'C' and 소분류코드 = 'C170664'; -- 87

-- 제휴사 D
update s_pur_copy set 소분류코드 = 1 
where 제휴사 = 'D' and 소분류코드 between 'D010101' and 'D020504'
or 제휴사 = 'D' and 소분류코드 between 'D030201'  and 'D050205'
or 제휴사 = 'D' and 소분류코드 between 'D060101'  and 'D060501'
or 제휴사 = 'D' and 소분류코드 between 'D070101'  and 'D080401'; -- 136

update s_pur_copy set 소분류코드 = 2 
where 제휴사 = 'D' and 소분류코드 between 'D030101' and 'D030103'
or 제휴사 = 'D' and 소분류코드 between 'D050301'  and 'D050302'
or 제휴사 = 'D' and 소분류코드 between 'D060502'  and 'D060801'; -- 9

select * from s_pur_copy where 제휴사 = 'D';