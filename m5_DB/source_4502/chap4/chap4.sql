--[질의 4-1] -78과 +78의 절댓값을 구하시오.
   SELECT 	ABS(-78), ABS(+78) 
   FROM 	Dual;

--[질의 4-2] 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오.
SELECT	ROUND(4.875, 1) 
   FROM	Dual;

--[질의 4-3] 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오.
SELECT	custid "고객번호", ROUND(SUM(saleprice)/COUNT(*), -2) "평균금액"
FROM	Orders
GROUP BY	custid;

--[질의 4-4] 도서 제목에 ‘야구’가 포함된 도서를 ‘농구’로 변경한 후 도서 목록을 보이시오.
SELECT	bookid, REPLACE(bookname, '야구', '농구') bookname, publisher, price
FROM	Book;

--[질의 4-5] ‘굿스포츠’에서 출판한 도서의 제목과 제목의 글자 수, 바이트 수를 보이시오.
SELECT 	bookname "제목", LENGTH(bookname) "글자수",	LENGTHB(bookname) "바이트수"
FROM 	Book
WHERE 	publisher='굿스포츠';

--[질의 4-6] 마당서점의 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
SELECT	SUBSTR(name, 1, 1) "성", COUNT(*) "인원"
FROM	Customer
GROUP BY	SUBSTR(name, 1, 1);

--[질의 4-7] 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT	orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
FROM	Orders;

--[질의 4-8] 마당서점이 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 단 주문일은 ‘yyyy-mm-dd 요일’ 형태로 표시한다.
SELECT	orderid "주문번호", TO_CHAR(orderdate, 'yyyy-mm-dd dy') "주문일", custid "고객번호", bookid "도서번호"
FROM	Orders
WHERE      orderdate=TO_DATE('20200707', 'yyyymmdd');

--[질의 4-9] DBMS 서버에 설정된 현재 날짜와 시간, 요일을 확인하시오.
SELECT	SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "SYSDATE_1" 
FROM 	Dual; 		

--[질의 4-10] 이름, 전화번호가 포함된 고객목록을 보이시오. 단, 전화번호가 없는 고객은 ‘연락처없음’으로 표시하시오.
SELECT	name "이름", NVL(phone, '연락처없음') "전화번호" 
FROM	Customer;

--[질의 4-11] 고객목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오.
SELECT	ROWNUM "순번", custid, name, phone
FROM	Customer
WHERE 	ROWNUM <= 2;

--[질의 4-12] 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
SELECT	orderid, saleprice
FROM	Orders
WHERE	saleprice <= (SELECT AVG(saleprice) FROM   Orders);

--[질의 4-13] 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 보이시오.
SELECT	orderid, custid, saleprice
FROM	Orders md
WHERE	saleprice > (SELECT   AVG(saleprice)
			     FROM	Orders so
			     WHERE	md.custid=so.custid);

--[질의 4-14] ‘대한민국’에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
SELECT	SUM(saleprice) "total"
FROM	Orders
WHERE	custid IN (SELECT     custid
			   FROM	Customer
			   WHERE	address LIKE '%대한민국%');

--[질의 4-15] 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오.
SELECT	orderid, saleprice
FROM	Orders
WHERE	saleprice > ALL (SELECT saleprice
				  FROM   Orders
				  WHERE custid='3');

--[질의 4-16] EXISTS 연산자를 사용하여 ‘대한민국’에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
SELECT	SUM(saleprice) "total"
FROM	Orders od
WHERE	EXISTS (SELECT  *
			 FROM	   Customer cs
			 WHERE	   address LIKE '%대한민국%' AND cs.custid=od.custid);

--[질의 4-17] 마당서점의 고객별 판매액을 보이시오(고객이름과 고객별 판매액 출력).
SELECT	(SELECT    name
	  	FROM	     Customer cs
		 	WHERE    cs.custid=od.custid) "name", SUM(saleprice) "total"
FROM	Orders od
GROUP BY	od.custid;

--[질의 4-18] Orders 테이블에 각 주문에 맞는 도서이름을 입력하시오.
ALTER TABLE Orders ADD bookname VARCHAR2(40);

UPDATE	Orders
SET		bookname=(SELECT	bookname
           		    FROM	Book
 			    WHERE	Book.bookid=Orders.bookid);

--[질의 4-19] 고객번호가 2 이하인 고객의 판매액을 보이시오(고객이름과 고객별 판매액 출력).
SELECT	cs.name, SUM(od.saleprice) "total"
FROM	(SELECT   custid, name
		 FROM     Customer
		 WHERE   custid <= 2) cs,
		Orders	od
WHERE	cs.custid=od.custid
GROUP BY	cs.name;

--[질의 4-20] 주소에 ‘대한민국’을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오. 뷰의 이름은 vw_Customer로 설정하시오.
CREATE VIEW	vw_Customer
AS SELECT		*
	FROM		Customer
	WHERE		address LIKE '%대한민국%';

--[질의 4-21] Orders 테이블에서 고객이름과 도서이름을 바로 확인할 수 있는 뷰를 생성한 후, ‘김연아’ 고객이 구입한 도서의 주문번호, 도서이름, 주문액을 보이시오.
CREATE VIEW	vw_Orders (orderid, custid, name, bookid, bookname, saleprice, orderdate)
AS SELECT		od.orderid, od.custid, cs.name,
			od.bookid, bk.bookname, od.saleprice, od.orderdate
	FROM		Orders od, Customer cs, Book bk
	WHERE		od.custid=cs.custid AND od.bookid=bk.bookid;

SELECT	orderid, bookname, saleprice
FROM	vw_Orders
WHERE	name ='김연아';

--[질의 4-22] [질의 4-20]에서 생성한 뷰 vw_Customer는 주소가 ‘대한민국’인 고객을 보여준다. 
CREATE OR REPLACE VIEW vw_Customer (custid, name, address)
AS  SELECT		custid, name, address
	FROM		Customer
	WHERE		address LIKE '%영국%';

SELECT	*
FROM	vw_Customer;

--[질의 4-23] 앞서 생성한 뷰 vw_Customer를 삭제하시오.
DROP VIEW	vw_Customer;

SELECT	*
FROM	vw_Customer;

--[질의 4-24] Book 테이블의 bookname 열을 대상으로 인덱스 ix_Book을 생성하시오.
CREATE INDEX ix_Book ON Book (bookname);

--[질의 4-25] Book 테이블의 publisher, price 열을 대상으로 인덱스 ix_Book2를 생성하시오.
CREATE INDEX ix_Book2 ON Book (publisher, price);

	SELECT	* 
	FROM		Book
	WHERE		publisher='대한미디어' AND price >= 30000;

--[질의 4-26] 인덱스 ix_Book을 재생성하시오.
ALTER INDEX ix_Book REBUILD; 

--[질의 4-27] 인덱스 ix_Book을 삭제하시오.
DROP INDEX ix_Book;