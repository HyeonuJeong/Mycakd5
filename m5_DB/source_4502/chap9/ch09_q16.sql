--system
GRANT SELECT,INSERT ON mdguest2.Newtable  TO PROGRAMMER;

--mdguest 로 실행
 SET ROLE ALL;
INSERT INTO mdguest2.NewTable(myname, myphone)
	   VALUES ('홍길동', '000-000-0100');
COMMIT;

SELECT * 
FROM   mdguest2.NewTable;