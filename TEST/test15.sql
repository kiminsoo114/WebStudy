-- 2022-01-06 오라클 (데이터 추출:SELECT) => 두개이상의 테이블에서 데이터 추출(JOIN)
-- 웹개발 => 데이터베이스 (80%) => SQL (1차 => 데이터베이스)
/*
      JOIN (조인)
        조인의 종류 
           = 일반 조인 (다른 테이블을 연결해서 데이터 추출)
           = SELF JOIN (같은 테이블을 연결해서 데이터 추출)
           ---------------------------------------------------------
           INNER JOIN => 연산자 사용 (NULL일 경우에 처리하지 못한다)
              ***(=) 연산자 사용 : EQUI JOIN (동등 조인)
              (=외의 다른 연산자 사용) : NON EQUI JOIN (비등가 조인)
                 비교연산자,논리연산자,Between 
              = 오라클 전용 
              = 표준화(모든 데이터베이스) => ANSI
           OUTER JOIN => NULL을 포함해서 데이터를 추출 
                                  INNER JOIN+알파
              = LEFT OUTER JOIN
              = RIGTH OUTER JOIN
              = FULL OUTER JOIN

*/
-- INNER JOIN 
/*
      1. 오라클 조인
          SELECT A.col,B.col
          FROM A,B
          WHERE A.col=B.col 

          == 별칭 
          SELECT a.col,b.col
          FROM A a,B b
          WHERE a.col=b.col 
      2. ANSI 조인 
          SELECT A.col,B.col
          FROM A JOIN B
          ON A.col=B.col 

          == 별칭 
          SELECT a.col,b.col
          FROM A a JOIN B b
          ON a.col=b.col   
*/
-- emp , dept => 다른 테이블에서 데이터 추출
-- emp , emp에서 조인 ==> Self Join  ==> 사수 (사번 => mgr)
-- 비교시에는 컬럼명은 관계없고 => 저장되어 있는 데이터값이 같은 것이 있으면 된다
SELECT e1.ename "본인" ,e2.ename "사수"
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno;

-- 조인 조건외에 다른 조건이 있는 경우 처리 (AND)
-- 사원정보를 추출 => 사원명 , 직위 , 입사일 , 급여(emp) , 부서명 , 근무지(dept)
-- 조건 ==> 부서번호가 10인 사원들만 가지고 온다 
-- 오라클 조인
SELECT empno,job,hiredate,sal,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND emp.deptno=10;

-- ANSI 조인 
SELECT empno,job,hiredate,sal,dname,loc
FROM emp JOIN dept
ON emp.deptno=dept.deptno
AND emp.deptno=10;

-- 사원 정보 추출 : 이름 , 직위 ,입사일 , 부서명, 근무지  => 조인 
-- 조건 => 사원이름중에 A자를 포함하고 있는 사원들의 정보 
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

-- 사원 정보 추출 : 이름 , 직위 ,입사일 , 부서명, 근무지  => 조인 
-- 조건 => 사원이름중에 EN , IN 자를 포함하고 있는 사원들의 정보 
-- 사원이름 중에 A,B,D,E,F
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

-- 비등가 => NON EQUI_JOIN 
-- 연산자가 =이 아닌 다른 연산자 사용 : BETWEEN ~ AND 
SELECT ename,sal 
FROM emp;

SELECT losal,hisal,grade
FROM salgrade;

-- 사원의 정보 추출 : 이름,직위,입사일, 급여(emp) , 등급 (salgrade)
SELECT ename,job,hiredate,sal,grade
FROM  emp,salgrade
WHERE sal BETWEEN losal AND hisal;

SELECT ename,job,hiredate,sal,grade
FROM  emp,salgrade
WHERE sal>=losal AND sal<=hisal;

SELECT ename,job,hiredate,sal,grade
FROM  emp JOIN salgrade
ON sal BETWEEN losal AND hisal;

-- 사원의 정보를 추출 : 이름 , 직위 , 입사일 , 급여 , 부서명 , 근무지 , 등급
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

-- 사원의 정보를 추출 : 이름 , 직위 , 부서명 , 근무지 , 등급, 사수명 
SELECT e1.ename "본인", e1.job , dname,loc , grade , e2.ename "사수명"
FROM emp e1,emp e2,dept,salgrade 
-- 사수명 
WHERE e1.mgr=e2.empno 
-- 부서명 , 근무지
AND e1.deptno=dept.deptno
-- 급여 등급 
AND e1.sal BETWEEN losal AND hisal;

-- ANSI
SELECT e1.ename "본인", e1.job , dname,loc , grade , e2.ename "사수명"
FROM emp e1 JOIN emp e2
ON e1.mgr=e2.empno
JOIN dept 
ON e1.deptno=dept.deptno
JOIN salgrade
ON e1.sal BETWEEN losal AND hisal;


 
















