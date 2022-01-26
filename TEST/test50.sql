-- 2022-01-18 (PL/SQL => 제어문,연산자)
-- 제어문 + 연산자 + 변수 = 함수 
-- 조건문 (단일 조건문) => IF(조건문) THEN 결과값 ~ END IF;
-- 부서 확인  (emp => 부서명이 없고 부서번호 10,20,30)
SELECT * FROM emp;
-- 프로젝트 (1차) => 반드시 PL/SQL로 제작한 프로그램 첨부 (자유게시판=>댓글)
-- 프로시저 => 모든 곳에서 댓글이 사용 가능 
-- 274page 
/*
DECLARE 
   vename emp.ename%TYPE;
   vdname dept.dname%TYPE;
   vdeptno emp.deptno%TYPE;
   vempno emp.empno%TYPE:=&sabun;
BEGIN
   SELECT ename,deptno INTO vename,vdeptno
   FROM emp
   WHERE empno=vempno;

   -- 경우에 따라서 => INSERT , UPDATE , DELETE
   IF vdeptno=10 THEN
      vdname:='개발부';
   END IF;
   
   IF (vdeptno=20) THEN
      vdname:='총무부';
   END IF;

   IF (vdeptno=30) THEN
      vdname:='영업부';
   END IF;
   
   DBMS_OUTPUT.PUT_LINE('***** 결과 *****');
   DBMS_OUTPUT.PUT_LINE('이름:'||vename);
   DBMS_OUTPUT.PUT_LINE('부서명:'||vdname);
END;
/
*/
/*
-- IF~ELSE 
DECLARE 
  vename emp.ename%TYPE;
  vcomm emp.comm%TYPE;
BEGIN
  -- 값을 받는다 
  SELECT ename,comm INTO vename,vcomm
  FROM emp
  WHERE empno=&sabun;
  -- NULL값은 연산처리를 할 수 없다 => IF문장을 수행을 못하고 ELSE문장을 수행 
  IF (vcomm>0) THEN 
   DBMS_OUTPUT.PUT_LINE(vename||'님의 성과급은 '||vcomm||'입니다');    
  ELSE
   DBMS_OUTPUT.PUT_LINE(vename||'님의 성과급은 없습니다');
  END IF;
END;
/
*/
-- 다중 조건문 
DECLARE 
   vename emp.ename%TYPE;
   vdname dept.dname%TYPE;
   vdeptno emp.deptno%TYPE;
   vempno emp.empno%TYPE:=&sabun;
BEGIN
   SELECT ename,deptno INTO vename,vdeptno
   FROM emp
   WHERE empno=vempno;

   -- 경우에 따라서 => INSERT , UPDATE , DELETE
   IF vdeptno=10 THEN
      vdname:='개발부';
   ELSIF (vdeptno=20) THEN
      vdname:='총무부';
   ELSIF (vdeptno=30) THEN
      vdname:='영업부';
   ELSE
     vdanme:='신입';
   END IF;
   
   DBMS_OUTPUT.PUT_LINE('***** 결과 *****');
   DBMS_OUTPUT.PUT_LINE('이름:'||vename);
   DBMS_OUTPUT.PUT_LINE('부서명:'||vdname);
END;
/












