-- 2022-01-12 (스칼라 서브쿼리) 
-- 스칼라서브쿼리는 컬럼대신 하는 SELECT문자 
-- 사원의 이름 , 입사일 , 직위 ,         부서명 , 근무지를 출력 
--           ---------------------- emp   ----------------- dept (정규화:UPDATE가 쉽게)
-- JOIN / SubQuery 
-- JOIN
SELECT ename,hiredate,job,dname,loc
FROM emp,dept 
WHERE emp.deptno=dept.deptno;

SELECT ename,hiredate,job,dname,loc
FROM emp JOIN dept 
ON emp.deptno=dept.deptno;
-- JOIN (SELECT) , SubQuery (DML전체 사용이 가능) 
-- SubQuery 
SELECT ename,hiredate,job,
           (SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
           (SELECT loc FROM dept WHERE deptno=emp.deptno) loc
FROM emp;
-- 결과값은 1개만 존재 

-- 교재 (231page) ==> 고객의 이름 , 구매한 책의 총금액 
SELECT * FROM customer;
SELECT * FROM orders;

SELECT (SELECT name 
            FROM Customer cs
            WHERE cs.custid=od.custid) "name", SUM(saleprice) "total"
FROM Orders od
GROUP BY od.custid;
-- *** 서브쿼리는 반드시 ()안에서 출력 => SELECT

-- 사원(emp) => 이름 , 직위 , 입사일  부서(dept)= 부서명,근무지 , 등급(salgrade) => 급여등급
-- Oracle JOIN
SELECT ename,job,hiredate,dname,loc,grade
FROM emp,dept,salgrade
WHERE emp.deptno=dept.deptno
AND sal BETWEEN losal AND hisal;

-- ANSI JOIN
SELECT ename,job,hiredate,dname,loc,grade
FROM emp JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal;

-- SubQuery 
SELECT ename,job,hiredate,
          (SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
          (SELECT loc FROM dept WHERE deptno=emp.deptno) loc,
          (SELECT grade FROM salgrade WHERE emp.sal BETWEEN losal AND hisal) grade
FROM emp;

-- 인라인뷰 (233페이지) : FROM절에 뒤에 테이블 대신 사용 (rownum의 순번을 변경)
-- 페이지나누기 (기술면접: 게시판의 페이징)
-- 자바 페이지 , 인라인뷰 페이지 ==> 사이트는 90%이상 페이지를 나눈다 
-- 기존테이블에서 일시적으로 만들어지는 가상테이블 (보안) 
-- 사용법 
/*
     SELECT ~~
     FROM (SELECT ~~ )

     서브쿼리에 있는 내용을 출력 ==> 출력된 내용중에 필요한 데이터를 읽어 온다 
                                                    --------------
                                                    서브쿼리에 있는 컬럼명만 사용이 가능 
     뷰 => 메모리에 SQL문장 저장 => CREATE VIEW (수정,삭제,추가 => 참조하고 있는 테이블에 영향이 있다)
*/

SELECT ename,job,hiredate,dname,loc
FROM (SELECT ename,job,hiredate,dname,loc,rownum
           FROM emp,dept
           WHERE emp.deptno=dept.deptno AND rownum<=5);
-- 가장 많이 등장 
SELECT ename,job,hiredate,dname,loc
FROM emp e , (SELECT dname,loc,deptno FROM dept) d
WHERE e.deptno=d.deptno; 

SELECT ename,job,hiredate,dname,loc
FROM (SELECT ename,job,hiredate,deptno FROM emp) e, 
          (SELECT dname,loc,deptno FROM dept) d
WHERE e.deptno=d.deptno;

-- 단점 => 보안은 좋다(가상테이블) =>가독성이 떨어진다(분석에 시간이 많이 걸린다) 
--             속도가 빠르다                    -------





           