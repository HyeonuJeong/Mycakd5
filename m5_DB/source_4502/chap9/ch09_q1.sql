--c:\madang 폴더에 oradata가 생성되어있어야함.

CREATE TABLESPACE md_tbs
     DATAFILE 'C:\madang\oradata\md_tbs_data01.dbf'
     SIZE 10M;
     
     
CREATE TABLESPACE md_test
     DATAFILE 'C:\madang\oradata\md_test_data01.dbf'
     SIZE 10M;     

select * from user_tablespaces;