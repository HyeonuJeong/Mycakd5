SET TRANSACTION NAME 'mytran';
INSERT INTO Book VALUES(99, '데이터베이스', '한빛', 25000);
SELECT bookname "bookname1" FROM Book 
  WHERE bookid=99;  
/*결과: 데이터베이스 , SAVEPOINT: a */
SAVEPOINT a;

UPDATE Book SET bookname='데이터베이스 개론' WHERE bookid=99;
SELECT bookname "bookname2" FROM Book 
  WHERE bookid=99;   
  /* 결과: 데이터베이스 개론 , SAVEPOINT: b */
SAVEPOINT b;

UPDATE Book SET bookname='데이터베이스 개론 및 실습' WHERE bookid=99;
SELECT bookname "bookname3" FROM Book 
  WHERE bookid=99;    
/*결과: 데이터베이스 개론 및 실습 */

ROLLBACK TO b;
SELECT bookname "bookname4" FROM Book 
  WHERE bookid=99;   
/*결과: 데이터베이스 개론 , SAVEPOINT: b 로 롤백 */

ROLLBACK TO a;
SELECT bookname "bookname5" FROM Book 
  WHERE bookid=99;    
/*결과: 데이터베이스 , SAVEPOINT: a 로 롤백*/
COMMIT;

UPDATE Book SET bookname='데이터베이스 개론 및 실습2' WHERE bookid=99; 
SELECT bookname "bookname6" FROM Book 
  WHERE bookid=99;    
/*결과: 데이터베이스 개론 및 실습2 */

ROLLBACK;
SELECT bookname "bookname5" FROM Book 
  WHERE bookid=99;    
/*결과: 데이터베이스 , 롤백 */
DELETE FROM  Book WHERE bookid=99;
COMMIT;