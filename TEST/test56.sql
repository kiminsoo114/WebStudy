-- 2022-01-19 (PROCEDURE => �ڹٿ� ����)
-- PROCEDURE ȣ���ϴ� ���
-- 1. emp��ü������ ��� (empno,ename,job,hiredate,sal,dname,loc,grade)
-- �ڹٿ��� Ŀ���� �޴� ��쿡 ����ϴ� �������� : SYS_REFCURSOR
-- �ڹ� => ResultSet 
-- ����Ŭ ���� => �������� ������ �� ���� 
--                       ---------- ����Ŭ => �ڹ� => ������ 
CREATE OR REPLACE PROCEDURE empAllData(
       pResult OUT SYS_REFCURSOR
)
IS
BEGIN
   -- 1. Ŀ���� ��û������ ��� �д� 
   OPEN pResult FOR
      SELECT empno,ename,job,hiredate,sal,dname,loc,grade
      FROM emp JOIN dept
      ON emp.deptno=dept.deptno
      JOIN salgrade 
      ON sal BETWEEN losal AND hisal;
END;
/ 
-- 2. emp��� �󼼺���  