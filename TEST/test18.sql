-- 2022-01-07 ����Ŭ (OUTER JOIN) => INNER JOIN+����
/*
      OUTER JOIN 
        = LEFT OUTER JOIN 
        = RIGTH OUTER JOIN
        = FULL OUTER JOIN

        LEFT OUTER JOIN
        LEFT     RIGHT    ==> FORM emp(LEFT) , dept(RIGHT) 
         A           B
         1           1
         2           2
         3           3
         4           4
         5           6
                      7

        1) INNER JOIN   FROM A , B
            ================== WHER A.col=B.col  ==> 1,2,3,4
        2) OUTER JOIN  FROM A,B
            ================== WHERE A.col=B.col(+) ==> 1,2,3,4,(5) 
                                                                             ----- LEFT
            ==> A INTERSECT B + A MINUS B
                   ===========  ========
                       1,2,3,4                   5   
            ================== WHERE A.col(+)=B.col ==> 1,2,3,4,6,7
                                                                   ------ RIGHT 
            ==> A INTERSECT B + B MINUS A
                   ==========    ========
                      1, 2, 3, 4              6, 7
            ================== FULL OUTER JOIN (+)�� ������� �ʴ´� 
                                                   => ANSI JOIN�� ����Ѵ� 
                                                   => 1, 2, 3, 4 ,5 , 6, 7 => UNION 
         3) �����Լ��� ��Ƽ� => ���� 
             ======
               INTERSECT  : ������ (���� ���� ��쿡�� ó��)
               MINUS       : ������ (���� ���� �����ϰ� �������� ������ �´� 
                                 A(1,2,3,4,5) B(1,2,3,4,6,7)
                                 A-B => 5
                                 B-A => 6,7
               UNION        A(1,2,3,4,5) B(1,2,3,4,6,7)
                                 A UNION B => 1,2,3,4,5,6,7
               UNION ALL  A(1,2,3,4,5) B(1,2,3,4,6,7)
                                 A UNION ALL B => 1,2,3,4,5,1,2,3,4,6,7
                                
         4) OUTER JOIN�� ���� 
             = ����Ŭ ���� 
                  1. LEFT OUTER JOIN
                   SELECT A.col,B.col
                   FROM A,B
                   WHERE A.col=B.col(+)

                  2. RIGTH OUTER JOIN
                   SELECT A.col,B.col
                   FROM A,B
                   WHERE A.col(+)=B.col
             = ANSI ����                
                  1. LEFT OUTER JOIN
                   SELECT A.col,B.col
                   FROM A LEFT OUTER JOIN B
                               ---------------------
                   ON A.col=B.col

                  2. RIGHT OUTER JOIN
                   SELECT A.col,B.col
                   FROM A RIGTH OUTER JOIN B
                               ---------------------
                   ON A.col=B.col 
                  3. FULL OUTER JOIN => ����Ŭ ������ �������� �ʴ´�
                   SELECT A.col,B.col
                   FROM A FULL OUTER JOIN B
                               ---------------------
                   ON A.col=B.col 

                   ==> 
                    SELECT �÷�1.... (�÷�����Ʈ)
                    FROM ���̺�� [LEFT|RIGHT|FULL] OUTER JOIN ���̺��
                    ON ���� 

                    SELECT �÷�1.... (�÷�����Ʈ)
                    FROM ���̺��  INNER JOIN ���̺��
                                           -------- ������ ���� 
                    ON ����                    
*/
/*
           LEFT               RIGHT
       emp                dept 
       deptno            deptno
       10,20,30          10,20,30,40
*/
-- LEFT

SELECT ename, job , hiredate , dname , loc
FROM emp , dept 
WHERE emp.deptno=dept.deptno;

SELECT ename, job , hiredate , dname , loc
FROM emp , dept 
WHERE emp.deptno=dept.deptno(+);

SELECT ename, job , hiredate , dname , loc
FROM emp , dept 
WHERE emp.deptno(+)=dept.deptno;

-- ���� 
SELECT * FROM customer;
SELECT * FROM orders;

-- ȸ�� ��ü ����� �о� �´� (������ �ݾ��� ���)
SELECT name,saleprice
FROM customer c,orders o
WHERE c.custid = o.custid;

SELECT name,saleprice
FROM customer c,orders o
WHERE c.custid = o.custid(+);
/*
CREATE TABLE test1(
     no NUMBER
);
CREATE TABLE test2(
     no NUMBER
);
*/
/*
     INNER => 1,2,3 + 5,7 (test1-test2) 

*/
/*
INSERT INTO test1 VALUES(1);
INSERT INTO test1 VALUES(2);
INSERT INTO test1 VALUES(3);
INSERT INTO test1 VALUES(5);
INSERT INTO test1 VALUES(7);

INSERT INTO test2 VALUES(1);
INSERT INTO test2 VALUES(2);
INSERT INTO test2 VALUES(3);
INSERT INTO test2 VALUES(6);
INSERT INTO test2 VALUES(9);

COMMIT;
*/

-- SELF => ���̺� 1���� ���� 
SELECT empno , ename , mgr FROM emp;
-- INNER JOIN 
SELECT e1.ename  "����", e1.job , e2.ename "���", e2.job
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno;

SELECT e1.ename  "����", e1.job , e2.ename "���", e2.job
FROM emp e1 JOIN emp e2
ON e1.mgr=e2.empno;

-- LEFT OUTER JOIN (KING�� ����) 
SELECT e1.ename  "����", e1.job , e2.ename "���", e2.job
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno(+);

SELECT e1.ename  "����", e1.job , e2.ename "���", e2.job
FROM emp e1 LETF OUTER JOIN emp e2
ON e1.mgr=e2.empno;



-- RIGHT OUTER JOIN (����� �ƴ� ��� ����)
SELECT e1.ename  "����", e1.job , e2.ename "���", e2.job
FROM emp e1,emp e2
WHERE e1.mgr(+)=e2.empno;

SELECT e1.ename  "����", e1.job , e2.ename "���", e2.job
FROM emp e1 RIGHT OUTER JOIN emp e2
ON e1.mgr=e2.empno;


-- FULL OUTER JOIN (����� �ƴ� ���(8) + ����� ���� ��� ����(1))
SELECT e1.ename  "����", e1.job , e2.ename "���", e2.job
FROM emp e1 FULL OUTER JOIN emp e2
ON e1.mgr=e2.empno;











