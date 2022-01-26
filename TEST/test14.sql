-- 2022-01-06 (157page~) 162page JOIN 
/*
      JOIN : 여러개의 테이블에서 사용자 요청한 데이터만 추출 
               ------------------- 영화  / 음악 --- 테이블 (관련된 내용만 저장)
                                       영화명 OST 
      1. JOIN 종류
          INNER JOIN => INTERSECT (교집합)
               = ***EQUI_JOIN (같은 값을 가지고 있는 경우) ==> (=)
                  두개의 값을 비교해서 같은 값이 있는 경우에 
                  해당 ROW에 있는 모든 컬럼값을 사용 할 수 있다 
               = NON_EQUI_JOIN (=외의 연산자를 사용) => 비교연산자 , 논리연산자
                                                                              BETWEEN ~ AND 
               *** 같은 테이블에서 조인을 사용할 수 있다 (SELF JOIN)
                    -------------
               ----------------------
               = NATURAL 조인 
               = JOIN ~ USING 
               ---------------------- 테이블에 같은 컬럼명이 존재할 경우에 사용이 가능 
               *** 단점 : NULL일 경우에는 처리 할 수 없다 (연산자를 사용하기 때문에)
                            ------------------------- 보완 : OUTER JOIN
          OUTER JOIN : NULL을 포함해서 데이터를 읽어 올 수 있다 
          A ,      B
          no      no
        name    goods
      2. JOIN 문법 
               = 오라클 조인 (오라클에서만 사용)
               = EQUI_JOIN(동등조인) => 같은 값을 가지고 있는 경우에 사용되는 조인
               SELECT name,goods 
               FROM A,B
               WHERE A.no=B.no => 같은 이름의 컬럼일 경우에는 반드시 
                                          테이블명.컬럼 , 별칭.컬럼 
               ===>같은 이름의 컬럼명인데 지정하지 않으면 에러 (애매한 정의)
               SELECT name,goods
               FROM A a,B b =====> 별칭 (테이블명이 긴 경우에 주로 사용) 
               WHERE a.no=b.no 
               = ANSI 조인 (표준화) => 모든 데이터베이스에서 공통으로 사용되는 JOIN
                                                 ---------------------
                                                  Oracle, MS-SQL , MYSQL , MariaDB...
               ==> JOIN ~ ON(조건문)
               SELECT name,goods
               FROM A INNER JOIN B
                           -------- 생략이 가능 
               ON A.no=B.no

               SELECT name,goods
               FROM A JOIN B
               ON A.no=B.no
      3. JOIN의 데이터 추출  
*/
-- 사원 정보 => 부서번호(deptno) 
SELECT * FROM emp;
-- 부서 정보 => 부서번호(deptno) , 부서명 (dname) , 근무지 (loc)
SELECT * FROM dept;
-- emp에 등록된 사원의 사원명, 부서명(dept) , 근무지(dept) , 직위 , 입사일(emp)
SELECT ename,dname,loc,job,hiredate
FROM emp,dept
WHERE emp.deptno=dept.deptno;
-- ANSI 조인 
-- 실무에서는 대기업이 아니면 => 오라클을 사용하지 않는다 (MySQL,MariaDB)
-- 금융권 , 학교 => DB2
-- 오라클 JOIN ==> ANSI 조인 
-- FROM에서 , => JOIN
-- WHERE => ON
SELECT ename,dname,loc,job,hiredate
FROM emp JOIN dept
ON emp.deptno=dept.deptno;
-- 테이블과 테이블이 => 같은 컬럼명을 가지고 있어야 사용이 가능 
-- 자연 조인 
SELECT ename,dname,loc,job,hiredate
FROM emp NATURAL JOIN dept;
-- JOIN ~ USING
SELECT ename,dname,loc,job,hiredate
FROM emp JOIN dept USING(deptno);

-- 주의점  --> deptno (emp,dept) => 어디서 읽어 올것인지 설정 
-- 애매 정의 --> 컬러명을 확인 한다 
-- 비교하는 컬럼이 다를 수도 있다 (같은 값을 가지고 있으면 된다)
SELECT ename,job,dname,loc,emp.deptno
FROM emp,dept
WHERE emp.deptno=dept.deptno;

-- 별칭 사용 => FROM 테이블명 별칭 => 테이블명이 긴 경우
-- 테이블 대신 SELECT문장을 이용한 경우 (subquery)
SELECT ename,job,dname,loc 
FROM emp e,dept d
WHERE e.deptno=d.deptno;
-- 조인 ==> 댓글 , 마이페이지 , 결제 ...













