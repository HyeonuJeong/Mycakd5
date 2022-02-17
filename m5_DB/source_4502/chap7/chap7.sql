---------------------------------------------------------
-- Summer 테이블을 생성하고 데이터를 삽입하는 SQL
---------------------------------------------------------
DROP TABLE Summer; /* 기존 테이블이 있으면 삭제 */

CREATE TABLE Summer
( sid   NUMBER,
  class VARCHAR2(20),
  price NUMBER
);

INSERT INTO Summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
INSERT INTO Summer VALUES (250, 'FORTRAN', 20000);

/* 생성된 Summer 테이블 확인 */
SELECT *
FROM   Summer;

--[질의 7-1] 200번 학생의 계절학기 수강신청을 취소하시오.
/* C 강좌 수강료 조회 */
SELECT	price "C 수강료"
FROM	Summer 
WHERE	class='C'; 

/* 200번 학생의 수강신청 취소 */
DELETE	FROM	Summer
WHERE	sid=200;

/* C 강좌 수강료 다시 조회 */
SELECT	price "C 수강료"
FROM	Summer
WHERE	class='C';

--[질의 7-2] 계절학기에 새로운 자바 강좌를 개설하시오.
/* 자바 강좌 삽입 */
INSERT INTO Summer VALUES (NULL, 'JAVA', 25000);

/* Summer 테이블 조회 */
SELECT	*
FROM	Summer;

/* NULL 값이 있는 경우 주의할 질의 : 투플은 5개이지만 수강학생은 총 4명임 */
SELECT	COUNT(*) "수강인원"
FROM	Summer;

SELECT	COUNT(sid) "수강인원"
FROM	Summer;

SELECT	COUNT(*) "수강인원"
FROM	Summer
WHERE	sid IS NOT NULL;

--[질의 7-3] FORTRAN 강좌의 수강료를 20,000원에서 15,000원으로 수정하시오.
/* FORTRAN 강좌 수강료 수정 */
UPDATE	Summer
SET		price=15000
WHERE	class='FORTRAN';

SELECT	*
FROM	Summer;

SELECT	DISTINCT price "FORTRAN 수강료"
FROM	Summer
WHERE	class='FORTRAN';

/* 다음 실습을 위해 FORTRAN 강좌의 수강료를 다시 20,000원으로 복구 */
UPDATE	Summer
SET		price=20000
WHERE	class='FORTRAN';

/* 만약 UPDATE 문을 다음과 같이 작성하면 데이터 불일치 문제가 발생함 */
UPDATE	Summer
SET		price=15000
WHERE	class='FORTRAN' AND sid=100;

/* Summer 테이블을 조회해보면 FORTRAN 강좌의 수강료가 1건만 수정되었음 */
SELECT	*
FROM	Summer;

/* FORTRAN 수강료를 조회하면 두 건이 나옴(데이터 불일치 문제 발생) */
SELECT	price "FORTRAN 수강료"
FROM	Summer
WHERE	class='FORTRAN';

/* 다음 실습을 위해 FORTRAN 강좌의 수강료를 다시 20,000원으로 복구 */
UPDATE	Summer
SET		price=20000
WHERE	class='FORTRAN';

/* 다음 실습을 위해 sid가 NULL인 투플 삭제 */
DELETE
FROM	Summer
WHERE	sid IS NULL;

---------------------------------------------------------
--SummerPrice 테이블과 SummerEnroll 테이블을 생성하는 SQL 문
---------------------------------------------------------
DROP TABLE SummerPrice; /* 기존 테이블이 있으면 삭제 */
DROP TABLE SummerEnroll; /* 기존 테이블이 있으면 삭제 */

/* SummerPrice 테이블 생성 */
CREATE TABLE SummerPrice
( class VARCHAR(20),
  price INTEGER
);

INSERT INTO SummerPrice VALUES ('FORTRAN', 20000);
INSERT INTO SummerPrice VALUES ('PASCAL', 15000);
INSERT INTO SummerPrice VALUES ('C', 10000);

SELECT *
FROM   SummerPrice;

/* SummerEnroll 테이블 생성 */
CREATE TABLE SummerEnroll
( sid   INTEGER,
 class VARCHAR(20)
);

INSERT INTO SummerEnroll VALUES (100, 'FORTRAN');
INSERT INTO SummerEnroll VALUES (150, 'PASCAL');
INSERT INTO SummerEnroll VALUES (200, 'C');
INSERT INTO SummerEnroll VALUES (250, 'FORTRAN');

SELECT *
FROM SummerEnroll;

--[질의 7-4] 200번 학생의 계절학기 수강신청을 취소하시오.
SELECT	price "C 수강료"
FROM	SummerPrice
WHERE	class='C';

DELETE	FROM	SummerEnroll
WHERE	sid=200;

SELECT	*
FROM	SummerEnroll;

/* C 강좌의 수강료가 존재하는지 확인 */
SELECT	price "C 수강료"
FROM	SummerPrice
WHERE	class='C';

--[질의 7-5] 계절학기에 새로운 자바 강좌를 개설하시오.
/* 자바 강좌 삽입, NULL 값을 입력할 필요 없음 */
INSERT INTO SummerPrice VALUES ('JAVA', 25000);

SELECT	*
FROM	SummerPrice;

/* 수강신청 정보 확인 */
SELECT	*
FROM	SummerEnroll;

--[질의 7-6] FORTRAN 강좌의 수강료를 20,000원에서 15,000원으로 수정하시오.
UPDATE SummerPrice
SET     price=15000
WHERE  class='FORTRAN';

SELECT price "FORTRAN 수강료"
FROM   SummerPrice
WHERE class='FORTRAN';

