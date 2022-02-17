SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT SUM(price) รัพื
FROM   Book;
 

UPDATE Book 
SET     price=price+500
WHERE  bookid=1;

SELECT SUM(price) รัพื 
FROM   Book;

COMMIT;