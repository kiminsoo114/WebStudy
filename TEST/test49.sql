-- 2022-01-18 (PL/SQL => 변수) 
/*
      변수 => 1개의 값만 설정할 수 있다 
      일반 변수  (변수명 데이터형) => 스칼라변수
          name VARCHAR2(20); 
      기존에 있는 컬럼의 데이터형을 읽어 온다 
         => 컬럼 1개 데이터 : %TYPE
              name emp.ename%TYPE
         => 테이블 전체 컬럼 데이터 : %ROWTYPE
              vemp emp%ROWTYPE
         => JOIN , SubQuery => 테이블 2개에서 데이터를 가지고 온다 
              사용자 정의 데이터형 
              RECORD 
         ------------------------------------ 한개에 대한 데이터를 대입 (ROW)
         ------------------------------------ ~VO
         => 전체 테이블의 데이터 읽기 : CURSOR 
         ------------------------------------ List

        일반 연습용 (PL/SQL)
        선언부 
        구현부

        DECLARE -- 선언부 
           변수 선언 (여러개)

        BEGIN
           구현부 -- SQL문장 처리 
           예외처리부 
        END;
          / 
*/
-- emp에서 이름,직위,입사일,급여를 변수를 받아서 출력
SET SERVEROUTPUT ON; 
/*
DECLARE 
   -- 변수 선언 (%TYPE : 실제 테이블 컬럼이 가지고 있는 데이터형 대입)
   vename emp.ename%TYPE;
   vjob emp.job%TYPE;
   vday emp.hiredate%TYPE;
   vsal emp.sal%TYPE;
BEGIN
   -- 구현 (메소드 {})
   -- 데이터를 읽어와서 변수에 저장 
   SELECT ename,job,hiredate,sal INTO vename,vjob,vday,vsal
   FROM emp
   WHERE empno=7788;
   -- 저장된 변수를 제어 처리 
   --  출력 
   DBMS_OUTPUT.PUT_LINE('***** 결과가 *****');
   DBMS_OUTPUT.PUT_LINE(vename||' '||vjob||' '||vday||' '||vsal);
END;
/
*/
-- 입력을 받아서 처리 
SET LINESIZE 250;
SELECT * FROM emp;
/*
DECLARE 
  -- ename의 참조 변수 
  vempno emp.empno%TYPE:=&sabun;
  -- 일반변수 (스칼라변수)
  vename VARCHAR2(20);
  vjob VARCHAR2(20);
  vday DATE;
BEGIN
   SELECT ename,job,hiredate INTO vename,vjob,vday
   FROM emp
   WHERE empno=vempno;
   
   -- 출력 
   DBMS_OUTPUT.PUT_LINE('***** 결과 *****');
   DBMS_OUTPUT.PUT_LINE(vename||'  '||vjob||'   '||vday);
END;
/
*/
/*
-- 테이블 전체의 데이터형 설정 
DECLARE 
  vemp emp%ROWTYPE;
  -- vemp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
BEGIN
  -- 데이터 받기 
  SELECT * INTO vemp
  FROM emp
  WHERE empno=7788;

   -- 출력 
   DBMS_OUTPUT.PUT_LINE('***** 결과 *****');
   DBMS_OUTPUT.PUT_LINE('이름:'||vemp.ename);
   DBMS_OUTPUT.PUT_LINE('직위:'||vemp.job);
   DBMS_OUTPUT.PUT_LINE('입사일:'||vemp.hiredate);
   DBMS_OUTPUT.PUT_LINE('급여:'||vemp.sal);
   DBMS_OUTPUT.PUT_LINE('성과급:'||vemp.comm);
END;
/
*/
-- 사용자 정의 => RECORD (ROW단위) => ~VO와 같은 기능  
DECLARE
  -- 사용자 정의 데이터형 만들기 (여러개의 테이블에서 데이터 추출)
  -- emp_dept_salgrade 데이터형 
  TYPE emp_dept_salgrade IS RECORD(
        ename emp.ename%TYPE,
        job emp.job%TYPE,
        day emp.hiredate%TYPE,
        sal emp.sal%TYPE,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE,
        grade salgrade.grade%TYPE
  ); 
  -- 변수 선언 
  eds emp_dept_salgrade;
BEGIN
   SELECT ename,job,hiredate,sal,dname,loc,grade INTO eds
   FROM emp JOIN dept
   ON emp.deptno=dept.deptno
   JOIN salgrade
   ON sal BETWEEN losal AND hisal
   WHERE empno=7788;
   
   -- 출력 
   DBMS_OUTPUT.PUT_LINE('***** 결과 *****');
   DBMS_OUTPUT.PUT_LINE('이름:'||eds.ename);
   DBMS_OUTPUT.PUT_LINE('직위:'||eds.job);
   DBMS_OUTPUT.PUT_LINE('입사일:'||eds.day);
   DBMS_OUTPUT.PUT_LINE('급여:'||eds.sal);
   DBMS_OUTPUT.PUT_LINE('부서명:'||eds.dname);
   DBMS_OUTPUT.PUT_LINE('근무지:'||eds.loc);
   DBMS_OUTPUT.PUT_LINE('등급:'||eds.grade);
END;
/  

  

  










