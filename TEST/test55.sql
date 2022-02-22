-- 2022-01-19 (PL/SQL => FUNCTION , PROCEDURE , TRIGGER)
/*
     ---------------------------------------------------------------
     PROCUDERE : ��� (�ݺ� ���)
                         => �ڹٿ��� ���ν����� ȣ���ϴ� ���  
     TRIGGER : �ڵ�ȭ ó�� 
                    => �԰� <==> ��� 
                    => ��� <==> ��� 
                    => ���� Ʈ���Ÿ� �̿��ؼ� �ڵ� ó��
                    => �󼼺��� <===> ��ȸ�� ���� 
     ---------------------------------------------------------------
     PL/SQL 
       1. ���� ����(�Ű�����) 
            = ***���� ���� (��Į�󺯼� => �Ϲ� ������������ ����)
               ������ ��������(CHAR,VARCHAR2,DATE,NUMBER)
            = ���� ���� (�̹� ������ ���̺��� �÷��� ���������� ������ �´�)
               1) �÷� �������� 1�� 
                   ***���̺��.�÷���%TYPE
               2) ���̺� ������ ��ü �÷��� �������� 
                   ���̺��%ROWTYPE
               3) �������� ���̺��� �÷����� ���� (������) => ����� ����
                   TYPE �������� IS RECORD(
                         ������ �÷� ���� (������ ����) 
                   )
       2. ��� 
       3. ������ 
            = ��������� (+,-,/,*) => ������ (MOD())
            = �񱳿����� (= , <> , < , > ,<= ,>=)
            = �������� (AND , OR , NOT)
            = IN (OR���) , BETWEEN ~ AND (����,�Ⱓ)
            = NULL : IS NULL , IS NOT NULL
            = LIKE (%(���ڿ�), _(�ѱ���))
       4. ���� �Լ� 
            = ������ �Լ�(����=> ROW)
               ���� 
                 LENGTH()
                 SUBSTR()
                 INSTR()
                 RPAD()
               ����
                 ROUND()
                 CEIL()
                 MOD()
               ��¥
                 SYSDATE 
                 MONTHS_BETWEEN
               ��ȯ
                 TO_CHAR => ��¥,���ں�ȯ 
               ��Ÿ  
                 NVL()
            = ���� �Լ� (����=> COLUMN)
               MAX() , COUNT() , SUM() , AVG() , RANK()
      ------------------ �Լ� (�������� ����(O): FUNCTION , �������� ����(X): PROCEDURE)
         class        ==> ��Ű��
         ---------------------------------- �Լ��� �������̴� (�Ű�����, ��������)
         �������  ==> ����
         �޼ҵ�     ==> ���ν���
         -------- �������̴�(Ŭ����)

         �Լ� VS �޼ҵ� 
         => ���� / ���� 
         
        ����) => CREATE : DBA
               CREATE [OR REPLACE] PROCEDURE pro_name(
                    �Ű����� ==> ��Į�� ����, %TYPE
                    ----------
                       ���� �� : IN
                       �޴� �� : OUT
               )
               IS
                   �������� 
               BEGIN
                   -- ������ : �ַ� SQL������ �̿��Ѵ� 
                      ���� �޴� ��� ==>  SELECT ~~ INTO (�޴°�)
                      ��� , ������ ����� ���� 
               END;
                /      
*/
-- emp ==> comm�� �о� �´� (comm�� 0�̰ų� NULL�� �����޾��� , ������ 500)
/*
    1. OUT ���� ���� 
       VARIABLE pMsg VARCHAR2(100)
    2. �Լ� ȣ�� 
      EXECUTE getCommData(7788,:pMsg)
                                                 --------
    3. ���
      PRINT pMsg 
*/
CREATE OR REPLACE PROCEDURE getCommData(
     vempno emp.empno%TYPE,
     vmsg OUT VARCHAR2)
IS
  -- �������� 
  vcomm emp.comm%TYPE;
BEGIN
  SELECT comm INTO vcomm
  FROM emp
  WHERE empno=vempno;

  IF (vcomm>0) THEN
    vmsg:='������:'||vcomm;
  ELSE
    vmsg:='������  ����';
  END IF;
END;
/
-- emp ==> ����̸��� �о� �´� 
/*
      �Ű����� 
        ����ڰ� ��û�� �� ===> IN (������ ����)
        ������� ��û ����� ==> OUT
*/
CREATE OR REPLACE PROCEDURE getManagerData(
    vename emp.ename%TYPE, 
    vmanager OUT emp.ename%TYPE
)
IS
    vmgr emp.mgr%TYPE;
    vname emp.ename%TYPE;
BEGIN
    -- MGR�� ������ �´� 
    SELECT mgr INTO vmgr
    FROM emp
    WHERE ename=vename;

    IF(vmgr>0) THEN
      SELECT ename INTO vname
      FROM emp
      WHERE empno=vmgr;
      
      vmanager:=vname;
    ELSE
      vmanager:='����� �����ϴ�';
    END IF;
END;
/

-- emp�� �ִ� ��� ����� ������ ��� 
-- �Ű������� ���� ��� => �Լ��� 
CREATE OR REPLACE PROCEDURE empListData
IS
  CURSOR cur IS
    SELECT * FROM emp;
  vemp emp%ROWTYPE;
BEGIN
  FOR vemp IN cur LOOP
   DBMS_OUTPUT.PUT_LINE(vemp.ename||' '||vemp.job||' '||vemp.hiredate);
   EXIT WHEN cur%NOTFOUND;
  END LOOP;
END;
/













