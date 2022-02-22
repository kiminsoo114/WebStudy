-- 2022-01-19 (FUNCTION,PROCEDURE)
/*
     FUNCTION : �̹� ������� �Լ� 
                       ----------------------
                        ������ �Լ�(LENGHT,SUBSTR...) , �����Լ�(SUM,MAX,COUNT...)
                       ����� ���� �Լ� (���� ��쿡 ���� ���) => PL/SQL
    1) ���� 
          RETURN �������� 
              ���ڿ� : RETURN VARCHAR2 
              ���� : RETURN NUMBER
          CREATE [OR REPLACE] FUNCTION func_name(�Ű�����....) RETURN ��������
                      ----------------- �������� ������ ���� 
          IS
            -- �������� 
          BEGIN
            -- ��û������ ���� 
            RETURN ��;
          END;
           /

        => ���� (�ǹ� => ȸ�縶�� ������� �Լ�) => �޴��� 
             SELECT func_name(��) 
	***����
	1.�м��ϱⰡ �����(SQL������ �� �� ����.)
	2.���ϰ��� �Ѱ� => �÷� �������� ������ �ö� �Լ��� ������ ����
	***����
	1.���� ����
	2.������ SQL������ �����ϰ� ���� �� �ִ�.
	***�ַ� ���ó(ERP) => ERP(���� �������� ���α׷� ����=>�������α׷�: ����,�λ�,�޿� ���鶧)
	***=����ڿ�(�ַ� �����ִ� ���� ...����, ��õ, ȸ������)
	=�����ڿ�(��������, ��ȭ...)
    2) ���� 
         DROP FUNCTION func_name;
    *** FUNCTION : �����Ŀ� ������� ������ �ִ� => SELECT ~ , FROM�ڿ��� �ַ� ���
         -------------- 1. ���� , 2. ���� ��� 
    *** (�ٽ�)PROCEDURE: ������� ���� �Լ� => ��� ó�� (������ �߰�,������ ������ ����..)
*/
-- JOIN => ���� 
-- emp���� �μ��� 
CREATE OR REPLACE FUNCTION getDname(vdeptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
   vdname dept.dname%TYPE;
BEGIN
   SELECT dname INTO vdname
   FROM dept
   WHERE deptno=vdeptno;
   RETURN vdname;
END;
/
-- emp���� �ٹ��� 
CREATE OR REPLACE FUNCTION getLoc(vdeptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
   vloc dept.loc%TYPE;
BEGIN
   SELECT loc INTO vloc
   FROM dept
   WHERE deptno=vdeptno;
   RETURN vloc;
END;
/
-- JOIN�� 
SELECT empno,ename,job,dname,loc
FROM emp , dept
WHERE emp.deptno=dept.deptno;
-- SUBQUERY��
SELECT empno,ename,job,
           (SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
           (SELECT loc FROM dept WHERE deptno=emp.deptno) loc
FROM emp;
           
-- �Լ����۽� ó�� 
SELECT empno,ename,job,getDname(deptno) dname,getLoc(deptno) loc
FROM emp;
/*
INSERT INTO student VALUES(1,'ȫ�浿',89,80,78);
INSERT INTO student VALUES(2,'�ڹ���',80,81,75);
INSERT INTO student VALUES(3,'�̼���',80,90,67);
INSERT INTO student VALUES(4,'�����',67,80,72);
INSERT INTO student VALUES(5,'��û��',85,89,90);
INSERT INTO student VALUES(6,'������',68,90,68);
INSERT INTO student VALUES(7,'�Ҽ���',90,95,90);
INSERT INTO student VALUES(8,'������',95,86,66);
COMMIT;
*/
-- ���� ��� => ���� , ��� 
CREATE OR REPLACE FUNCTION stdSum(vhakbun student.hakbun%TYPE)
RETURN NUMBER
IS
  --�������� => ����,����,���� => ���� ���༭ �����ϴ� ���� 
  total NUMBER(3);
BEGIN
  SELECT kor+eng+math INTO total
  FROM student 
  WHERE hakbun=vhakbun;
  RETURN total;
END;
/

-- ��� 
CREATE OR REPLACE FUNCTION stdAvg(vhakbun student.hakbun%TYPE)
RETURN NUMBER
IS
  avg2 NUMBER;
BEGIN
  SELECT ROUND((kor+eng+math)/3,2) INTO avg2
  FROM student
  WHERE hakbun=vhakbun;
  RETURN avg2;
END;
/
SELECT hakbun,name,kor,eng,math,stdSum(hakbun) total,stdAvg(hakbun) avg
FROM student;







