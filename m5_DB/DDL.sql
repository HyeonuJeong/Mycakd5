
--[테이블 생성 규칙]

--테이블명은 객체를 의미할 수 있는 적절한 이름을 사용한다. 가능한 단수형을 권고한다.--
--테이블명은 다른 테이블의 이름과 중복되지 않아야 한다.--
--한 테이블 내에서는 칼럼명이 중복되게 지정될 수 없다. --
--테이블 이름을 지정하고 각 칼럼들은 괄호 "( )" 로 묶어 지정한다.--
--각 칼럼들은 콤마" ", 로 구분되고, 항상 끝은 세미콜론 ";"으로 끝난다.--
--칼럼에 대해서는 다른 테이블까지 고려하여 데이터베이스 내에서는 일관성 있게 사용하는 것이 좋다. (데이터 표준화 관점)--
--칼럼 뒤에 데이터 유형은 꼭 지정되어야 한다.--
--테이블명과 칼럼명은 반드시 문자로 시작해야 하고, 벤더별로 길이에 대한 한계가 있다.--
--벤더에서 사전에 정의한 예약어(Reserved word)는 쓸 수 없다.--
--A-Z, a-z, 0-9, _, $, # 문자만 허용된다.
drop table member;
    
create table member(
id varchar2(50),
pwd varchar2(50),
name varchar2(50),
gender varchar2(50),
age number,
birthday varchar2(50),
phone varchar2(50),
regdate date
);

--일부만 입력
insert into member (id, pwd,name) values ('11111','1234','hw');

--전체입력
insert into member values ('22222','1234','hww','m',20,'2000-01-01','010-1234-1234','2022-02-15'); --date는 yyyy/mm/dd 형식도 가능

alter table member add TEXT NCLOB;

insert into member (id, pwd, text) values ('33333',1234,'정치는 국민을 위해 존재한다.');

select * from member;
