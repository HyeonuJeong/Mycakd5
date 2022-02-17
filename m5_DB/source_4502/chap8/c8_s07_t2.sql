
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE Book 
SET     price=price+500
WHERE  bookid=1;

/*(쿼리를 실행하는 중 */
/* 대기 상태가 됨, T1이 COMMIT하면 실행됨 */

SELECT SUM(price) 총액
FROM   Book;


COMMIT;
