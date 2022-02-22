-- 2022-01-18 (267page -> PL/SQL)
/*
    ���α׷��� �̿��ؼ� ����Ŭ �����͸� ���� �� �� �ִ� 
    �Ϲ� �� �̿��ؼ� ����� => JDBC(�ڹ�) , ODBC(C/C++) 
    ����Ŭ ��ü���� ó�� => PL/SQL (���ν��� , �Լ� , Ʈ���Ÿ� �����ϴ� ���) 
    ------------------------     ---------- �ݺ��� ���� , ������ �ʿ��� ����� �ʿ�ÿ� 
                                                   �ڵ�ȭ ó�� (Ʈ����) 
    ���ν��� : �������� ���� �Լ� (�Ϲ� ��� ó��) 
    �Լ�       : �������� ������ �ִ� �Լ� (substr(),trim() ....) => ����� ���� �Լ� 
    Ʈ����  : �ڵ�ȭ ó�� 
                 �԰�  ==> ���(�ڵ�ȭ)
                 ���  ==> ���(�ڵ�ȭ)
    page 270 => PL/SQL�� (ERP)  ==> �ǹ� (���� => �޴���) => �ڹٿ��� ��밡��
    PL (���ν��� ���) 
      = ���� ���� 
         1. ��Į�� ���� 
             ename VARCHAR2(10)
             deptno NUMBER(4)
         2. �������� (�÷� 1��) ==> %TYPE (���� ���� ����)
             vename emp.ename%TYPE
             vdname dept.dname%TYPE
         3. �������� (���̺��� ��ü �÷� ����)
             vemp emp%ROWTYPE ==> ~VO
         4. ����� ���� (JOIN,SUBQUERY)
             TYPE empdept IS RECORD(
                  �������� ..
                  ��������...
             )
         5. Ŀ�� : List ==> ��� ��� , ������ ������ 
            CURSOR cur IS
             SELECT * FROM emp;
            => �����Խ��� (���)
      = ������ 
         1. ��������� ( + , - , * , / ) => ������ : MOD()
         2. �񱳿����� ( = , <> , < , > , <= , >= )
         3. �������� ( AND , OR , NOT )
         4. IN 
         5. BETWEEN ~ AND 
         6. LIKE
         7. NULL => IS NULL , IS NOT NULL
      = ��� 
         1. ���ǹ� 
             = ���� ���ǹ� 
                 IF(���ǹ�) THEN 
                     �����
                 END IF;
             = ���� ���ǹ� 
                IF(���ǹ�) THEN 
                    �����(���ǹ� => true)
                ELSE
                    �����(���ǹ� => false)
                END IF;
             = ���� ���ǹ� 
                IF (���ǹ�) THEN
                     ����� 
                ELSIF(���ǹ�) THEN
                     ����� 
                ELSIF(���ǹ�) THEN
                     ����� 
                ELSE
                   ����� 
                END IF
         2. ���ù� 
                CASE
                   WHEN ���� THEN ����� => case 
                   WHEN ���� THEN ����� => case
                   WHEN ���� THEN ����� => case
                   ELSE ����� => default 
                END;
         3. �ݺ��� 
             = BASIC LOOP
                LOOP 
                  SQL���� 
                  SQL���� 
                END LOOP;
             = WHILE 
                WHILE (���ǹ�) LOOP
                   �ݺ����� (SQL)
                END LOOP;
             = FOR 
                FOR ���� [REVERSE] IN lo..hi LOOP
                   ó������ 
                END LOOP;

               ��)
                      ������ ���
                      FOR i IN 1..10 LOOP
                        ��¹���
                      END LOOP; => 1~10

                      �������� ��� 
                      FOR i REVERSE IN 1..10 LOOP
                        ��¹���
                      END LOOP; => 10~1

             PL/SQL ���� 
             1) ������ (����)
                 DECLARE
                    ���� ���� ��ġ 
                 BEING 
                    ���� (SQL) => ��� 
                 END;
                  /

            2) PROCEDURE 
                CREATE [OR REPLACE] PROCEDURE pro_name(�Ű����� , �Ű�����)
                IS
                  ���� ���� (��������)
                BEGIN
                   ���� (SQL���� ����)
                END;
                 /

            3) FUNCTION
                CREATE [OR REPLACE] FUNCTION func_name(�Ű����� , �Ű�����)
                : RETURN ��������
                IS
                  ���� ���� (��������)
                BEGIN
                   ���� (SQL���� ����)
                   RETURN ��
                END;
                 /

           2) TRIGGER
                CREATE [OR REPLACE] TRIGGER tri_name(�Ű����� , �Ű�����)
                IS
                  ���� ���� (��������)
                BEGIN
                   ���� (SQL���� ����)
                END;
                 /      
*/
-- ��Į�� ���� ���� 
-- ȭ�鿡 ��� 
set serveroutput on;
/*
DECLARE
  vename VARCHAR2(20);
  vjob VARCHAR2(10);
BEGIN
   -- ������ ���� ä��� 
   SELECT ename,job  INTO vename,vjob 
   FROM emp
   WHERE empno=7788;
   -- ȭ�鿡 ��� 
   DBMS_OUTPUT.PUT_LINE('***** ���� ��� *****');
   DBMS_OUTPUT.PUT_LINE('�̸�:'||vename);
   DBMS_OUTPUT.PUT_LINE('����:'||vjob);

END;
/
*/
-- %TYPE (�÷��� ���������� ������ �ö� ��� => 1��) => ���� ���� ����ϴ� ������ 
DECLARE 
  -- ���� ����� 
  vename emp.ename%TYPE;
  vdname dept.dname%TYPE;
  vjob emp.job%TYPE;
  vloc dept.loc%TYPE;
BEGIN 
   -- ���� => SQL�������� ���� 
   -- ������ ���� ä�ﶧ SELECT ~ INTO 
   SELECT ename,job,dname,loc INTO vename,vjob,vdname,vloc
   FROM emp,dept
   WHERE emp.deptno=dept.deptno
   AND empno=7788;
   
   -- ������ ��� 
   DBMS_OUTPUT.PUT_LINE('***** ��� *****');
   DBMS_OUTPUT.PUT_LINE('�̸�:'||vename);
   DBMS_OUTPUT.PUT_LINE('����:'||vjob);
   DBMS_OUTPUT.PUT_LINE('�μ�:'||vdname);
   DBMS_OUTPUT.PUT_LINE('�ٹ���:'||vloc);
END;
/
  






