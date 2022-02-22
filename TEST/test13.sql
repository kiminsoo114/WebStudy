-- 2022-01-06 GROUP BY 
/*
      
      GROUP BY : �׷��� ������ (�׷캰�� ó��)
      HAVING : �׷�ȿ��� ���� ó���� �ϴ� ��ɹ� 
      ----------- GROUP BY�� �ִ� ���¿����� ����� ���� 
      SELECT 
      FROM 
      HAVING  ===> ���� 

     SELECT
     FROM 
     WHERE 
     HAVING   ===> ���� 
*/
/*
set pagesize 30
SELECT deptno,sal 
FROM emp
ORDER BY deptno;
*/
-- �μ���(10,20,30) �ο���, �޿����� , �޿� ��� , �ִ�޿� , �ּұ޿� 
-- �μ����� => �μ��� �׷����� �����ϸ� => �μ��� ó���� ���� 
-- ROUND(AVG(sal)) , ROUND(AVG(sal),0) => ���� =>�Ҽ��� ���� ��� 
SELECT deptno "�μ�",
           COUNT(*) "�ο���",
           SUM(sal) "�޿�����",
           ROUND(AVG(sal)) "�޿����",
           MAX(sal) "�ִ�޿�",
           MIN(sal) "�ּұ޿�"
FROM emp
GROUP BY deptno
ORDER BY deptno ASC;

-- �������� ������ => �ο���  ==> �μ��� , ������ , �⵵�� 
SELECT job , COUNT(*) "�ο���"
FROM emp
GROUP BY job
ORDER BY job DESC;

-- �⵵�� ó�� 
SELECT hiredate , COUNT(*) "�ο���"
FROM emp
GROUP BY hiredate
ORDER BY hiredate ASC;

SELECT TO_CHAR(hiredate,'YYYY') "�Ի�⵵" , COUNT(*) "�ο���"
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY')
ORDER BY TO_CHAR(hiredate,'YYYY') ASC;

-- ���Ϻ� �׷� ó�� 
SELECT TO_CHAR(hiredate,'DY') "�Ի����" , COUNT(*) "�ο���"
FROM emp
GROUP BY TO_CHAR(hiredate,'DY');
-- �׷��� �÷��� ����ϴ� ���� �ƴϰ� => �Լ��� �̿��ؼ� �׷��� ���� �� �� �ִ� 
-- �׷캰 ������ ���� ==> GROUP BY ���� ������ HAVING , �Ϲ� ���� => WHERE 
-- HAVING�� ���ǹ� => �׻� GROUP BY�� �ִ� ��쿡�� ����� ���� 
/*
      ����Ŭ SELECT���� ����Ǵ� ���� 
      SELECT     =====> 5
      FROM      =====> 1
      WHERE      =====> 2
      GROUP BY ====> 3
      HAVING    =====> 4
      ORDER BY  ===> 6

      SELECT     =====> 3
      FROM      =====> 1
      WHERE      =====> 2
      ORDER BY  ===> 4
*/
-- ����߿� ��պ��� ���� �޴� ����� ���μ��� ����� �ִ��� Ȯ�� 
-- ���μ��� �ο��� 2���̻��� �μ��� ��� 
SELECT deptno,COUNT(*) "�ο���"
FROM emp
WHERE sal>2073
GROUP BY deptno
HAVING COUNT(*)>=2
ORDER BY deptno ASC;

-- ����߿� �޿��� ��պ��� ���� �޴� ����� �⵵���� ������� Ȯ�� 
-- HAVING������ �����Լ��� ����� �� �ִ� (WHERE������ ��� �� �� ����)
SELECT TO_CHAR(hiredate,'YYYY') "�Ի�⵵",COUNT(*) "�ο���"
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY')
HAVING COUNT(*)>=2
ORDER BY TO_CHAR(hiredate,'YYYY') ASC;
/*
       161 page 

       SELECT job , SUM(sal)
       FROM emp
       GROUP BY deptno;  --- ����  ==> job , deptno�� ��ġ�� �ʵ� 

       SELECT job , SUM(sal)
                 -----
       FROM emp
       GROUP BY deptno;
                      --------- job

       SELECT job,SUM(sal)
       FROM emp
       GROUP BY job
       HAVING COUNT(*)>=2
       WHERE sal>2073
       ORDER BY job ASC; --- ���� : SELECT������ ������ Ʋ��

       SELECT job,SUM(sal)
       FROM emp
       WHERE sal>2073
       GROUP BY job
       HAVING COUNT(*)>=2
       ORDER BY job ASC;

      => GROUP BY ==> �б⺰ ��� , �м� (��Ƽ�����̺�) => �б⺰,�μ��� 
                                                           ----------------- DBA
      => �����α׷��� : �̹� ������� ���̺�(�÷� => �����ͼ���) => ���� (DML:CRUD)
           --------------- DML(SELECT , INSERT , UPDATE , DELETE)
           ������ ����, ���̺� ���� ==> ������Ʈ (�䱸����,�����ͺ��̽�����,����)
           ==> ȭ�� UI => ���� ==> ��ǥ => ���� 

     162page ==> �ΰ��̻��� ���̺��� ������ ���� 
                         -------------------- ���� 
*/




