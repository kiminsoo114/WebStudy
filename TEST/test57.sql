-- 2022-01-20 (PROCEDURE , TRIGGER)
/*
      267page ~ 293page 
                      실무 
                      -----
                      PM  (7년차)
             ---------------------------
             |             |         |        |
           PL          PL      DBA   Publisher
           -------------- 5 년차
            |            |
          -----     -------
          |    |     |       |
       경력 신입             ===> ***서버단(Back-End) , 디비단(DBA) , ***프론트(Front-End)

           
      SQL언어 
      ---------- DBA (데이터베이스 관리자) , ***웹프로그래머(개발자)
         DML (SELECT , INSERT,UPADTE,DELETE) -- 웹프로그래머
         ----------------------------------------------------------------
         DDL (CREATE , ALTER , DROP , RENAME , TRUNCATE)
         DCL (GRANT , REVOKE)
         ------------------------------------------------------DBA
         TCL (COMMIT , ROLLBACK) -- 웹프로그래머
         입문 : DDL에서 간단한 테이블 제작이 가능 (게시판,공지사항 , 회원가입)
                  => 데이터형 , 제약조건 
      
      ***** 오라클은 문자열로 된 형식 (형식)
      1. 데이터베이스 연동 프로그램 
         = SQL 전용 언어 (PL/SQL) => 오라클에서 제작  
            1) 문법 
                변수 , 연산자 , 제어문
                = 변수
                     오라클 일반 데이터형(스칼라)
                     ------------------------ NUMBER , DATE , CHAR , VARCHAR2, CLOB
                     *** 오라클에 저장할 수 있는 데이터 (문자열 , 숫자 , 날짜)
                     *** 변수 설정 방식 
                          변수 데이터형;  
                          예)  name VARCHAR2(n)
                                day  DATE 
                                no NUMBER
                = 연산자 (변수에 대한 처리)
                          1) 산술 연산자 ( + , -  , *  , / ) => SELECT절에서 주로 사용 
                          ---------------------------------- WHERE , HAVING
                          2) 논리 연산자 ( AND , OR )
                               = && (입력값을 받는 경우) ==> 이미지 ,댓글 ...
                               = || (문자열 결합) ==> 이미지 
                               *** 데이터수집 (대체하는 문자를 사용)
                               *** 범위 , 기간 
                                    -------------
                                      범위 포함 : AND 
                                      범위 미포함 : OR
                          3) 비교 연산자 ( = , <>(!=) , <  , > , <= , >= ) => true/false
                                                --- 자바(==) , 자바스크립트(===)
                          4) IN (OR가 많은 경우에 사용)
                          5) BETWEEN ~ AND :  >= AND <=  => 포함 (범위,기간)
                              --------------------- 페이지 나누기 , 예약이 가능한 날...
                          6) LIKE : _ (글자수를 알고 있는 상태 : 한글자), %(문자수가 제한이 없다)
                                      => 찾기 (자음으로 찾기는 안된다=>Function)
                          7) NOT : 부정 (!를 사용하면 안된다) 
                                       NOT IN()
                                       NOT LIKE
                                       NOT BETWEEN ~ AND 
                                       NOT (no>=10 AND no<=30)
                          8) NULL : 연산처리가 안된다 (값자체가 존재하는 않는 경우) 
                                         NULL을 연산하면 모든 값이 NULL이다
                                         IS NULL : NULL인 경우
                                         IS NOT NULL : NULL이 아닌 경우 
                           DML에 주로 사용 , Function, Procedure , Trigger에서 사용 
                          ---------------------------------- 
                = 제어문 (조건 , 반복)
                   DML에서는 존재하지 않는다 (DML에서 제어문 => DECODE,CASE)
                                                           --------------------------------- 다중 조건문
                   PL/SQL에서만 존재
                   ---------
                      = 조건문 
                         1) 단일조건문 
                              IF (조건문) THEN
                                 처리문장 (SQL문장)
                              END IF;
                         2) 선택조건문 
                              입고/출고 ==> 재고변경 
                              ------------------------------------- 자동화 처리
                              상품번호 있다면 => 재고는 수정 
                              상품번호가 없다면 => 재고는 추가
                              ---------------------------------------- 트리거  
                              IF (조건문) THEN
                                 처리문장 (SQL문장)
                              ELSE
                                 처리문장 (SQL문장)
                              END IF;
                         3) 다중조건문 
                             IF (조건문) THEN
                                 처리문장(SQL)
                             ELSIF (조건문) THEN
                                 처리문장(SQL)
                             ELSIF (조건문) THEN
                                 처리문장(SQL)
                             ELSE
                                 처리문장 (해당조건이 없는 경우에 처리)
                             END IF;
                      = 반복문  : 프로시저 
                         ***1) FOR (오라클은 저장된 갯수)
                             FOR 받는변수 IN [RESERSE] lo..hi LOOP
                                 반복 문장 수행 
                             END LOOP;
                         2) WHILE
                             WHILE 조건문 LOOP
                                 반복 수행문장 
                             END LOOP;
            = 관련된 명령어를 모아서 처리 (함수) 
            --------------------------------------------
                자바에서 소스 코딩을 줄이는 경우 : 각 업체마다 다를 수 있다 
                => 함수가 처음보는 => Function => 메뉴얼 (자체 라이브러리)
            2) FUNCTION : 리턴형(결과값 => 반드시 1개)을 가지고 있는 함수 
                                  => 사용위치 : SELECT절 => 컬럼대신 사용 
                                  => JOIN/SUBQUERY대신 사용 할 수 있다
                형식)
                        CREATE [OR REPLACE] FUNCTION func_name(매개변수..)
                        RETURN 데이터형
                        IS
                          지역변수 
                        BEGIN
                                SQL문장 처리 
                                RETURN 결과값;
                        END;
                          /
                          *** 결과값 = 데이터형 
            ***3) PROCEDURE : 리턴형은 없고 결과값을 받을 수 있다 (매개변수)
                        => 기능 (반복적인 SQL문장아 있는 경우에 주로 사용) 
                        => 모든 영역에 댓글 
                             영화 상세보기 , 게시판 , 맛집 , 여행...
                        => 1차에서 반복구간에서 => PROCEDURE생성 
                        => 값을 주입 , 값을 가지고 오는 경우
                             ----------- 실제값을 오라클 전송 : INSERT , UPDATE, DELETE(IN) 
                             ----------- 실행한 결과값을 읽어 온다 (OUT) => SELECT
                             ----------- 주입/읽기 => INOUT 
                        => 형식)
                             CREATE [OR REPLACE] PROCEDURE pro_name(
                                 매개변수 IN => 오라클에 실제 데이터값 전송 
                                 매개변수 OUT => 오라클에서 실행한 값을 받는 변수 
                             )
                            IS
                               지역변수 
                            BEGIN
                                SQL문장으로 처리 ==> 값을 받는 경우 
                                SELECT ~ INTO OUT변수 설정 
                                              ------- 실행값을 변수에 대입 
                            END;
                               /
            ***4) TRIGGER : 자동 이벤트 처리 (미리 설정된 조건에 맞는 경우에 자동 실행)
                            *** FUNCTION,PROCEDURE는 자바에 실행할때 호출 
                            *** TRIGGER는 오라클 자체에서 처리 =>자바에서 호출하지 않는다 
                                 보안처리 => 가독성(자바분석이 어렵다)
                            *** 수료 => 오라클 어렵다 
                            *** Trigger는 INSERT,UPDATE , DELETE에서 처리 
                            예) 입고 => INSERT (자동 : 재고)
                     형식)
                              CREATE [OR REPLACE] TRIGGER trigger_name 
                              AFTER|BEFORE (INSERT|UPDATE|DELETE) ON table_name
                              *** AFTER : 입고에서 INSERT가 실행된 다음에 재고처리
                                               -------------------------------------------------
                              *** BEFORE : 입고에서 INSERT가 실행되기 전에 재고처리(PRIMARY KEY)
                              FOR EACH ROW  : 실행될 문장행에 각각 적용 
                              DECLARE
                                  -- 필요한 변수 설정 
                              BEGIN
                                  SQL / 제어문 
                                  => 자동 COMMIT ==> COMMIT을 사용할 수 없다 
                              END;
                               / 
                              ==> 영화정보(테이블) / 댓글(테이블)
                                                                댓글을 올리면 ==> 자동으로 영화정보에 
                                                                                            댓글갯수변경 
                              ==> 인기순위 
                              ==> 게시판 => 상세보기 (조회수 증가)
                       ***** :NEW.컬럼명 : 새로운 값 
                       ***** :OLD.컬럼명 : 기존에 저장된 값 
                       INSERT INTO 입고 VALUES(1,5,1500) => 품번 , 수량 , 금액
                                                             ========
                                                             :NEW.품번 , :NEW.수량 , :NEW.금액 
         ---------------------------------------------
         = 프로그램언어와 연동(자바,C/C++,C#,Python,Kotlin) => 자바에서 제작 
                                         ----- JDBC , ODBC 
         = 웹프로그램(JSP,ASP,PHP,NODEJS)
                            ----              ----------  웹서버(JSP) / 채팅서버 
                                                              http/https        ws 
*/
-- 트리거 연습 
/*
DROP TABLE 상품;
DROP TABLE 입고;
DROP TABLE 출고;
DROP TABLE 재고;
CREATE TABLE 상품(
    품번 NUMBER,
    상품명 VARCHAR2(1000),
    단가 NUMBER
);
CREATE TABLE 입고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER
);
CREATE TABLE 출고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER
);
CREATE TABLE 재고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER,
  누적금액 NUMBER
);

-- 상품 등록 

TRUNCATE TABLE 상품;
INSERT INTO 상품 VALUES(1,'새우깡',1500);
INSERT INTO 상품 VALUES(2,'감자깡',2000);
INSERT INTO 상품 VALUES(3,'맛동산',2500);
INSERT INTO 상품 VALUES(4,'고구마깡',1000);
INSERT INTO 상품 VALUES(5,'짱구',500);
COMMIT;
*/
SELECT * FROM 상품;
-- 트리거 제작 => 입고에서 INSERT => 재고변경
DROP TRIGGER 입고_trigger; 
-- 입고가 먼저 등록이 된 다음에 재고 처리를 한다 : AFTER 
CREATE OR REPLACE TRIGGER input_trigger
/*입고가 끝난 다음에 재고를 처리*/
AFTER INSERT ON 입고 
/* 실행될 문장의 행에 적용 */
FOR EACH ROW
DECLARE
   /* 지역변수 */
   v_cnt NUMBER; 
BEGIN
   /*입고에서 INSERT시 => 같은 품번을 이용시(UPDATE) , 다른 품번 이용시 (INSERT)*/
   SELECT COUNT(*) INTO v_cnt
   FROM 재고
   WHERE 품번=:NEW.품번;

   /*INSERT INTO 입고 VALUES(1,5,1500);*/
   IF (v_cnt=0) THEN
     /*새로운 품목이 입고가 될 경우 => INSERT*/
     INSERT INTO 재고 VALUES(:NEW.품번,:NEW.수량,:NEW.금액,:NEW.수량*:NEW.금액);
   ELSE
     /*기존에 등록된 품목일 경우  => UPDATE (수량 , 누적금액)*/
     UPDATE 재고 SET
     수량=수량+:NEW.수량,
     누적금액=누적금액+(:NEW.수량*:NEW.금액)
     WHERE 품번=:NEW.품번;
   END IF;
END;
/
/*
INSERT INTO 입고 VALUES(1,10,1500);
COMMIT;
SELECT * FROM 입고;
SELECT * FROM 재고;
*/
-- 출고  => 재고 변경 => 자동 처리 (트리거)
CREATE OR REPLACE TRIGGER out_trigger
AFTER INSERT ON 출고 
-- 출고에서 INSERT가 된 경우에 
FOR EACH ROW 
DECLARE 
 -- 지역변수
 v_cnt NUMBER; 
 /*
       INSERT INTO 출고 VALUES(1(품번),5(수량),1500(금액))
       => :NEW.품번 ==> 1 
       => :NEW.수량 ==> 5
       => :NEW.금액 ==> 1500
*/
BEGIN
  SELECT 수량 INTO v_cnt
  FROM 재고
  WHERE 품번=:NEW.품번;
 
  -- 물량 전체를 출고 
  IF (:NEW.수량 = v_cnt) THEN 
    DELETE FROM 재고
    WHERE 품번=:NEW.품번;
  ELSE
    UPDATE 재고 SET
    수량 = 수량-:NEW.수량,
    누적금액=누적금액-(:NEW.수량*:NEW.금액)
    WHERE 품번=:NEW.품번;
   END IF;
END;
/

INSERT INTO 출고 VALUES(1,15,1500);
COMMIT;
SELECT * FROM 출고;
SELECT * FROM 재고;
-- 트리거 (작동방법 => 자동처리) => 테이블이 자동으로 변경 (트리거)
-- 연쇄반응 => 테이블에 값을 INSERT,UPDATE,DELETE => 다른 테이블의 데이터를 연쇄적으로 변경 
-- 자동으로 댓글갯수가 증가 , HIT(조회수) , 쿠키에 저장된 값 증가...
-- 물가 급여 변경 ...










