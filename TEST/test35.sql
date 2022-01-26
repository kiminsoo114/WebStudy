-- 2022-01-12 오라클 (rownum) : 가상으로 ROW마다 번호를 지정 (1부터 순차적으로 지정) 
/*
      조편성 (3조) ==> 776
      ====> 뷰 / 시퀀스 (응용) 
      222page 
      rownum 사용 위치 
      Top-N (위에서부터 몇개만 출력)
       => 인기순위 , 페이지 나누기..
       => 테이블을 이용시에는 순번이 변경되지 않는다 (테이블대신 SELECT~~)

       ==> SQL문장 실행 순서 
       SELECT ~    ==> 3
       FROM ~     ==> 1
       WHERE ~   ==> 2
       ORDER BY ~ ==> 4
       ***  모든 테이블에 rownum을 사용 할 수 있다
*/
SELECT empno,ename,job,hiredate,sal,rownum
FROM emp;

-- 위에서부터 5명을 출력 
SELECT empno,ename,job,hiredate,sal,rownum
FROM emp
WHERE rownum<=5;

-- 급여가 많은순으로 5명 출력 
SELECT empno,ename,job,hiredate,sal
FROM emp
ORDER BY sal DESC;

SELECT empno,ename,job,hiredate,sal,rownum
FROM emp
WHERE rownum<=5
ORDER BY sal DESC;

-- rownum의 순번 변경 
SELECT empno,ename,job,hiredate,sal,comm,rownum
FROM (SELECT empno,ename,job,hiredate,sal 
           FROM emp ORDER BY sal DESC)
WHERE rownum<=5;

-- TABLE 대신 ==> SELECT문장을 이용할 수 있다 
-- 주의점 : 테이블 대신 사용하는 SELECT문장에서 출력된 컬럼만 사용이 가능 

-- 최근에 입사한 사원 5명 출력 => 이름 , 직위 , 입사일 
SELECT ename,job,hiredate,rownum
FROM emp
WHERE rownum<=5;
ORDER BY hiredate DESC;

SELECT ename,job,hiredate,rownum
FROM emp
ORDER BY hiredate DESC;

-- rownum 순서 변경 
SELECT ename,job,hiredate,rownum
FROM (SELECT ename,job,hiredate FROM emp ORDER BY hiredate DESC)
WHERE rownum<=5;
--------------------------------------- 222~223(****) SQL문장 실행 (FROM - WHERE - SELECT - ORDER)
/*
     224page : 부속질의 (서브쿼리) 
     서브쿼리 
     ----------
       = 중첩질의 ========> WHERE문장 뒤에 (조건문에서 값을 읽어 올때)
            1) 단일행 서브 쿼리 
                SELECT ~~
                FROM table_name
                WHERE 컬럼명 연산자 (SELECT ~)
                                               ------------- 결과값이 1개 출력 
            2) 다중행 서브 쿼리 
                SELECT ~~
                FROM table_name
                WHERE 컬럼명 연산자 ANY|ALL|IN|SOME(SELECT ~)
                                      ------------- 결과값이 여러개 출력 
                                      IN => 결과값 전체를 처리 
                                      ANY | SOME
                                      ---------------
                                       > ANY(실행결과중에 최소값) 10,20,30 => (> 10)
                                       < ANY(실행결과중에 최대값) 10,20,30 => (< 30)
                                       = ANY() => IN과 같은 역할 
                                      ALL
                                       > ALL(실행결과중에 최대값) 10,20,30 => (> 30)
                                       < ALL(실행결과중에 최소값) 10,20,30 => (< 10)
                                      ==> MAX,MIN,IN
       = 스칼라   ========> SELECT문장 뒤에 (컬럼 대신 사용)
              형식) 다른 테이블에서도 데이터 출력이 가능 (JOIN) => 속도,단점(SQL문장이 길어진다)
                      분석이 약간 어렵다 ...
                      SELECT 컬럼명,컬럼명,(SELECT ~~) 별칭 ,
                                                     (SELECT ~~) 별칭 
                      FROM table_name 
                      *** 스칼라 서브쿼리는 실행 결과값이 1개이여야 된다 
                      *** 코스 
       = 인라인뷰  =======> FROM문장 뒤에 (테이블 대신 사용)
              형식) 다른 연결해서 데이터 읽기 , Top-N
                      SELECT ~
                      FROM (SELECT~) 
                      => 보안 (메모리에 저장이 안된 상태)
                      *** FROM뒤에는 SELECT문장 , View(가상테이블)
                                                                 -------------------- 단순뷰 , 복합뷰 , 인라인뷰 
*/







