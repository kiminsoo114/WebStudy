-- 2022-01-19 (PL/SQL => Function , Procedure) => JDBC 
/*
      ����Ŭ : DML(SELECT : LIKE,JOIN,SUBQUERY)
                  => INSERT , UPDATE , DELETE 
                 -------------------------------------------- �����α׷����� �Թ�
                  DDL => TABLE , VIEW , SEQUENCE 
                              -------- �������� , �������� 
                  TCL  => COMMIT / ROLLBACK
      JDBC �ַ� 
      ================> JDBC / Spring (Full Stack : JavaScript)
                                          -------              --------------------------
                                          MyBatis              Ajax , Vue(Vuex) , React(Redux)
      Ŭ���� ���� / ���� (��������ɾ�) 
      ---------- AWS 

     1) CURSOR ���� ==> ����Ŭ���� �����͸� ��Ƽ� �ڹٷ� ���� 
        ----------- ResultSet (������ , ������...)
     
     ���� (����Ŭ) => ROW,Record 
       Ʃ�� : ROW(����)
       ī��δ�Ƽ : Ʃ�� ������ ��Ƶ� �� 
     2) PL/SQL 
          ����
            ���پ� ���� (�ѻ�� , �Ѱ��� ����)
               ��Į�󺯼� : ����Ŭ�� �Ϲ� ���� ( ���� �������� )
                           �������� : CHAR , CLOB , VARCHAR2 , NUMBER , DATE
               ���� ���� 
                  = %TYPE => �÷��Ѱ��� �������� �б�
                  = %ROWTYPE => ���̺� ��ü �÷��� �������� �б�
                  = ����� ���� : RECORD
       
            ������ ���� (���̺� ��ü)
                  = CURSOR
                  = ����
                       CURSOR cur_name IS
                           SELECT * FROM emp;
*/
-- CURSOR ���� (emp) (emp,dept) => JOIN
-- �Ѱ��� ���̺� �����͸� ��Ƽ� ���� 
-- ����Ŭ => C/C++ => ������ �̸� �����ϰ� ��� , ������ 
-- ���� : �������� , �Ű����� 
-- IN => �Ϲݺ��� (Call By Value)
-- OUT => �����ͺ��� (Call By Reference)
-- INOUT => �Ϲ� , ������ 
/*
     vemp emp%ROWTYPE;
     class vemp
     {
          int empno;
          String ename,job;
          Date hiredate;
          int mgr,deptno,sal,comm;
     }

    Cursor => List

    FOR vemp IN cur LOOP
    for(Emp emp:list)
*/
/*
DECLARE 
  -- ���� ����� (�Ű�����,��������)
  vemp emp%ROWTYPE; -- EMP�� ������ �ִ� ��� �÷��� �������� ����
  -- �����͸� ��Ƽ� ó��
  CURSOR cur IS
   SELECT * FROM emp; 
BEGIN
  -- {} => ������ 
  -- Ŀ���� �ִ� ������ ��� 
  FOR vemp IN cur LOOP
    -- SET SERVEROUTPUT ON
    DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
    -- ������� => �����Ͱ� ���̻� ������ �ȵǴ� ���� => NOTFOUND
    EXIT WHEN cur%NOTFOUND;
    /*
        %NOTFOUND : ã�� �����Ͱ� ���� (������ ����)
        %FOUND : ã�� �����Ͱ� �ִ� ���� 
        %ROWCOUNT : Ŀ���� �ִ� ������ �Ѱ���
        %ISOPEN : Ŀ����  OPEN ���� 
        ------------ 
               ���� : 1. OPEN(rs.next) , 2. FETCH(rs.getInt()) , 3. CLOSE(rs.close())
    */
  END LOOP;
END;
/
*/
-- JOIN�� �ִ� ��� (���̺��� ������ ����) => %ROWTYPE�� ��� �� �� ���� 
/*
       empno , ename , job , hiredate, mgr , sal, comm,deptno
       ------------------------------------------------------------------ emp
       deptno,dname,loc
       --------------------- dept 

      vemp emp%ROWTYPE  
      vemp�� ���Ե� ������ (empno , ename , job , hiredate, mgr , sal, comm,deptno)
      vdept dept%ROWTYPE 
      vdept (deptno,dname,loc)
*/
DECLARE 
   -- �������� => ������ ����� �޴� �������� ���� (RECORD: ����� ����)
   TYPE empDept IS RECORD(
       empno emp.empno%TYPE,
       ename emp.ename%TYPE,
       job emp.job%TYPE,
       hiredate emp.hiredate%TYPE,
       sal emp.sal%TYPE,
       dname dept.dname%TYPE,
       loc dept.loc%TYPE
   );
   ed empDept;
   -- �����͸� ��Ƶд� => CURSOR 
   CURSOR cur IS
    SELECT empno,ename,job,hiredate,sal,dname,loc
    FROM emp,dept
    WHERE emp.deptno=dept.deptno;
BEGIN
   -- FOR���� ����ؼ� �����͸� ó������ ���������� ���پ� ���� 
   FOR ed IN cur LOOP
     DBMS_OUTPUT.PUT_LINE(ed.empno||' '||ed.ename||' '||
                    ed.job||' '||ed.hiredate||' '||ed.sal||' '||ed.dname||' '||ed.loc);
     EXIT WHEN cur%NOTFOUND;
   END LOOP; 
   -- �о�� �����͸� ��� , �ڹٷ� ���� 
END;
/












