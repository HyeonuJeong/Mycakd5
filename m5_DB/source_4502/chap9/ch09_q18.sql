--system
DROP ROLE programmer;

--기존 세션이 commit 되지 않은경우 에러가 발생할수 있음
DROP TABLE mdguest2.NewTable;
