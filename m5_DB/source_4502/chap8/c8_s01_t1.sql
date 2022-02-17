SET TRANSACTION NAME 'T1';

SELECT * 
FROM   Book
WHERE  bookid=1;

UPDATE Book 
SET     price=7100
WHERE  bookid=1;

SELECT * 
FROM   Book
WHERE  bookid=1;



COMMIT;