-- 2022-01-06 GROUP BY 
/*
      
      GROUP BY : 그룹을 나눠서 (그룹별로 처리)
      HAVING : 그룹안에서 조건 처리를 하는 명령문 
      ----------- GROUP BY가 있는 상태에서만 사용이 가능 
      SELECT 
      FROM 
      HAVING  ===> 오류 

     SELECT
     FROM 
     WHERE 
     HAVING   ===> 오류 
*/
/*
set pagesize 30
SELECT deptno,sal 
FROM emp
ORDER BY deptno;
*/
-- 부서별(10,20,30) 인원수, 급여총합 , 급여 평균 , 최대급여 , 최소급여 
-- 부서별로 => 부서를 그룹으로 설정하면 => 부서별 처리가 가능 
-- ROUND(AVG(sal)) , ROUND(AVG(sal),0) => 생략 =>소수점 없이 사용 
SELECT deptno "부서",
           COUNT(*) "인원수",
           SUM(sal) "급여총합",
           ROUND(AVG(sal)) "급여평균",
           MAX(sal) "최대급여",
           MIN(sal) "최소급여"
FROM emp
GROUP BY deptno
ORDER BY deptno ASC;

-- 직위별로 나눠서 => 인원수  ==> 부서별 , 직위별 , 년도별 
SELECT job , COUNT(*) "인원수"
FROM emp
GROUP BY job
ORDER BY job DESC;

-- 년도별 처리 
SELECT hiredate , COUNT(*) "인원수"
FROM emp
GROUP BY hiredate
ORDER BY hiredate ASC;

SELECT TO_CHAR(hiredate,'YYYY') "입사년도" , COUNT(*) "인원수"
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY')
ORDER BY TO_CHAR(hiredate,'YYYY') ASC;

-- 요일별 그룹 처리 
SELECT TO_CHAR(hiredate,'DY') "입사요일" , COUNT(*) "인원수"
FROM emp
GROUP BY TO_CHAR(hiredate,'DY');
-- 그룹은 컬럼명만 사용하는 것이 아니고 => 함수를 이용해서 그룹을 설정 할 수 있다 
-- 그룹별 조건을 제시 ==> GROUP BY 대한 조건은 HAVING , 일반 조건 => WHERE 
-- HAVING은 조건문 => 항상 GROUP BY가 있는 경우에만 사용이 가능 
/*
      오라클 SELECT문장 실행되는 과정 
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
-- 사원중에 평균보다 많이 받는 사원이 각부서에 몇명이 있는지 확인 
-- 각부서의 인원이 2명이상인 부서만 출력 
SELECT deptno,COUNT(*) "인원수"
FROM emp
WHERE sal>2073
GROUP BY deptno
HAVING COUNT(*)>=2
ORDER BY deptno ASC;

-- 사원중에 급여가 평균보다 많이 받는 사원이 년도별로 몇명인지 확인 
-- HAVING에서만 집합함수를 사용할 수 있다 (WHERE에서는 사용 할 수 없다)
SELECT TO_CHAR(hiredate,'YYYY') "입사년도",COUNT(*) "인원수"
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY')
HAVING COUNT(*)>=2
ORDER BY TO_CHAR(hiredate,'YYYY') ASC;
/*
       161 page 

       SELECT job , SUM(sal)
       FROM emp
       GROUP BY deptno;  --- 오류  ==> job , deptno가 일치가 않됨 

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
       ORDER BY job ASC; --- 오류 : SELECT문장의 순서가 틀림

       SELECT job,SUM(sal)
       FROM emp
       WHERE sal>2073
       GROUP BY job
       HAVING COUNT(*)>=2
       ORDER BY job ASC;

      => GROUP BY ==> 분기별 통계 , 분석 (파티션테이블) => 분기별,부서별 
                                                           ----------------- DBA
      => 웹프로그래머 : 이미 만들어진 테이블(컬럼 => 데이터수집) => 제어 (DML:CRUD)
           --------------- DML(SELECT , INSERT , UPDATE , DELETE)
           데이터 수집, 테이블 생성 ==> 프로젝트 (요구사항,데이터베이스설계,수집)
           ==> 화면 UI => 구현 ==> 발표 => 배포 

     162page ==> 두개이상의 테이블에서 데이터 추출 
                         -------------------- 조인 
*/




