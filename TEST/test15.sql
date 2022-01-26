-- 2022-01-06 ����Ŭ (������ ����:SELECT) => �ΰ��̻��� ���̺��� ������ ����(JOIN)
-- ������ => �����ͺ��̽� (80%) => SQL (1�� => �����ͺ��̽�)
/*
      JOIN (����)
        ������ ���� 
           = �Ϲ� ���� (�ٸ� ���̺��� �����ؼ� ������ ����)
           = SELF JOIN (���� ���̺��� �����ؼ� ������ ����)
           ---------------------------------------------------------
           INNER JOIN => ������ ��� (NULL�� ��쿡 ó������ ���Ѵ�)
              ***(=) ������ ��� : EQUI JOIN (���� ����)
              (=���� �ٸ� ������ ���) : NON EQUI JOIN (�� ����)
                 �񱳿�����,��������,Between 
              = ����Ŭ ���� 
              = ǥ��ȭ(��� �����ͺ��̽�) => ANSI
           OUTER JOIN => NULL�� �����ؼ� �����͸� ���� 
                                  INNER JOIN+����
              = LEFT OUTER JOIN
              = RIGTH OUTER JOIN
              = FULL OUTER JOIN

*/
-- INNER JOIN 
/*
      1. ����Ŭ ����
          SELECT A.col,B.col
          FROM A,B
          WHERE A.col=B.col 

          == ��Ī 
          SELECT a.col,b.col
          FROM A a,B b
          WHERE a.col=b.col 
      2. ANSI ���� 
          SELECT A.col,B.col
          FROM A JOIN B
          ON A.col=B.col 

          == ��Ī 
          SELECT a.col,b.col
          FROM A a JOIN B b
          ON a.col=b.col   
*/
-- emp , dept => �ٸ� ���̺��� ������ ����
-- emp , emp���� ���� ==> Self Join  ==> ��� (��� => mgr)
-- �񱳽ÿ��� �÷����� ������� => ����Ǿ� �ִ� �����Ͱ��� ���� ���� ������ �ȴ�
SELECT e1.ename "����" ,e2.ename "���"
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno;

-- ���� ���ǿܿ� �ٸ� ������ �ִ� ��� ó�� (AND)
-- ��������� ���� => ����� , ���� , �Ի��� , �޿�(emp) , �μ��� , �ٹ���(dept)
-- ���� ==> �μ���ȣ�� 10�� ����鸸 ������ �´� 
-- ����Ŭ ����
SELECT empno,job,hiredate,sal,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND emp.deptno=10;

-- ANSI ���� 
SELECT empno,job,hiredate,sal,dname,loc
FROM emp JOIN dept
ON emp.deptno=dept.deptno
AND emp.deptno=10;

-- ��� ���� ���� : �̸� , ���� ,�Ի��� , �μ���, �ٹ���  => ���� 
-- ���� => ����̸��߿� A�ڸ� �����ϰ� �ִ� ������� ���� 
SELECT ename,job,hiredate,dname,loc 
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND ename LIKE '%A%';

SELECT ename,job,hiredate,dname,loc 
FROM emp JOIN dept
ON emp.deptno=dept.deptno
AND ename LIKE '%A%';

SELECT ename,job,hiredate,dname,loc 
FROM emp JOIN dept
ON emp.deptno=dept.deptno
AND REGEXP_LIKE(ename,'A');

-- ��� ���� ���� : �̸� , ���� ,�Ի��� , �μ���, �ٹ���  => ���� 
-- ���� => ����̸��߿� EN , IN �ڸ� �����ϰ� �ִ� ������� ���� 
-- ����̸� �߿� A,B,D,E,F
/*
    ename LIKE '%A%' OR ename LIKE '%B%'
              OR ename LIKE '%F%'
              OR ename LIKE '%D%'
              OR ename LIKE '%E%'
    ename ename IN('A','B','D','E','F')
    REGEXP_LIKE(ename,'A|B|D|E|F')

    A,B,C,D,E
    ename ename IN('A','B','C','D','E')
    REGEXP_LIKE(ename,'^[A-E]$')
*/
SELECT ename,job,hiredate,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND (ename LIKE '%EN%' OR ename LIKE '%IN%');

SELECT ename,job,hiredate,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND REGEXP_LIKE(ename,'IN|EN');

-- �� => NON EQUI_JOIN 
-- �����ڰ� =�� �ƴ� �ٸ� ������ ��� : BETWEEN ~ AND 
SELECT ename,sal 
FROM emp;

SELECT losal,hisal,grade
FROM salgrade;

-- ����� ���� ���� : �̸�,����,�Ի���, �޿�(emp) , ��� (salgrade)
SELECT ename,job,hiredate,sal,grade
FROM  emp,salgrade
WHERE sal BETWEEN losal AND hisal;

SELECT ename,job,hiredate,sal,grade
FROM  emp,salgrade
WHERE sal>=losal AND sal<=hisal;

SELECT ename,job,hiredate,sal,grade
FROM  emp JOIN salgrade
ON sal BETWEEN losal AND hisal;

-- ����� ������ ���� : �̸� , ���� , �Ի��� , �޿� , �μ��� , �ٹ��� , ���
--                             ---------------------------- emp ,--------dept  --salgrade
SELECT ename,job,hiredate,sal,dname,loc,grade 
FROM  emp,dept,salgrade
WHERE emp.deptno=dept.deptno
AND sal BETWEEN losal AND hisal;

-- ANSI 
SELECT ename,job,hiredate,sal,dname,loc,grade 
FROM emp JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal;

-- ����� ������ ���� : �̸� , ���� , �μ��� , �ٹ��� , ���, ����� 
SELECT e1.ename "����", e1.job , dname,loc , grade , e2.ename "�����"
FROM emp e1,emp e2,dept,salgrade 
-- ����� 
WHERE e1.mgr=e2.empno 
-- �μ��� , �ٹ���
AND e1.deptno=dept.deptno
-- �޿� ��� 
AND e1.sal BETWEEN losal AND hisal;

-- ANSI
SELECT e1.ename "����", e1.job , dname,loc , grade , e2.ename "�����"
FROM emp e1 JOIN emp e2
ON e1.mgr=e2.empno
JOIN dept 
ON e1.deptno=dept.deptno
JOIN salgrade
ON e1.sal BETWEEN losal AND hisal;


 
















