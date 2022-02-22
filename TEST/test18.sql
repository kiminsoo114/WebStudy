-- 2022-01-07 오라클 (OUTER JOIN) => INNER JOIN+알파
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
            ================== FULL OUTER JOIN (+)를 사용하지 않는다 
                                                   => ANSI JOIN만 사용한다 
                                                   => 1, 2, 3, 4 ,5 , 6, 7 => UNION 
         3) 집합함수를 모아서 => 조인 
             ======
               INTERSECT  : 교집합 (같은 같일 경우에만 처리)
               MINUS       : 차집합 (같은 값을 제외하고 나머지를 가지고 온다 
                                 A(1,2,3,4,5) B(1,2,3,4,6,7)
                                 A-B => 5
                                 B-A => 6,7
               UNION        A(1,2,3,4,5) B(1,2,3,4,6,7)
                                 A UNION B => 1,2,3,4,5,6,7
               UNION ALL  A(1,2,3,4,5) B(1,2,3,4,6,7)
                                 A UNION ALL B => 1,2,3,4,5,1,2,3,4,6,7
                                
         4) OUTER JOIN의 형식 
             = 오라클 조인 
                  1. LEFT OUTER JOIN
                   SELECT A.col,B.col
                   FROM A,B
                   WHERE A.col=B.col(+)

                  2. RIGTH OUTER JOIN
                   SELECT A.col,B.col
                   FROM A,B
                   WHERE A.col(+)=B.col
             = ANSI 조인                
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
                  3. FULL OUTER JOIN => 오라클 조인은 존재하지 않는다
                   SELECT A.col,B.col
                   FROM A FULL OUTER JOIN B
                               ---------------------
                   ON A.col=B.col 

                   ==> 
                    SELECT 컬럼1.... (컬럼리스트)
                    FROM 테이블명 [LEFT|RIGHT|FULL] OUTER JOIN 테이블명
                    ON 조건 

                    SELECT 컬럼1.... (컬럼리스트)
                    FROM 테이블명  INNER JOIN 테이블명
                                           -------- 생략이 가능 
                    ON 조건                    
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

-- 교재 
SELECT * FROM customer;
SELECT * FROM orders;

-- 회원 전체 명단을 읽어 온다 (구매한 금액을 출력)
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

-- SELF => 테이블 1개로 조인 
SELECT empno , ename , mgr FROM emp;
-- INNER JOIN 
SELECT e1.ename  "본인", e1.job , e2.ename "사수", e2.job
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno;

SELECT e1.ename  "본인", e1.job , e2.ename "사수", e2.job
FROM emp e1 JOIN emp e2
ON e1.mgr=e2.empno;

-- LEFT OUTER JOIN (KING을 포함) 
SELECT e1.ename  "본인", e1.job , e2.ename "사수", e2.job
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno(+);

SELECT e1.ename  "본인", e1.job , e2.ename "사수", e2.job
FROM emp e1 LETF OUTER JOIN emp e2
ON e1.mgr=e2.empno;



-- RIGHT OUTER JOIN (사수가 아닌 사원 포함)
SELECT e1.ename  "본인", e1.job , e2.ename "사수", e2.job
FROM emp e1,emp e2
WHERE e1.mgr(+)=e2.empno;

SELECT e1.ename  "본인", e1.job , e2.ename "사수", e2.job
FROM emp e1 RIGHT OUTER JOIN emp e2
ON e1.mgr=e2.empno;


-- FULL OUTER JOIN (사수가 아닌 사원(8) + 사수가 없는 사원 포함(1))
SELECT e1.ename  "본인", e1.job , e2.ename "사수", e2.job
FROM emp e1 FULL OUTER JOIN emp e2
ON e1.mgr=e2.empno;











