-- 2022-01-07 오라클 문제 풀이(GROUP BY , JOIN)
/*

SELECT - FROM - [WHERE - GROUP BY - HAVING - ORDER BY]
-------------------------------------------------------------------------
GROUP BY => 그룹별로 나눠서 처리 (통계,실적) 
                => 조건을 설정하는 경우에 WHERE를 사용하는 것이 
                     아니고 => HAVING을 사용 
                => HAVING은 GROUP BY가 있는 상태에서만 사용이 가능 
= 같은 값을 가지고 있는 컬럼이 존재 => GROUP을 사용 할 수 있다 
= emp => 부서번호 , 입사년도 , 직위 
GROUP BY 문제  
------------ 집계함수 
               MAX(컬럼) , MIN(컬럼) , COUNT(*(NULL값 포함)|컬럼(NULL미포함),
               SUM(컬럼) , AVG(컬럼)
--> 단일 컬럼 , 단일행함수는 집합(계)함수 같이 사용할 수 없다 ...
--> 그룹을 이용해서 처리 
1. 각 부서별로 최대 급여를 구하세요.
    ----------    -----------
SELECT deptno,MAX(sal)
FROM emp
GROUP BY deptno
ORDER BY 1;

2. 각 직급(job)별로 최대 급여를 구하세요. 
    ---------------    -----------
SELECT job,MAX(sal)
FROM emp
GROUP BY job
ORDER BY 2 DESC;

3. 각 부서별로 평균 급여를 구하세요.
    ------------  ----------
SELECT deptno,ROUND(AVG(sal))
FROM emp
GROUP BY deptno
ORDER BY 2 DESC;

4. 각 직급(job)별의 인원수를 구하세요.
    ---------------GROUP => COUNT(*)
SELECT job,COUNT(*)
FROM emp
GROUP BY job
ORDER BY 2 ASC;

5. 각 부서별 보너스(comm)을 받는  인원수 출력 . 
SELECT deptno,COUNT(*)
FROM emp
WHERE comm IS NOT NULL
GROUP BY deptno;

6. 각 년도별로 입사한 인원수를 구하세요.
   ----------- 함수 
SELECT TO_CHAR(hiredate,'YYYY'),COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY')
ORDER BY 1 ASC;

SELECT SUBSTR(hiredate,1,2),COUNT(*)
FROM emp
GROUP BY SUBSTR(hiredate,1,2)
ORDER BY 1 ASC;

7.  부셔별 평균급여를 구하고 그 결과 평균급여가 2000 이상인 부서만 출력하세요.
     -------------------------------------------------------------------------------------
SELECT deptno,ROUND(AVG(sal)) "평균급여"
FROM emp
GROUP BY deptno
HAVING AVG(sal)>=2000;
-- 2중으로 처리 
-- 부서별 (부서안에서 다시 직위로 그룹을 만든 들어서 처리)
SELECT deptno,job,COUNT(*),SUM(sal),ROUND(AVG(sal))
FROM emp
GROUP BY (deptno,job)
ORDER BY 1 ASC;

- INNER JOIN (같은 값을 지지고 있을때 => 해당 ROW전체값을 가지고 올 수 있다)
- 교집합 (같은 값이 있는 경우에만 가지고 온다 => NULL은 미포함)
             --------------------- EQUI JOIN (연산자 =)
- 포함된 경우에 ROW를 읽어 올 수 있다
  ------------ NON EQUI JOIN (연산자 =외의 다른 연산자 .. BETWEEN , 
                 논리 연산자)
JOIN 문제

1. 사원 이름이 SCOTT인 사원의 사번(empno), 이름(ename), 부서명(dname)를 출력하세요.
                                           ------------------------------  -----------------
                                                    emp                          dept
SELECT empno,ename,dname
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND ename='SCOTT';


SELECT empno,ename,
          (SELECT dname FROM dept WHERE deptno=emp.deptno) dname
FROM emp
WHERE ename='SCOTT';


2. 사원이름과 급여(sal)와 급여등급(grade)을 출력하세요.
-- NON EQUI JOIN
SELECT ename,sal,grade
FROM emp,salgrade
WHERE sal BETWEEN losal AND hisal;

3. 위 2번문제에서 부서명을 추가시켜 출력하세요.
SELECT ename,sal,grade,dname
FROM emp,salgrade,dept
WHERE sal BETWEEN losal AND hisal
AND emp.deptno=dept.deptno;

4. 사원이름과 매니저의 이름을 아래와 같은 형식으로 출력하세요.
     "XXX"의 매니져는 "XXX" 입니다.  (SELF)
    SELECT e1.ename||'의 사수는 '||e2.ename||'입니다'
    FROM emp e1,emp e2
    WHERE e1.mgr=e2.empno;

5. 부서번호가 30번인 사원들의 이름, 직급(job), 부서번호(deptno), 부서위치(loc)를 출력하세요.
    SELECT ename,job,emp.deptno,loc
    FROM emp,dept
    WHERE emp.deptno=dept.deptno
    AND emp.deptno=30;
6. 보너스(comm)을 받은사원의 이름, 보너스, 부서명, 부서위치를 출력하세요.
    SELECT ename,comm,dname,loc
    FROM emp,dept
    WHERE emp.deptno=dept.deptno
    AND comm IS NOT NULL;
7. DALLAS에서 근무하는 사원들의 이름, 직급, 부서번호, 부서명을 출력하세요.
   SELECT ename,job,emp.deptno,dname
   FROM emp,dept
   WHERE emp.deptno=dept.deptno
   AND loc='DALLAS';
8. 이름에 'A'가 들어가는 사원들의 이름과 부서명을 출력하세요.
   SELECT ename,dname
   FROM emp,dept
   WHERE emp.deptno=dept.deptno
   AND ename LIKE '%A%';

   SELECT ename,dname
   FROM emp,dept
   WHERE emp.deptno=dept.deptno
   AND INSTR(ename,'A',1,1)>=1;
*/





