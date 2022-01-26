-- 2022-01-18 (PL/SQL :반복문)
/*
     WHILE 
     FOR ******** ROW의 갯수가 존재 
*/
/*
      WHILE (조건) LOOP
       반복 수행문장 
       증가식 (++,--(X))
      END LOOP;
*/
DECLARE
  no NUMBER:=1;
BEGIN
  WHILE (no<=10) LOOP
   DBMS_OUTPUT.PUT_LINE(no);
   no:=no+1;
  END LOOP;
END;
/

DECLARE
BEGIN
  FOR i IN REVERSE 1..10 LOOP
   DBMS_OUTPUT.PUT_LINE(i);
  END LOOP;
END;
/
