-- 2022-01-04 SELECT 연습문제(연산자 포함)
-- 앞문장은 조건 뒤문장은 출력할 컬럼 
/*
      테이블명 : emp
      사원번호 : empno
      사원명 : ename
      급여 : sal
      입사일자 : hiredate
      직업 : job
     부서번호 : deptno
      성과급: comm
*/
-- 비교연산자 (=)
-- <<1>>  부서 번호가 10번인 부서의 사람 중 사원번호, 이름, 급여를 출력하라.
SELECT empno,ename,sal
FROM emp
WHERE  deptno=10;
-- 비교연산자 (=)
-- <<2>>  사원번호가 7698인 사람 중 이름, 입사일자, 부서번호를 출력하라.
SELECT ename,hiredate,deptno
FROM emp
WHERE empno=7698;
-- 비교연산자 (=) ==> 문자열 / 날짜 => ''
-- <<3>>  이름이 ALLEN인 사람의 모든 정보를 출력하라.
SELECT  *
FROM emp
WHERE ename='ALLEN';
-- 비교연산자 (=)
-- <<4>>  입사일자가 83/01/12인 사원의 이름, 부서 번호, 급여를 출력하라.
SELECT ename,deptno,sal
FROM emp
WHERE hiredate='83/01/12';
-- 비교연산자 (!= , <>)
-- 저장된 데이터는 대소문자를 구분한다 
-- <<5>>  직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE job<>'MANAGER';
-- 비교연산자 (=)
-- <<6>>  입사일자가 81/04/02 이후에 입사한 사원의 정보를 출력하라.
SELECT * 
FROM emp
WHERE hiredate>'81/04/02';
-- 비교연산자 (>=)
-- <<7>>  급여가 $800이상인 사람의 이름, 급여, 부서 번호를 출력하라.
SELECT  ename,sal,deptno
FROM emp
WHERE sal>=800;
-- 비교연산자 (>)
-- <<8>>  부서번호가 20번 이상인 사원의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE deptno>=20;
-- 비교연산자 (>) => 알파벳 순서 => 날짜,문자열 
-- <<9>>  성명이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE ename>'K';
-- 비교연산자 (>)   
-- <<10>>  입사일자가 81/12/03 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
SELECT  * 
FROM  emp
WHERE hiredate<'81/12/03';
-- 비교연산자 ( <= ) 
-- <<11>>  입사번호가 7698 보다 작거나 같은 사람들의 입사번호와 이름을 출력하라.
SELECT empno,ename
FROM emp
WHERE	empno<=7698;
-- 논리연산자 ( AND ) => BETWEEN 연산자 
-- <<12>>  입사일자가 81/04/02 보다 늦고 82/12/09 보다 빠른 사원의 이름, 월급, 부서 번호를 출력하라.
SELECT ename,sal,deptno
FROM emp
WHERE hiredate>='81/04/02' AND hiredate<='82/12/09';

SELECT ename,sal,deptno
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';
-- 논리연산자 ( AND)
-- <<13>>  급여가 1,600 보다 크고 $3,000보다 작은 사람은 이름, 직무, 급여를 출력하라.
SELECT ename,job,sal
FROM emp
WHERE sal>1600 AND sal<3000;
-- NOT BETWEEN 
-- <<14>>  사원번호가 7654와 7788 사이 이외의 사원의 모든 정보를 출력하라.
SELECT * 
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7788;
-- BETWEEN
-- <<15>> 이름이 B와 J 사이의 모든 사원의 정보를 출력하라.
SELECT *
FROM emp
WHERE ename BETWEEN 'B' AND 'J';
-- NOT LIKE
-- <<16>>  입사일자가 81년 이외에 입사한 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate NOT LIKE '81%';

SELECT *
FROM emp
WHERE NOT (hiredate>='81/01/01' AND hiredate<='81/12/31');

SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';
-- OR,IN
-- <<17>>  직무가 MANAGER와 SALESMAN인 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE job IN('MANAGER','SALESMAN'); 

SELECT *
FROM emp
WHERE job='MANAGER' OR job='SALESMAN';
-- NOT IN
-- <<18>>  부서 번호와 20,30번을 제외한 모든 사람의 이름, 사원번호, 부서 번호를 출력하라.
SELECT ename,empno,deptno
FROM emp
WHERE deptno NOT IN(20,30);

SELECT ename,empno,deptno
FROM emp
WHERE NOT (deptno=20 OR deptno=30);
-- LIKE	
-- <<19>>  이름이 S로 시작하는 사원의 사원번호, 이름, 입사일자, 부서번호를 출력하라.
SELECT empno,ename,hiredate,deptno
FROM emp
WHERE ename LIKE 'S%';
-- LIKE
-- <<20>>  입사일자가 81년도인 사람의 모든 정보를 출력하라.
SELECT *
FROM emp
WHERE hiredate LIKE '81%';
-- LIKE
-- <<21>>  이름 중 S자가 들어가 있는 사람만 모든 정보를 출력하라.
SELECT * 
FROM emp
WHERE ename LIKE '%S%';
-- LIKE 
-- <<22>>  이름이 S로 시작하고 마지막 글자가 T인 사람의 모든 정보를 출력하라 (단, 이름은 전체 5자리이다.>> 
SELECT *
FROM emp
WHERE  ename LIKE 'S___T';                 
-- LIKE (_ , %)
-- <<23>>  첫 번째 문자는 관계없고 두 번째 문자가 A인 사람의 정보를 출력하라.
SELECT *
FROM emp
WHERE ename LIKE '_A%';
-- NULL    
-- <<24>>  커미션이 NULL인 사람의 정보를 출력하라.
SELECT * 
FROM emp
WHERE comm IS NULL;	
-- NULL
-- <<25>>  커미션이 NULL이 아닌 사람의 모든 정보를 출력하라.
SELECT * 
FROM emp
WHERE comm IS NOT NULL;	
-- AND 
-- <<26>>  부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급을 출력하라.
SELECT ename,deptno,sal
FROM emp
WHERE deptno=30 AND sal>=1500;
-- AND
-- <<27>>  이름의 첫 글자가 K로 시작하거나 부서 번호가 30인 사람의 사원번호, 이름, 부서 번호를 출력하라.
SELECT empno,ename,deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno=30;
-- AND 	
-- <<28>>  급여가 $1,500이상이고 부서 번호가 30번인 사원 중 직업이 MANAGER인 사람의 정보를 출력하라.
SELECT *
FROM emp
WHERE sal>=1500 AND deptno=30 AND job='MANAGER';