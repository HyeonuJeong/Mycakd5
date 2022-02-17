
SET TRANSACTION NAME 'T2';

UPDATE Book 
SET     price=price*1.1
WHERE  bookid=2;

UPDATE Book 
SET     price=price*1.1
WHERE  bookid=1;
/* …(대기상태)… */

COMMIT;