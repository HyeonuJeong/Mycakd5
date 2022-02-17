--[예제 5-1] Book 테이블에 한 개의 투플을 삽입하는 프로시저를 작성하시오
CREATE OR REPLACE PROCEDURE InsertBook(
  myBookID IN NUMBER, 
  myBookName IN VARCHAR2, 
  myPublisher IN VARCHAR2, 
  myPrice IN NUMBER)
AS
BEGIN
  INSERT INTO Book(bookid, bookname, publisher, price)
      VALUES(myBookID, myBookName, myPublisher, myPrice);
END;

/* 프로시저 InsertBook을 테스트하는 부분 */
EXEC InsertBook(13, '스포츠과학', '마당과학서적', 25000);
SELECT * FROM Book;

--[예제 5-2] 동일한 도서가 있는지 점검한 후 삽입하는 프로시저를 작성하시오
CREATE OR REPLACE PROCEDURE BookInsertOrUpdate(
  myBookID NUMBER,
  myBookName VARCHAR2, 
  myPublisher VARCHAR2,
  myPrice INT) 
AS
  mycount NUMBER;
BEGIN
  SELECT count(*) INTO mycount FROM Book 
    WHERE bookname LIKE myBookName; 
  IF mycount!=0 THEN
    UPDATE Book SET price = myPrice
      WHERE bookname LIKE myBookName;
  ELSE
    INSERT INTO Book(bookid, bookname, publisher, price)
      VALUES(myBookID, myBookName, myPublisher, myPrice);
  END IF;
END;

/* BookInsertOrUpdate 프로시저를 실행하여 테스트하는 부분 */
EXEC BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 25000);
SELECT * FROM Book; /* 15번 투플 삽입 결과 확인 */
/* BookInsertOrUpdate 프로시저를 실행하여 테스트하는 부분 */
EXEC BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 20000);
SELECT * FROM Book; /* 15번 투플 가격 변경 확인 */

--[예제 5-3] Book 테이블에 저장된 도서의 평균가격을 반환하는 프로시저를 작성하시오.
CREATE OR REPLACE PROCEDURE AveragePrice(
  AverageVal OUT NUMBER)
AS
BEGIN
  SELECT AVG(price) INTO AverageVal FROM Book WHERE price IS NOT NULL;
END;

/* 프로시저 AveragePrice를 테스트하는 부분 */
SET SERVEROUTPUT ON;
DECLARE 
  AverageVal NUMBER;
BEGIN
  AveragePrice(AverageVal);
  DBMS_OUTPUT.PUT_LINE('책값 평균: '||AverageVal);
END;

--[예제 5-4] Orders 테이블의 판매 도서에 대한 이익을 계산하는 프로시저를 작성하시오.
CREATE OR REPLACE PROCEDURE Interest 
AS
  myInterest NUMERIC;
  Price NUMERIC;
  CURSOR InterestCursor IS SELECT saleprice FROM Orders;
BEGIN
  myInterest := 0.0;
  OPEN InterestCursor;
  LOOP
    FETCH InterestCursor INTO Price;
    EXIT WHEN InterestCursor%NOTFOUND;
    IF Price >= 30000 THEN
        myInterest := myInterest + Price * 0.1;
    ELSE 
        myInterest := myInterest + Price * 0.05;
    END IF;
  END LOOP;
  CLOSE InterestCursor;
  DBMS_OUTPUT.PUT_LINE(' 전체 이익 금액 = ' || myInterest);
END;


/* Interest 프로시저를 실행하여 판매된 도서에 대한 이익금을 계산 */
SET SERVEROUTPUT ON;
EXEC Interest;

--[예제 5-5] 신규 도서를 삽입한 후 자동으로 Book_log 테이블에 삽입한 내용을 기록하는 트리거 
CREATE TABLE Book_log(
  bookid_l NUMBER,
  bookname_l VARCHAR2(40),
  publisher_l VARCHAR2(40),
  price_l NUMBER);

/* 파일명 : AfterInsertBook.sql */
CREATE OR REPLACE TRIGGER AfterInsertBook 
AFTER INSERT ON Book FOR EACH ROW
DECLARE 
  average NUMBER;
BEGIN   
  INSERT INTO Book_log 
    VALUES(:new.bookid, :new.bookname, :new.publisher, :new.price);
  DBMS_OUTPUT.PUT_LINE('삽입 투플을 Book_log 테이블에 백업..');
END;

/* 삽입한 내용을 기록하는 트리거 확인 */
INSERT INTO Book VALUES(14, '스포츠 과학 1', '이상미디어', 25000);
SELECT * FROM Book WHERE BOOKID='14';
SELECT * FROM Book_log WHERE BOOKID_L='14';   /* 결과 확인 */

--[예제 5-6] 판매된 도서에 대한 이익을 계산하는 함수를 작성하시오.
CREATE OR REPLACE FUNCTION fnc_Interest(
  Price NUMBER) RETURN INT
IS
  myInterest NUMBER;
BEGIN
/* 가격이 30,000원 이상이면 10%, 30,000원 미만이면 5% */
  IF Price >= 30000 THEN myInterest := Price * 0.1;
  ELSE myInterest := Price * 0.05;
  END IF;
  RETURN myInterest;
END;

/* Orders 테이블에서 각 주문에 대한 이익을 출력 */
SELECT custid, orderid, saleprice, fnc_Interest(saleprice) interest 
FROM Orders;