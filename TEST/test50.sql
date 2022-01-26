-- 2022-01-18 (PL/SQL => ���,������)
-- ��� + ������ + ���� = �Լ� 
-- ���ǹ� (���� ���ǹ�) => IF(���ǹ�) THEN ����� ~ END IF;
-- �μ� Ȯ��  (emp => �μ����� ���� �μ���ȣ 10,20,30)
SELECT * FROM emp;
-- ������Ʈ (1��) => �ݵ�� PL/SQL�� ������ ���α׷� ÷�� (�����Խ���=>���)
-- ���ν��� => ��� ������ ����� ��� ���� 
-- 274page 
/*
DECLARE 
   vename emp.ename%TYPE;
   vdname dept.dname%TYPE;
   vdeptno emp.deptno%TYPE;
   vempno emp.empno%TYPE:=&sabun;
BEGIN
   SELECT ename,deptno INTO vename,vdeptno
   FROM emp
   WHERE empno=vempno;

   -- ��쿡 ���� => INSERT , UPDATE , DELETE
   IF vdeptno=10 THEN
      vdname:='���ߺ�';
   END IF;
   
   IF (vdeptno=20) THEN
      vdname:='�ѹ���';
   END IF;

   IF (vdeptno=30) THEN
      vdname:='������';
   END IF;
   
   DBMS_OUTPUT.PUT_LINE('***** ��� *****');
   DBMS_OUTPUT.PUT_LINE('�̸�:'||vename);
   DBMS_OUTPUT.PUT_LINE('�μ���:'||vdname);
END;
/
*/
/*
-- IF~ELSE 
DECLARE 
  vename emp.ename%TYPE;
  vcomm emp.comm%TYPE;
BEGIN
  -- ���� �޴´� 
  SELECT ename,comm INTO vename,vcomm
  FROM emp
  WHERE empno=&sabun;
  -- NULL���� ����ó���� �� �� ���� => IF������ ������ ���ϰ� ELSE������ ���� 
  IF (vcomm>0) THEN 
   DBMS_OUTPUT.PUT_LINE(vename||'���� �������� '||vcomm||'�Դϴ�');    
  ELSE
   DBMS_OUTPUT.PUT_LINE(vename||'���� �������� �����ϴ�');
  END IF;
END;
/
*/
-- ���� ���ǹ� 
DECLARE 
   vename emp.ename%TYPE;
   vdname dept.dname%TYPE;
   vdeptno emp.deptno%TYPE;
   vempno emp.empno%TYPE:=&sabun;
BEGIN
   SELECT ename,deptno INTO vename,vdeptno
   FROM emp
   WHERE empno=vempno;

   -- ��쿡 ���� => INSERT , UPDATE , DELETE
   IF vdeptno=10 THEN
      vdname:='���ߺ�';
   ELSIF (vdeptno=20) THEN
      vdname:='�ѹ���';
   ELSIF (vdeptno=30) THEN
      vdname:='������';
   ELSE
     vdanme:='����';
   END IF;
   
   DBMS_OUTPUT.PUT_LINE('***** ��� *****');
   DBMS_OUTPUT.PUT_LINE('�̸�:'||vename);
   DBMS_OUTPUT.PUT_LINE('�μ���:'||vdname);
END;
/












