-- 2022-01-12 (View) 
/*
     View Ư¡ , ���� , ���� 
     -----------
       = �������̺� (������ ���̺��� �����ؼ� ����) 
       = ������ ���� , ���� , SQL������ �ܼ�ȭ ��Ų�� 
          ----------------------------------------------------- 
       = �����ϰ� �ִ� ���̺��� ������ �ش� (����,����,�߰�)
       = View���� ���� �����Ͱ� ����� ���� �ƴϰ� SQL������ ����Ǿ� �ִ� 
     View ���� 
       = �ܼ� �� : ���̺� 1�� ���� 
       = ���� �� : ���̺� ������ ���� (JOIN,SubQuery)
       = �ζ��� �� : ���̺� ��� SELECT 
     �ɼ� ���� 
       = WITH CHECK OPTION  : DML�� ���� (default)  ==> SELECT,INSERT,UPDATE,DELETE
       = WITH READ ONLY : �б� ���� (*********) ==> SELECT

     ����) 
              CREATE [OR REPLACE] VIEW view_name
              ---------------------------
              AS
               SELECT ~~

              *** CREATE VIEW ==> ���� ==> DROP ==> CREATE 
              *** CREATE OR REPLACE VIEW ==> ���� ==> ���� 

              ���� 
              -----
               DROP VIEW view_name;         
*/
-- ���̺� ���� (emp,dept)
/*
DROP TABLE myEmp;
CREATE TABLE myEmp
AS
  SELECT * FROM emp;

DROP TABLE myDept;
CREATE TABLE myDept
AS
  SELECT * FROM dept;
*/

-- �� ���� (myDept) => ������ ���̺��� �����͸� �о� �´� (���̺��� ���� ��쿡�� ���� �� ����)
-- ������ ���̺��� �����͸� ����ÿ� ��� 
-- �ܼ��� (DML) ==> READ ONLY�Ӽ����� ���� 
/*
  CREATE VIEW dept_view 
  AS
  SELECT * FROM myDept;
*/
/*
conn system/happy
GRANT CREATE VIEW TO hr;
conn hr/happy
CREATE VIEW dept_view 
AS
SELECT * FROM myDept;

   CSS =>���� , �±�
*/

SELECT * FROM dept_view;

SELECT * 
FROM (SELECT * FROM myDept)

-- �߰� 
-- INSERT INTO dept_view VALUES(50,'������','����');
-- COMMIT;

-- ���� 
/*
UPDATE dept_view SET
dname='���ߺ�' , loc='��õ'
WHERE deptno=50;
COMMIT;
*/
-- ����
/*
DELETE FROM dept_view
WHERE deptno=50;
COMMIT;
*/

--SELECT * FROM dept_view;
--SELECT * FROM myDept;

-- View => ��� (�б�����) 
/*
DROP VIEW dept_view;

CREATE VIEW dept_view
AS
  SELECT * FROM myDept
  WITH READ ONLY;
-- WITH CHECK OPTION : Default (DML�� ����� �� �ִ� => ���̺� ������ �ش�)
-- INSERT 
INSERT INTO dept_view VALUES(50,'���ߺ�','����');
COMMIT;
*/
-- ���� �� (�ΰ��̻��� ���̺� ����) => �̸� ���� ���Ǵ� SQL�� ������ ������ ���
-- SQL������ �ܼ�ȭ ��ų�� ����Ѵ� 
-- VIEW�ȿ��� ���� �����Ͱ� �����ϴ� ���� �ƴ϶� AS �ؿ� �ִ� SQL������ ����Ǿ� �ִ� 
CREATE OR REPLACE VIEW empDept_view
AS
  SELECT empno,ename,job,hiredate,sal,dname,loc,grade
  FROM emp,dept,salgrade
  WHERE emp.deptno=dept.deptno
  AND sal BETWEEN losal AND hisal;

-- ����� ���,�̸� , ����,�Ի��� , �޿� ,�μ���,�ٹ��� , �޿� ��� ��� 
SELECT empno,ename,job,hiredate,sal,dname,loc,grade
FROM emp JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal;

SELECT * FROM empDept_view;
SELECT * FROM (SELECT empno,ename,job,hiredate,sal,dname,loc,grade
  FROM emp,dept,salgrade
  WHERE emp.deptno=dept.deptno
  AND sal BETWEEN losal AND hisal);
-- �̸� ,�޿� ,�μ��� , ��� 
SELECT ename,sal,dname,grade FROM empDept_view;
-- �� (SQL������ ���� ����) , �ζ��κ� (������ �� ����)
SELECT owner,constraint_name,constraint_type,status
FROM user_constraints
WHERE table_name='FOOD_HOUSE';

SELECT owner,constraint_name,table_name,column_name
FROM user_cons_columns
WHERE table_name='CATEGORY';









