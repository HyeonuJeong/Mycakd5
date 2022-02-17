SET TRANSACTION NAME 'T2';

SELECT * 
FROM   Book
WHERE  bookid=1;

UPDATE Book 
SET     price=price+100
WHERE  bookid=1;

SELECT * 
FROM   Book
WHERE  bookid=1;


COMMIT;