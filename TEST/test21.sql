-- 2022-01-10 오라클 서브쿼리 
/*
     1. 오라클에서 지원하는 서브쿼리의 종류
         = 서브쿼리 : SQL문장 여러개를 합쳐서 1개의 SQL문장을 만들어서 처리 
            (조인 : 서로 다른 데이터를 합쳐서 한개로 출력)
         = 서브쿼리를 사용하는 위치 
            1) 테이블 복사 
                CERATE TABLE my_emp
                AS
                 SELECT * FROM emp
            2) SELECT + SELECT 
                SELECT ~
                WHERE 컬럼명 연산자 (SELECT ~)
            3) SELECT  (SELECT ~) , (SELECT ~)
               FROM 테이블 
               (스칼라 서브쿼리) => 컬럼 대신 사용 
            4) SELECT 
                FROM (SELECT ~)  
               (인라인뷰 , Top-N) => 테이블 대신 사용 
            5) INSERT , UPDATE , DELETE에서도 사용이 가능 

        = 서브쿼리 
                SELECT + SELECT 
                SELECT ~
                WHERE 컬럼명 연산자 (SELECT ~)
            ***= 단일행 (서브쿼리에서 실행된 결과값 1개) 서브쿼리 (컬럼 1개)
            ***= 다중행 (서브쿼리에서 실행된 결과값 여러개) 서브쿼리 (컬럼 1개)
            = 컬럼이 여러개 (다중 컬럼 서브쿼리), 연관 서브쿼리 
            ***= 인라인뷰 
            ***= 스칼라 서브쿼리 

            오라클에서 처리 (X) ==> 스프링에서 처리 (원격:네트워크=> SQL문장을 최소화)
            ============ 연습  =====(JSP 전송: 자바연결) 

            웹 프로그래머 
                           주소란               SQL (오라클을 실행하는 방법)
            브라우저     ===== 자바  ====== 오라클 
               화면UI/요청     요청 받기            데이터 저장소
                                    응답 하기
                             ============== 웹 프로그래머 (테이블 생성....)
                             ***요청을 받아서 데이터 읽기/쓰기/수정/삭제 
                                                    ==================(CURD) => 게시판 
*/
-- ***단일행 (컬럼 1개 , 실행 결과값 1개) => 연산자 사용이 간단 
SELECT deptno 
FROM emp
WHERE ename='KING'; 
-- ***다중행 (컬럼 1개 , 실행 결과값 여러개) => 코틀린 , 파이썬 => ;를 생략
-- 연산처리 => 실행된 결과를 처리 , 한개만 처리 
--                  IN (전체 처리 가능) => 10,20,30, 최소값 , 최대값
--                  IN(10,20,30) , MAX(10,20,30) ,MIN(10,20,30) => ANY , SOME, ALL
/*
          WHERE 컬럼명 > ANY(10,20,30) => 최소값  컬럼명 > 10
                                  MIN(10,20,30) => 10
          WHERE 컬럼명 < ANY(10,20,30) => 최대값  컬럼명 < 30
                                  MAX(10,20,30) => 30 
          WHERE 컬럼명 = ANY(10,20,30) => IN과 동일 (10,20,30) 
          WHERE 컬럼명 > ALL(10,20,30)  => 최대값 (30)
          WHERE 컬럼명 < ALL(10,20,30)  => 최소값 (10)
*/
SELECT DISTINCT deptno
FROM emp;
-- 다중 컬럼 ( 컬럼 여러개 , 실행 결과 여러개, 1개)
SELECT deptno,sal 
FROM emp
WHERE deptno=10;

-- 단일행 서브쿼리 : 사원의 평균 급여보다 급여가 많은 사원들의 이름,급여 
-- 2073
SELECT AVG(sal) FROM emp;
SELECT ename,sal
FROM emp
WHERE sal>2073;

SELECT ename,sal
FROM emp
WHERE sal>(SELECT AVG(sal) FROM emp);

-- SCOTT와 같은 부서에서 근무하는 사원의 부서명과 근무지 이름을 출력 
-- --------------------- 부서번호 , 구한 부서의 부서명,근무지, 이름 
SELECT deptno 
FROM emp
WHERE ename='SCOTT';

SELECT ename,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND emp.deptno=20;

SELECT ename,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND emp.deptno=(SELECT deptno 
                           FROM emp
                           WHERE ename='SCOTT');
-- 170page => 부속질의 (서브쿼리)
/*
     클래스 : 조(반) 
     패키지 : 꾸러미 
*/
-- 20번 부서에서 최대급여를 받는 사원과 이상을 받는 사원의 이름 , 부서명, 근무지
-- ---------------------------------------- 최대 급여를 구한다 
SELECT MAX(sal) 
FROM emp
WHERE deptno=20;
-- 3000 이상인 사원의 이름 , 부서명 , 근무지 
SELECT ename,dname,loc
FROM emp,dept 
WHERE emp.deptno=dept.deptno
AND sal>=3000;

SELECT ename,dname,loc
FROM emp,dept 
WHERE emp.deptno=dept.deptno
AND sal>=(SELECT MAX(sal) 
                FROM emp
                WHERE deptno=20);
-- 성과급을 최대로 받는 사원의 이름 , 부서명 , 근무지 
-- -----------------------------
SELECT MAX(comm) 
FROM emp
WHERE comm IS NOT NULL;

SELECT ename,dname,loc
FROM emp,dept 
WHERE emp.deptno=dept.deptno
AND comm=1400;

SELECT ename,dname,loc
FROM emp,dept 
WHERE emp.deptno=dept.deptno
AND comm=(SELECT MAX(comm) 
                   FROM emp
                   WHERE comm IS NOT NULL);
-- 171page 
-- 서브쿼리에서 실행한 결과값 여러개의 값을 가지고 오는 경우 
-- 전체 대입 (IN(서브쿼리))
-- emp에 있는 모든 부서를 가지고 와서  => 부서별 , 사원의 이름 , 입사일 , 근무지 ,부서명 
SELECT DISTINCT deptno
FROM emp;
-- 모든 데이터를 처리 
SELECT ename,hiredate,loc,dname,emp.deptno
FROM emp,dept 
WHERE emp.deptno=dept.deptno
AND emp.deptno IN(SELECT DISTINCT deptno FROM emp)
ORDER BY deptno ASC;

-- 여러개의 데이터중에 1개만 대입 => 10,20,30 ==>  (<) 최대값 (30),(>) 최소값(10) 
-- 최대값 
SELECT MAX(deptno) 
FROM emp;
-- 최소값 
SELECT MIN(deptno)
FROM emp;

-- 부서중에 최대값보다 작은 부서번호의 이름 , 부서번호 
SELECT ename,deptno
FROM emp
WHERE deptno<(SELECT MAX(deptno) 
                        FROM emp);

SELECT ename,deptno
FROM emp
WHERE deptno>(SELECT MIN(deptno)
                        FROM emp);

/*
    < ANY|SOME(SQL)
              SQL문장 실행 결과중에 최대값을 가지고 온다  
    > ANY|SOME(SQL) 
             SQL문장 실행 결과중에 최소값을 가지고 온다  
*/
SELECT ename,deptno
FROM emp
WHERE deptno<ANY(SELECT DISTINCT deptno 
                        FROM emp);

SELECT ename,deptno
FROM emp
WHERE deptno>ANY(SELECT DISTINCT deptno 
                        FROM emp);

SELECT ename,deptno
FROM emp
WHERE deptno<SOME(SELECT DISTINCT deptno 
                        FROM emp);

SELECT ename,deptno
FROM emp
WHERE deptno>SOME(SELECT DISTINCT deptno 
                        FROM emp);

/*
        >ALL (최대값)
        <ALL (최소값) 
*/
SELECT ename,deptno
FROM emp
WHERE deptno>=ALL(SELECT DISTINCT deptno 
                         FROM emp);
SELECT ename,deptno
FROM emp
WHERE deptno<=ALL(SELECT DISTINCT deptno 
                         FROM emp);

-- ANY에서 연산자 = (IN하고 같은 결과를 가지고 온다)
SELECT ename,deptno,hiredate,sal
FROM emp
WHERE deptno = ANY(SELECT DISTINCT deptno FROM emp);
SELECT ename,deptno,hiredate,sal
FROM emp
WHERE deptno IN(SELECT DISTINCT deptno FROM emp);
-- 오라클은 여러개의 SQL을 이용해서 같은 결과를 가지고 올 수 있다 (단점)
-- SQL을 사용하는 사람 (DBA,웹프로그래머 => SQL문장 틀릴 수도 있다)
-- 반복문 (for , while, do~while)
-- 오라클 자체 수업 (웹 프로그램에 관련된 오라클) 
-- 176page (집합연산) => 조인 
-- UNOIN , UNION ALL , INSTERSECT , MINUS
/*
     INNER JOIN => INTERSECT (교집합)
     OUTER JOIN
      왼쪽 A , 오른쪽 B
      LEFT OUTER JOIN => INTERSECT + MINUS (A-B)  
      RIGHT OUTER JOIN => INTERSECT + MINUS (B-A) 
      FULL OUTER JOIN   => UNION ALL
      
     A (1,2,3,4,5)
     B (1,2,3,6,7)
     UNION (중복된 데이터는 1번만 수행)
     --------
         1,2,3,4,5,6,7
     UNION ALL (중복된 데이터를 읽어 온다)
     --------------
         1,2,3,4,5,1,2,3,6,7

     INTERSECT (같은 값이 있는 경우) : EQUI JOIN
     -------------
         1,2,3
     MINUS (없는 값을 읽어 온다)  : OUTER JOIN
     ---------
       A-B ( 4, 5 ) => LEFT
       B-A ( 6, 7)  => RIGHT
*/
DROP TABLE t1;
FROP TABLE t2;
CREATE TABLE t1(no NUMBER);
CREATE TABLE t2(no NUMBER);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(2);
INSERT INTO t1 VALUES(3);
INSERT INTO t1 VALUES(4);
INSERT INTO t1 VALUES(5);

INSERT INTO t2 VALUES(1);
INSERT INTO t2 VALUES(2);
INSERT INTO t2 VALUES(3);
INSERT INTO t2 VALUES(6);
INSERT INTO t2 VALUES(7);
COMMIT;
-- UNOIN : 중복을 1번 제거 => 1,2,3,4,5,6,7
SELECT no
FROM t1
UNION
SELECT no
FROM t2;

-- UNION ALL: 중복이 있는 데이터 전체 => 1,2,3,4,5,1,2,3,6,7
/*SELECT no
FROM t1
UNION ALL
SELECT no
FROM t2;*/
-- INTERSECT
SELECT no
FROM t1
INTERSECT
SELECT no
FROM t2;

-- MINUS  (t1-t2=> 4,5) 
SELECT no
FROM t1
MINUS
SELECT no
FROM t2;
-- (t2-t1=> 6,7)
SELECT no
FROM t2
MINUS
SELECT no
FROM t1;













