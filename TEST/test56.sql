-- 2022-01-19 (PROCEDURE => 자바와 연동)
-- PROCEDURE 호출하는 방법
-- 1. emp전체데이터 출력 (empno,ename,job,hiredate,sal,dname,loc,grade)
-- 자바에서 커서를 받는 경우에 사용하는 데이터형 : SYS_REFCURSOR
-- 자바 => ResultSet 
-- 오라클 단점 => 브라우저로 연결할 수 없다 
--                       ---------- 오라클 => 자바 => 브라우저 
CREATE OR REPLACE PROCEDURE empAllData(
       pResult OUT SYS_REFCURSOR
)
IS
BEGIN
   -- 1. 커서에 요청사항을 모아 둔다 
   OPEN pResult FOR
      SELECT empno,ename,job,hiredate,sal,dname,loc,grade
      FROM emp JOIN dept
      ON emp.deptno=dept.deptno
      JOIN salgrade 
      ON sal BETWEEN losal AND hisal;
END;
/ 
-- 2. emp사원 상세보기  