-- 2022-01-12 (View) 
/*
     View 특징 , 장점 , 단점 
     -----------
       = 가상테이블 (기존의 테이블을 참조해서 제작) 
       = 재사용이 가능 , 보안 , SQL문장을 단순화 시킨다 
          ----------------------------------------------------- 
       = 참조하고 있는 테이블의 영향을 준다 (삭제,수정,추가)
       = View에는 실제 데이터가 저장된 것이 아니고 SQL문장이 저장되어 있다 
     View 종류 
       = 단순 뷰 : 테이블 1개 참조 
       = 복합 뷰 : 테이블 여러개 참조 (JOIN,SubQuery)
       = 인라인 뷰 : 테이블 대신 SELECT 
     옵션 종류 
       = WITH CHECK OPTION  : DML이 가능 (default)  ==> SELECT,INSERT,UPDATE,DELETE
       = WITH READ ONLY : 읽기 전용 (*********) ==> SELECT

     형식) 
              CREATE [OR REPLACE] VIEW view_name
              ---------------------------
              AS
               SELECT ~~

              *** CREATE VIEW ==> 수정 ==> DROP ==> CREATE 
              *** CREATE OR REPLACE VIEW ==> 수정 ==> 실행 

              삭제 
              -----
               DROP VIEW view_name;         
*/
-- 테이블 복사 (emp,dept)
/*
DROP TABLE myEmp;
CREATE TABLE myEmp
AS
  SELECT * FROM emp;

DROP TABLE myDept;
CREATE TABLE myDept
AS
  SELECT * FROM dept;
*/

-- 뷰 제작 (myDept) => 기존의 테이블의 데이터를 읽어 온다 (테이블이 없는 경우에는 만들 수 없다)
-- 기존의 테이블의 데이터를 재사용시에 사용 
-- 단순뷰 (DML) ==> READ ONLY속성으로 변경 
/*
  CREATE VIEW dept_view 
  AS
  SELECT * FROM myDept;
*/
/*
conn system/happy
GRANT CREATE VIEW TO hr;
conn hr/happy
CREATE VIEW dept_view 
AS
SELECT * FROM myDept;

   CSS =>파일 , 태그
*/

SELECT * FROM dept_view;

SELECT * 
FROM (SELECT * FROM myDept)

-- 추가 
-- INSERT INTO dept_view VALUES(50,'영업부','서울');
-- COMMIT;

-- 수정 
/*
UPDATE dept_view SET
dname='개발부' , loc='인천'
WHERE deptno=50;
COMMIT;
*/
-- 삭제
/*
DELETE FROM dept_view
WHERE deptno=50;
COMMIT;
*/

--SELECT * FROM dept_view;
--SELECT * FROM myDept;

-- View => 기능 (읽기전용) 
/*
DROP VIEW dept_view;

CREATE VIEW dept_view
AS
  SELECT * FROM myDept
  WITH READ ONLY;
-- WITH CHECK OPTION : Default (DML을 사용할 수 있다 => 테이블 영향을 준다)
-- INSERT 
INSERT INTO dept_view VALUES(50,'개발부','서울');
COMMIT;
*/
-- 복합 뷰 (두개이상의 테이블 연결) => 미리 많이 사용되는 SQL을 저장한 다음에 사용
-- SQL문장을 단순화 시킬때 사용한다 
-- VIEW안에는 실제 데이터가 존재하는 것이 아니라 AS 밑에 있는 SQL문장이 저장되어 있다 
CREATE OR REPLACE VIEW empDept_view
AS
  SELECT empno,ename,job,hiredate,sal,dname,loc,grade
  FROM emp,dept,salgrade
  WHERE emp.deptno=dept.deptno
  AND sal BETWEEN losal AND hisal;

-- 사원의 사번,이름 , 직위,입사일 , 급여 ,부서명,근무지 , 급여 등급 출력 
SELECT empno,ename,job,hiredate,sal,dname,loc,grade
FROM emp JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal;

SELECT * FROM empDept_view;
SELECT * FROM (SELECT empno,ename,job,hiredate,sal,dname,loc,grade
  FROM emp,dept,salgrade
  WHERE emp.deptno=dept.deptno
  AND sal BETWEEN losal AND hisal);
-- 이름 ,급여 ,부서명 , 등급 
SELECT ename,sal,dname,grade FROM empDept_view;
-- 뷰 (SQL문장을 재사용 목적) , 인라인뷰 (재사용할 수 없다)
SELECT owner,constraint_name,constraint_type,status
FROM user_constraints
WHERE table_name='FOOD_HOUSE';

SELECT owner,constraint_name,table_name,column_name
FROM user_cons_columns
WHERE table_name='CATEGORY';









