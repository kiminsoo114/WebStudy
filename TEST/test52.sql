-- 2022-01-19 (PL/SQL => Function , Procedure) => JDBC 
/*
      오라클 : DML(SELECT : LIKE,JOIN,SUBQUERY)
                  => INSERT , UPDATE , DELETE 
                 -------------------------------------------- 웹프로그래머의 입문
                  DDL => TABLE , VIEW , SEQUENCE 
                              -------- 데이터형 , 제약조건 
                  TCL  => COMMIT / ROLLBACK
      JDBC 주력 
      ================> JDBC / Spring (Full Stack : JavaScript)
                                          -------              --------------------------
                                          MyBatis              Ajax , Vue(Vuex) , React(Redux)
      클라우드 연결 / 배포 (리눅스명령어) 
      ---------- AWS 

     1) CURSOR 사용법 ==> 오라클에서 데이터를 모아서 자바로 전송 
        ----------- ResultSet (여러명 , 여러개...)
     
     단위 (오라클) => ROW,Record 
       튜플 : ROW(한줄)
       카디널니티 : 튜플 여러개 모아둔 것 
     2) PL/SQL 
          변수
            한줄씩 제어 (한사람 , 한개에 정보)
               스칼라변수 : 오라클의 일반 변수 ( 변수 데이터형 )
                           데이터형 : CHAR , CLOB , VARCHAR2 , NUMBER , DATE
               참조 변수 
                  = %TYPE => 컬럼한개의 데이터형 읽기
                  = %ROWTYPE => 테이블 전체 컬럼의 데이터형 읽기
                  = 사용자 정의 : RECORD
       
            여러줄 제어 (테이블 전체)
                  = CURSOR
                  = 형식
                       CURSOR cur_name IS
                           SELECT * FROM emp;
*/
-- CURSOR 사용법 (emp) (emp,dept) => JOIN
-- 한개의 테이블 데이터를 모아서 관리 
-- 오라클 => C/C++ => 변수를 미리 선언하고 사용 , 포인터 
-- 변수 : 지역변수 , 매개변수 
-- IN => 일반변수 (Call By Value)
-- OUT => 포인터변수 (Call By Reference)
-- INOUT => 일반 , 포인터 
/*
     vemp emp%ROWTYPE;
     class vemp
     {
          int empno;
          String ename,job;
          Date hiredate;
          int mgr,deptno,sal,comm;
     }

    Cursor => List

    FOR vemp IN cur LOOP
    for(Emp emp:list)
*/
/*
DECLARE 
  -- 변수 선언부 (매개변수,지역변수)
  vemp emp%ROWTYPE; -- EMP가 가지고 있는 모든 컬럼의 데이터형 설정
  -- 데이터를 모아서 처리
  CURSOR cur IS
   SELECT * FROM emp; 
BEGIN
  -- {} => 구현부 
  -- 커서에 있는 내용을 출력 
  FOR vemp IN cur LOOP
    -- SET SERVEROUTPUT ON
    DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
    -- 종료시점 => 데이터가 더이상 추출이 안되는 상태 => NOTFOUND
    EXIT WHEN cur%NOTFOUND;
    /*
        %NOTFOUND : 찾는 데이터가 없다 (인출이 종료)
        %FOUND : 찾는 데이터가 있는 상태 
        %ROWCOUNT : 커서에 있는 데이터 총갯수
        %ISOPEN : 커서가  OPEN 상태 
        ------------ 
               동작 : 1. OPEN(rs.next) , 2. FETCH(rs.getInt()) , 3. CLOSE(rs.close())
    */
  END LOOP;
END;
/
*/
-- JOIN이 있는 경우 (테이블이 여러개 연결) => %ROWTYPE은 사용 할 수 없다 
/*
       empno , ename , job , hiredate, mgr , sal, comm,deptno
       ------------------------------------------------------------------ emp
       deptno,dname,loc
       --------------------- dept 

      vemp emp%ROWTYPE  
      vemp에 포함된 데이터 (empno , ename , job , hiredate, mgr , sal, comm,deptno)
      vdept dept%ROWTYPE 
      vdept (deptno,dname,loc)
*/
DECLARE 
   -- 변수선언 => 데이터 인출시 받는 데이터형 설정 (RECORD: 사용자 정의)
   TYPE empDept IS RECORD(
       empno emp.empno%TYPE,
       ename emp.ename%TYPE,
       job emp.job%TYPE,
       hiredate emp.hiredate%TYPE,
       sal emp.sal%TYPE,
       dname dept.dname%TYPE,
       loc dept.loc%TYPE
   );
   ed empDept;
   -- 데이터를 모아둔다 => CURSOR 
   CURSOR cur IS
    SELECT empno,ename,job,hiredate,sal,dname,loc
    FROM emp,dept
    WHERE emp.deptno=dept.deptno;
BEGIN
   -- FOR문을 사용해서 데이터를 처음부터 마지막까지 한줄씩 인출 
   FOR ed IN cur LOOP
     DBMS_OUTPUT.PUT_LINE(ed.empno||' '||ed.ename||' '||
                    ed.job||' '||ed.hiredate||' '||ed.sal||' '||ed.dname||' '||ed.loc);
     EXIT WHEN cur%NOTFOUND;
   END LOOP; 
   -- 읽어온 데이터를 출력 , 자바로 전송 
END;
/












