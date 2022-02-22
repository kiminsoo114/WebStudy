-- 2022-01-18 (267page -> PL/SQL)
/*
    프로그램을 이용해서 오라클 데이터를 제어 할 수 있다 
    일반 언어를 이용해서 사용방식 => JDBC(자바) , ODBC(C/C++) 
    오라클 자체에서 처리 => PL/SQL (프로시저 , 함수 , 트리거를 제작하는 언어) 
    ------------------------     ---------- 반복이 많다 , 보안이 필요한 기능이 필요시에 
                                                   자동화 처리 (트리거) 
    프로시저 : 리턴형이 없는 함수 (일반 기능 처리) 
    함수       : 리턴형을 가지고 있는 함수 (substr(),trim() ....) => 사용자 정의 함수 
    트리거  : 자동화 처리 
                 입고  ==> 재고(자동화)
                 출고  ==> 재고(자동화)
    page 270 => PL/SQL은 (ERP)  ==> 실무 (제작 => 메뉴얼) => 자바에서 사용가능
    PL (프로시저 언어) 
      = 변수 선언 
         1. 스칼라 변수 
             ename VARCHAR2(10)
             deptno NUMBER(4)
         2. 참조변수 (컬럼 1개) ==> %TYPE (가장 많이 등장)
             vename emp.ename%TYPE
             vdname dept.dname%TYPE
         3. 참조변수 (테이블의 전체 컬럼 참조)
             vemp emp%ROWTYPE ==> ~VO
         4. 사용자 변수 (JOIN,SUBQUERY)
             TYPE empdept IS RECORD(
                  변수설정 ..
                  변수설정...
             )
         5. 커서 : List ==> 목록 출력 , 페이지 나누기 
            CURSOR cur IS
             SELECT * FROM emp;
            => 자유게시판 (댓글)
      = 연산자 
         1. 산술연산자 ( + , - , * , / ) => 나머지 : MOD()
         2. 비교연산자 ( = , <> , < , > , <= , >= )
         3. 논리연산자 ( AND , OR , NOT )
         4. IN 
         5. BETWEEN ~ AND 
         6. LIKE
         7. NULL => IS NULL , IS NOT NULL
      = 제어문 
         1. 조건문 
             = 단일 조건문 
                 IF(조건문) THEN 
                     결과값
                 END IF;
             = 선택 조건문 
                IF(조건문) THEN 
                    결과값(조건문 => true)
                ELSE
                    결과값(조건문 => false)
                END IF;
             = 다중 조건문 
                IF (조건문) THEN
                     결과값 
                ELSIF(조건문) THEN
                     결과값 
                ELSIF(조건문) THEN
                     결과값 
                ELSE
                   결과값 
                END IF
         2. 선택문 
                CASE
                   WHEN 조건 THEN 결과값 => case 
                   WHEN 조건 THEN 결과값 => case
                   WHEN 조건 THEN 결과값 => case
                   ELSE 결과값 => default 
                END;
         3. 반복문 
             = BASIC LOOP
                LOOP 
                  SQL문장 
                  SQL문장 
                END LOOP;
             = WHILE 
                WHILE (조건문) LOOP
                   반복문장 (SQL)
                END LOOP;
             = FOR 
                FOR 변수 [REVERSE] IN lo..hi LOOP
                   처리문장 
                END LOOP;

               예)
                      순차적 출력
                      FOR i IN 1..10 LOOP
                        출력문장
                      END LOOP; => 1~10

                      역순으로 출력 
                      FOR i REVERSE IN 1..10 LOOP
                        출력문장
                      END LOOP; => 10~1

             PL/SQL 형식 
             1) 연습용 (문법)
                 DECLARE
                    변수 선언 위치 
                 BEING 
                    구현 (SQL) => 출력 
                 END;
                  /

            2) PROCEDURE 
                CREATE [OR REPLACE] PROCEDURE pro_name(매개변수 , 매개변수)
                IS
                  변수 선언 (지역변수)
                BEGIN
                   구현 (SQL으로 제어)
                END;
                 /

            3) FUNCTION
                CREATE [OR REPLACE] FUNCTION func_name(매개변수 , 매개변수)
                : RETURN 데이터형
                IS
                  변수 선언 (지역변수)
                BEGIN
                   구현 (SQL으로 제어)
                   RETURN 값
                END;
                 /

           2) TRIGGER
                CREATE [OR REPLACE] TRIGGER tri_name(매개변수 , 매개변수)
                IS
                  변수 선언 (지역변수)
                BEGIN
                   구현 (SQL으로 제어)
                END;
                 /      
*/
-- 스칼라 변수 사용법 
-- 화면에 출력 
set serveroutput on;
/*
DECLARE
  vename VARCHAR2(20);
  vjob VARCHAR2(10);
BEGIN
   -- 변수에 값을 채운다 
   SELECT ename,job  INTO vename,vjob 
   FROM emp
   WHERE empno=7788;
   -- 화면에 출력 
   DBMS_OUTPUT.PUT_LINE('***** 실행 결과 *****');
   DBMS_OUTPUT.PUT_LINE('이름:'||vename);
   DBMS_OUTPUT.PUT_LINE('직위:'||vjob);

END;
/
*/
-- %TYPE (컬럼의 데이터형을 가지고 올때 사용 => 1개) => 가장 많이 사용하는 변수형 
DECLARE 
  -- 변수 선언부 
  vename emp.ename%TYPE;
  vdname dept.dname%TYPE;
  vjob emp.job%TYPE;
  vloc dept.loc%TYPE;
BEGIN 
   -- 구현 => SQL문장으로 구현 
   -- 변수에 값을 채울때 SELECT ~ INTO 
   SELECT ename,job,dname,loc INTO vename,vjob,vdname,vloc
   FROM emp,dept
   WHERE emp.deptno=dept.deptno
   AND empno=7788;
   
   -- 변수값 출력 
   DBMS_OUTPUT.PUT_LINE('***** 결과 *****');
   DBMS_OUTPUT.PUT_LINE('이름:'||vename);
   DBMS_OUTPUT.PUT_LINE('직위:'||vjob);
   DBMS_OUTPUT.PUT_LINE('부서:'||vdname);
   DBMS_OUTPUT.PUT_LINE('근무지:'||vloc);
END;
/
  






