-- 2022-01-18 (PL/SQL => ����) 
/*
      ���� => 1���� ���� ������ �� �ִ� 
      �Ϲ� ����  (������ ��������) => ��Į�󺯼�
          name VARCHAR2(20); 
      ������ �ִ� �÷��� ���������� �о� �´� 
         => �÷� 1�� ������ : %TYPE
              name emp.ename%TYPE
         => ���̺� ��ü �÷� ������ : %ROWTYPE
              vemp emp%ROWTYPE
         => JOIN , SubQuery => ���̺� 2������ �����͸� ������ �´� 
              ����� ���� �������� 
              RECORD 
         ------------------------------------ �Ѱ��� ���� �����͸� ���� (ROW)
         ------------------------------------ ~VO
         => ��ü ���̺��� ������ �б� : CURSOR 
         ------------------------------------ List

        �Ϲ� ������ (PL/SQL)
        ����� 
        ������

        DECLARE -- ����� 
           ���� ���� (������)

        BEGIN
           ������ -- SQL���� ó�� 
           ����ó���� 
        END;
          / 
*/
-- emp���� �̸�,����,�Ի���,�޿��� ������ �޾Ƽ� ���
SET SERVEROUTPUT ON; 
/*
DECLARE 
   -- ���� ���� (%TYPE : ���� ���̺� �÷��� ������ �ִ� �������� ����)
   vename emp.ename%TYPE;
   vjob emp.job%TYPE;
   vday emp.hiredate%TYPE;
   vsal emp.sal%TYPE;
BEGIN
   -- ���� (�޼ҵ� {})
   -- �����͸� �о�ͼ� ������ ���� 
   SELECT ename,job,hiredate,sal INTO vename,vjob,vday,vsal
   FROM emp
   WHERE empno=7788;
   -- ����� ������ ���� ó�� 
   --  ��� 
   DBMS_OUTPUT.PUT_LINE('***** ����� *****');
   DBMS_OUTPUT.PUT_LINE(vename||' '||vjob||' '||vday||' '||vsal);
END;
/
*/
-- �Է��� �޾Ƽ� ó�� 
SET LINESIZE 250;
SELECT * FROM emp;
/*
DECLARE 
  -- ename�� ���� ���� 
  vempno emp.empno%TYPE:=&sabun;
  -- �Ϲݺ��� (��Į�󺯼�)
  vename VARCHAR2(20);
  vjob VARCHAR2(20);
  vday DATE;
BEGIN
   SELECT ename,job,hiredate INTO vename,vjob,vday
   FROM emp
   WHERE empno=vempno;
   
   -- ��� 
   DBMS_OUTPUT.PUT_LINE('***** ��� *****');
   DBMS_OUTPUT.PUT_LINE(vename||'  '||vjob||'   '||vday);
END;
/
*/
/*
-- ���̺� ��ü�� �������� ���� 
DECLARE 
  vemp emp%ROWTYPE;
  -- vemp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
BEGIN
  -- ������ �ޱ� 
  SELECT * INTO vemp
  FROM emp
  WHERE empno=7788;

   -- ��� 
   DBMS_OUTPUT.PUT_LINE('***** ��� *****');
   DBMS_OUTPUT.PUT_LINE('�̸�:'||vemp.ename);
   DBMS_OUTPUT.PUT_LINE('����:'||vemp.job);
   DBMS_OUTPUT.PUT_LINE('�Ի���:'||vemp.hiredate);
   DBMS_OUTPUT.PUT_LINE('�޿�:'||vemp.sal);
   DBMS_OUTPUT.PUT_LINE('������:'||vemp.comm);
END;
/
*/
-- ����� ���� => RECORD (ROW����) => ~VO�� ���� ���  
DECLARE
  -- ����� ���� �������� ����� (�������� ���̺��� ������ ����)
  -- emp_dept_salgrade �������� 
  TYPE emp_dept_salgrade IS RECORD(
        ename emp.ename%TYPE,
        job emp.job%TYPE,
        day emp.hiredate%TYPE,
        sal emp.sal%TYPE,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE,
        grade salgrade.grade%TYPE
  ); 
  -- ���� ���� 
  eds emp_dept_salgrade;
BEGIN
   SELECT ename,job,hiredate,sal,dname,loc,grade INTO eds
   FROM emp JOIN dept
   ON emp.deptno=dept.deptno
   JOIN salgrade
   ON sal BETWEEN losal AND hisal
   WHERE empno=7788;
   
   -- ��� 
   DBMS_OUTPUT.PUT_LINE('***** ��� *****');
   DBMS_OUTPUT.PUT_LINE('�̸�:'||eds.ename);
   DBMS_OUTPUT.PUT_LINE('����:'||eds.job);
   DBMS_OUTPUT.PUT_LINE('�Ի���:'||eds.day);
   DBMS_OUTPUT.PUT_LINE('�޿�:'||eds.sal);
   DBMS_OUTPUT.PUT_LINE('�μ���:'||eds.dname);
   DBMS_OUTPUT.PUT_LINE('�ٹ���:'||eds.loc);
   DBMS_OUTPUT.PUT_LINE('���:'||eds.grade);
END;
/  

  

  










