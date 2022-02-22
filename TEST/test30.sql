-- 2022-01-11 오라클(DML,DDL,TCL)
/*
      SQL (구조화된 질의 언어 => 검색) => 데이터가 저장 (DDL,DML)
      ==== 오라클 명령어 
        ---------------------------------------------------------------------------
                                    요청                      SQL문장 전송
        브라우저(웹) <==========> 자바  <==========>  오라클
              |                      응답                       실행 결과 
          1) 전송방법 (JSP)
          2) 화면 UI (HTML/CSS)
          3) 결과값 출력 (JSP)
       -----------------------------Spring----------------------------------------

       자바 => 오라클로 전송하는 명령어 (DML : INSERT , UPDATE, DELETE,SELECT)
       오라클 자체에서 제작 : DDL (CREATE , ALTER , DROP ,TRUNCATE , RENAME)

       DDL (선언(정의) 언어) 
       ===============
           = TABLE : 데이터 저장 공간 (이차원구조 => column 설계 , 데이터값 채우기)
           = VIEW : 가상 테이블 (이전의 테이블 활용) => 보안 , SQL문장을 단순화 
           = SEQUENCE : 자동 증가 (PRIMARY KEY) => 데이터 중복없이 처리 
           = INDEX : 찾기 쉬게 제작 (속도:최적화) => 퍼포먼스 (VueJS,ReactJS)
                                => 스프링 (설정없는 파일 => Spring-Boot)
           -------------------------------------------------------- PL/SQL (5장) JDBC 
           = FUNCTION : 리턴형을 가지고 있는 함수
           = PROCEDURE : 리턴형이 없는 함수 (기능처리)
           = TRIGGER : 테이블 저장 처리 (입고 => 재고 (자동처리) , 출고 => 재고(자동처리))

        1) 생성하기 위한 명령어 
           = CREATE 
              table : CREATE TABLE , view : CREATE VIEW ... CREATE INDEX , 
        2) 삭제하기 위한 명령어 
           = DROP
              table : DROP TABLE , view : DROP VIEW.... DROP INDEX...
        3) 수정하기 위한 명령어 
           = ALTER 
              ALTER TABLE , ALTER VIEW...
        -------------------------------------TABLE 생성 -----------------------------
        1) 형식 
                 = 테이블 생성 
                  CREATE TABLE  table_name (
                       컬럼명 데이터형 [제약조건], ==> NOT NULL,DEFAULT
                       컬럼명 데이터형 [제약조건],
                       컬럼명 데이터형 [제약조건],
                       [제약조건], ==> PRIMARY KEY , FOREIGN KEY ,CHECK,UNIQUE 
                       [제약조건]...
                  )

                 1. table_name 설정 방법 
                     = 알파벳이나 한글로 시작한다 
                                        === 권장(X) : 운영체제에서 사용하는 한글이 틀리다 
                                        === 개발 (윈도우 , 리눅스=AWS에서 운영체제 리눅스)
                        *** 알파벳은 대소문자 구분하지 않는다 (단 오라클에 저장시 대문자로 저장)
                     = 숫자를 사용할 수 있다 (앞에 사용 할 수 없다)
                     = 글자수는 30byte사용이 가능 (7~12)
                     = 키워드는 사용할 수 없다 (SELECT , INSERT ....)
                     = 특수문자 사용이 가능 ( _ , $ ) => 단어가 두개이상일때 ( _ )
                        food_house , daum_movie , naver_movie ...
                     = 테이블명과 컬럼이 동일해도 된다 (오류(X))
                     = 약속사항 (키워드는 대문자) 
                     = 같은 데이터베이스에서는 테이블명이 같은 이름을 사용하면 안된다 
                        (테이블은 유일값) ==> XE(폴더)
                        *** 현재 XE(데이터베이스)에 생성된 테이블 확인 
                             SELECT * FROM tab;
                     = 테이블안에서 같은 컬럼명을 사용할 수 없다
                             DESC table명 
                     = 테이블명 , 컬럼명, 제약조건 => users_constaints , users_table ....
                 2. 데이터형 
                     = 문자형 (String) 
                         CHAR(1~2000byte)
                        *** VARCHAR2(1~4000byte)
                         CLOB (4기가)
                     = 숫자형 (int, double)
                        NUMBER  =====> NUMBER(8,2) => 실수만 저장하는 것이 아니고 정수
                        NUMBER(10)
                        NUMBER(7,2)
                     = 날짜형 (Date)
                        DATE 
                 3. 제약조건 
                     = NOT NULL : 반드시 값 입력 (이름,성별...)
                     = UNIQUE : 중복허용(X) => NULL을 허용 
                     = PRIMARY KEY : NOT NULL+UNIQUE => 기본키(ROW를 찾기 위한 구분자)
                        상세보기 , 수정 , 삭제 => 주로 숫자 , 특별한 경우 (ID) 
                        *** 한개만 사용한다 (여러개 => 대체키)
                     = FOREIGN KEY : 참조키 (다른 테이블의 컬럼의 값을 참조)
                        게시판 <=> 댓글 , 카테고리 <=> 맛집 , 장바구니 <=> 마이페이지
                        *** 여러개 사용이 가능 
                     = CHECK : 지정된 데이터만 추가 (직위,근무지,부서,성별,메뉴)
                     = DEFAULT : 값이 없는 경우에 자동 추가 

                ==> CREATE 제약조건의 형식 
                       ----------------------------
                       = NOT NULL => 컬럼뒤에 설정 
                       CONSTRAINT table명_컬럼명_nn NOT NULL
                       = UNIQUE => 컬럼선언후에 설정 
                       CONSTRAINT table명_컬럼명_uk UNIQUE(컬럼명)
                       = PRIMARY KEY => 컬럼선언후에 설정
                       CONSTRAINT table명_컬럼명_pk PRIMARY KEY(컬럼명)
                       = FOREIGN KEY => 컬럼선언후에 설정
                       CONSTRAINT table명_컬럼명_fk FOREIGN KEY(컬럼명)
                       REFERENCES 참조테이블명(컬럼)
                       = CHECK => 컬럼선언후에 설정
                       CONSTRAINT table명_컬럼명_ck CHECK(컬럼명 IN('','',''))
                       = DEFAULT => 컬럼뒤에 설정 (0값 초기화, SYSDATE)
                       컬럼명 데이터형 DEFAULT 값
            
           = ALTER 사용법 ==> column (제약조건 => 데이터가 있는 상태)
              1. 추가 (컬럼추가)
                  ALTER TABLE table_name ADD 컬럼명 데이터형 [제약조건]
              2. 컬럼수정 
                  ALTER TABLE table_name MODIFY 컬럼명 데이터형 [제약조건]
              3. 컬럼삭제 
                  ALTER TABLE table_name DROP COLUMN 컬럼명 

          =  DROP 사용법 (테이블 삭제) => 테이블자체를 메모리에서 삭제(데이터까지)
              DROP TABLE table_name

          = TRUNCATE 사용법(테이블은 그대로 유지 , 데이터만 삭제)
             TRUNCATE TABLE table_name

          = RENAME 사용법 (테이블명 변경)
             RENAME old_name TO new_name 

        ------------ DML(데이터 조작)-----------
         *** 제약조건 , 컬럼명 , 컬럼의 순서 
        -- 데이터 첨부 (INSERT)
           = 전체 데이터 첨부
              ***INSERT INTO table_name VALUES(값....) => 값추가시 주의점
                                                                             ------------------
                                                                              숫자형 : 그대로 사용
                                                                              문자형,날짜형: ''
              ===================> 순서 테이블 생성시 순서로 첨부 (갯수)
           = 원하는 컬럼만 첨부 (NULL허용한 컬럼, DEFAULT컬럼)
              ***INSERT INTO table_name(컬럼명1,컬럼명2....) VALUES(값,값)
                                                  -----------------------            -------
                                                          컬럼갯수와 값의 갯수가 일치 
        -- 데이터 수정 (UPADTE)
            UPDATE table_name SET 
            컬럼명=값 , 컬럼명=값 .....
            [WHERE 조건]
        -- 데이터 삭제 (DELETE)
            DELETE FROM table_name
            [WHERE 조건]

        *** 데이터가 변경이 된 상태 : 다시 저장 , 취소 
                                                 ----------- ------
                                                 COMMIT  ROLLBACK 
       ---------------------------------------------      
          DML 
           (SELECT , INSERT , UPADTE , DELETE , MERGE:병합)
          DDL 
            => 수정 , 삭제 , 추가 (***table , constraint)                                                  
*/
/*
CREATE TABLE food(
     no NUMBER
);
*/
-- RENAME food TO food_house;



