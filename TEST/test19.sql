-- 2022-01-07 오라클 (부속질의 => 서브쿼리) => SQL문장이 여러개를 모아서 한번 처리 
/*
      170page 
      프로그램 
      ======
          변수 , 연산,제어 , 화면출력 
          === 데이터 저장 , 데이터 처리 , 처리된 출력 => 데이터 관리
          === 데이터 수집
                 ========
                 1. 분리 (관련된 데이터) ==> 분리된 데이터를 저장 공간 : 테이블 
                 2. 합쳐서 데이터 읽기 : JOIN (분리된 데이터 여러군데에서 추출)
                 3. JOIN 데이터와 관련 
      서브쿼리 => 네트워크(최소한 전송을 작게 한다) 
                        String의 문자열 결합 , StringBuffer 
      ---------- SQL문장과 관련 (여러개의 SQL문장을 합쳐서 한번에 처리)
      메인 쿼리 
          (서버쿼리) => 서브쿼리를 먼저 실행한 후 결과값을 메인쿼리로 전송 후 실행 
          1. 종류 
             ***= 단일행 서브쿼리  (결과값 1 , 컬럼 1개만 사용)
                 SELECT ~~
                 FROM 
                 WHERE deptno=(SELECT ~)
                                        ======== 1개 => 10
             ***= 다중행 서브쿼리  (결과값 여러개 , 컬럼은 1개 사용)
                 SELECT ~~
                 FROM 
                 WHERE deptno=(SELECT ~) ==> 오류
                                        ======== 여러개 => 10,20,30
                            => 10,20,30 => 세개를 동시에 적용 
                                  deptno IN(SELECT ~)
                                              => 최소값 
                                  deptno>ANY(SELECT ~)
                                              => 최대값 
                                  deptno<ALL(SELECT ~)
             ***= 스칼라 서브쿼리 => JOIN대신 사용 ...
                    => 컬럼 대신 사용 
                    SELECT (SELECT ~~) ,
                               (SELECT ~~),
                    FROM 테이블명 
             ***= 인라인 뷰 => SEELCT 문장을 테이블 로 대체 
                   => 많이 사용 (메모리에 저장이 안된 상태 보안이 뛰어난다)
                   SELECT ~
                   FROM (SELECT ~) 

            JOIN : SELECT에서만 사용이 가능 
           ===== 데이터+데이터
            SUBQuery : SELECT,INSERT,UPDATE,DELETE에서 사용이 가능 
           ===== SQL+SQL 
*/
-- SELECT deptno 
FROM emp 
WHERE ename='KING';
-- 사원의 평균급여보다 많이 받는 사원의 이름 , 급여를 출력 
-- ------------------      -----------           ------------
-- 1. 평균 급여 -- 2073
SELECT AVG(sal) FROM emp;
SELECT ename,sal
FROM emp
WHERE sal>2073; 

SELECT ename,sal
FROM emp
WHERE sal>(SELECT AVG(sal) FROM emp); 







