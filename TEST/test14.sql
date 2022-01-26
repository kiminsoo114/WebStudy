-- 2022-01-06 (157page~) 162page JOIN 
/*
      JOIN : �������� ���̺��� ����� ��û�� �����͸� ���� 
               ------------------- ��ȭ  / ���� --- ���̺� (���õ� ���븸 ����)
                                       ��ȭ�� OST 
      1. JOIN ����
          INNER JOIN => INTERSECT (������)
               = ***EQUI_JOIN (���� ���� ������ �ִ� ���) ==> (=)
                  �ΰ��� ���� ���ؼ� ���� ���� �ִ� ��쿡 
                  �ش� ROW�� �ִ� ��� �÷����� ��� �� �� �ִ� 
               = NON_EQUI_JOIN (=���� �����ڸ� ���) => �񱳿����� , ��������
                                                                              BETWEEN ~ AND 
               *** ���� ���̺��� ������ ����� �� �ִ� (SELF JOIN)
                    -------------
               ----------------------
               = NATURAL ���� 
               = JOIN ~ USING 
               ---------------------- ���̺� ���� �÷����� ������ ��쿡 ����� ���� 
               *** ���� : NULL�� ��쿡�� ó�� �� �� ���� (�����ڸ� ����ϱ� ������)
                            ------------------------- ���� : OUTER JOIN
          OUTER JOIN : NULL�� �����ؼ� �����͸� �о� �� �� �ִ� 
          A ,      B
          no      no
        name    goods
      2. JOIN ���� 
               = ����Ŭ ���� (����Ŭ������ ���)
               = EQUI_JOIN(��������) => ���� ���� ������ �ִ� ��쿡 ���Ǵ� ����
               SELECT name,goods 
               FROM A,B
               WHERE A.no=B.no => ���� �̸��� �÷��� ��쿡�� �ݵ�� 
                                          ���̺��.�÷� , ��Ī.�÷� 
               ===>���� �̸��� �÷����ε� �������� ������ ���� (�ָ��� ����)
               SELECT name,goods
               FROM A a,B b =====> ��Ī (���̺���� �� ��쿡 �ַ� ���) 
               WHERE a.no=b.no 
               = ANSI ���� (ǥ��ȭ) => ��� �����ͺ��̽����� �������� ���Ǵ� JOIN
                                                 ---------------------
                                                  Oracle, MS-SQL , MYSQL , MariaDB...
               ==> JOIN ~ ON(���ǹ�)
               SELECT name,goods
               FROM A INNER JOIN B
                           -------- ������ ���� 
               ON A.no=B.no

               SELECT name,goods
               FROM A JOIN B
               ON A.no=B.no
      3. JOIN�� ������ ����  
*/
-- ��� ���� => �μ���ȣ(deptno) 
SELECT * FROM emp;
-- �μ� ���� => �μ���ȣ(deptno) , �μ��� (dname) , �ٹ��� (loc)
SELECT * FROM dept;
-- emp�� ��ϵ� ����� �����, �μ���(dept) , �ٹ���(dept) , ���� , �Ի���(emp)
SELECT ename,dname,loc,job,hiredate
FROM emp,dept
WHERE emp.deptno=dept.deptno;
-- ANSI ���� 
-- �ǹ������� ������ �ƴϸ� => ����Ŭ�� ������� �ʴ´� (MySQL,MariaDB)
-- ������ , �б� => DB2
-- ����Ŭ JOIN ==> ANSI ���� 
-- FROM���� , => JOIN
-- WHERE => ON
SELECT ename,dname,loc,job,hiredate
FROM emp JOIN dept
ON emp.deptno=dept.deptno;
-- ���̺�� ���̺��� => ���� �÷����� ������ �־�� ����� ���� 
-- �ڿ� ���� 
SELECT ename,dname,loc,job,hiredate
FROM emp NATURAL JOIN dept;
-- JOIN ~ USING
SELECT ename,dname,loc,job,hiredate
FROM emp JOIN dept USING(deptno);

-- ������  --> deptno (emp,dept) => ��� �о� �ð����� ���� 
-- �ָ� ���� --> �÷����� Ȯ�� �Ѵ� 
-- ���ϴ� �÷��� �ٸ� ���� �ִ� (���� ���� ������ ������ �ȴ�)
SELECT ename,job,dname,loc,emp.deptno
FROM emp,dept
WHERE emp.deptno=dept.deptno;

-- ��Ī ��� => FROM ���̺�� ��Ī => ���̺���� �� ���
-- ���̺� ��� SELECT������ �̿��� ��� (subquery)
SELECT ename,job,dname,loc 
FROM emp e,dept d
WHERE e.deptno=d.deptno;
-- ���� ==> ��� , ���������� , ���� ...













