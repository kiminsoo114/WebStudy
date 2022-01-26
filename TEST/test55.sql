-- 2022-01-19 (PL/SQL => FUNCTION , PROCEDURE , TRIGGER)
/*
     ---------------------------------------------------------------
     PROCUDERE : 기능 (반복 기능)
                         => 자바에서 프로시저를 호출하는 방법  
     TRIGGER : 자동화 처리 
                    => 입고 <==> 재고 
                    => 출고 <==> 재고 
                    => 재고는 트리거를 이용해서 자동 처리
                    => 상세보기 <===> 조회수 증가 
     ---------------------------------------------------------------
     PL/SQL 
       1. 변수 설정(매개변수) 
            = ***단일 변수 (스칼라변수 => 일반 데이터형으로 설정)
               변수명 데이터형(CHAR,VARCHAR2,DATE,NUMBER)
            = 참조 변수 (이미 만들진 테이블의 컬럼의 데이터형을 가지고 온다)
               1) 컬럼 데이터형 1개 
                   ***테이블명.컬럼명%TYPE
               2) 테이블에 설정된 전체 컬럼의 데이터형 
                   테이블명%ROWTYPE
               3) 여러개의 테이블에서 컬럼값을 추출 (미지정) => 사용자 정의
                   TYPE 데이터형 IS RECORD(
                         참조할 컬럼 설정 (여러개 설정) 
                   )
       2. 제어문 
       3. 연산자 
            = 산술연산자 (+,-,/,*) => 나머지 (MOD())
            = 비교연산자 (= , <> , < , > ,<= ,>=)
            = 논리연산자 (AND , OR , NOT)
            = IN (OR대신) , BETWEEN ~ AND (범위,기간)
            = NULL : IS NULL , IS NOT NULL
            = LIKE (%(문자열), _(한글자))
       4. 내장 함수 
            = 단일행 함수(가로=> ROW)
               문자 
                 LENGTH()
                 SUBSTR()
                 INSTR()
                 RPAD()
               숫자
                 ROUND()
                 CEIL()
                 MOD()
               날짜
                 SYSDATE 
                 MONTHS_BETWEEN
               변환
                 TO_CHAR => 날짜,숫자변환 
               기타  
                 NVL()
            = 집계 함수 (세로=> COLUMN)
               MAX() , COUNT() , SUM() , AVG() , RANK()
      ------------------ 함수 (리턴형이 존재(O): FUNCTION , 리턴형이 존재(X): PROCEDURE)
         class        ==> 패키지
         ---------------------------------- 함수가 독립적이다 (매개변수, 지역변수)
         멤버변수  ==> 변수
         메소드     ==> 프로시저
         -------- 종속적이다(클래스)

         함수 VS 메소드 
         => 종속 / 독립 
         
        형식) => CREATE : DBA
               CREATE [OR REPLACE] PROCEDURE pro_name(
                    매개변수 ==> 스칼라 변수, %TYPE
                    ----------
                       대입 값 : IN
                       받는 값 : OUT
               )
               IS
                   지역변수 
               BEGIN
                   -- 구현부 : 주로 SQL문장을 이용한다 
                      값을 받는 경우 ==>  SELECT ~~ INTO (받는값)
                      제어문 , 연산자 사용이 가능 
               END;
                /      
*/
-- emp ==> comm을 읽어 온다 (comm이 0이거나 NULL면 성과급없다 , 성과급 500)
/*
    1. OUT 변수 설정 
       VARIABLE pMsg VARCHAR2(100)
    2. 함수 호출 
      EXECUTE getCommData(7788,:pMsg)
                                                 --------
    3. 출력
      PRINT pMsg 
*/
CREATE OR REPLACE PROCEDURE getCommData(
     vempno emp.empno%TYPE,
     vmsg OUT VARCHAR2)
IS
  -- 지역변수 
  vcomm emp.comm%TYPE;
BEGIN
  SELECT comm INTO vcomm
  FROM emp
  WHERE empno=vempno;

  IF (vcomm>0) THEN
    vmsg:='성과급:'||vcomm;
  ELSE
    vmsg:='성과급  없음';
  END IF;
END;
/
-- emp ==> 사수이름을 읽어 온다 
/*
      매개변수 
        사용자가 요청한 값 ===> IN (생략이 가능)
        사용자의 요청 결과값 ==> OUT
*/
CREATE OR REPLACE PROCEDURE getManagerData(
    vename emp.ename%TYPE, 
    vmanager OUT emp.ename%TYPE
)
IS
    vmgr emp.mgr%TYPE;
    vname emp.ename%TYPE;
BEGIN
    -- MGR을 가지고 온다 
    SELECT mgr INTO vmgr
    FROM emp
    WHERE ename=vename;

    IF(vmgr>0) THEN
      SELECT ename INTO vname
      FROM emp
      WHERE empno=vmgr;
      
      vmanager:=vname;
    ELSE
      vmanager:='사수가 없습니다';
    END IF;
END;
/

-- emp에 있는 모든 사원의 정보를 출력 
-- 매개변수가 없는 경우 => 함수명 
CREATE OR REPLACE PROCEDURE empListData
IS
  CURSOR cur IS
    SELECT * FROM emp;
  vemp emp%ROWTYPE;
BEGIN
  FOR vemp IN cur LOOP
   DBMS_OUTPUT.PUT_LINE(vemp.ename||' '||vemp.job||' '||vemp.hiredate);
   EXIT WHEN cur%NOTFOUND;
  END LOOP;
END;
/













