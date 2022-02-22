-- 2022-01-11 오라클 (DDL) => 179~
/*
      *** DML / DDL
           ===   ===
            row단위 , column단위 
      데이터 정의어 (DDL) => 웹에서는 필수 
                                   => 사이트에 필요한 데이터를 저장한 후에 제어 
      1. 데이터 저장 (DML => 제어) => INSERT , UPDATE , DELETE 
                                                 => 뷰 (인라인뷰,스칼라 서브쿼리, Top-N)
                                                 => 시퀀스 (중복없이 데이터)
                                                 => 프로그램 제어 (PS/SQL,JDBC)
                                                      ====================
                                                 => 인덱스 
                                                 => 데이터베이스 모델링(정규화, ERD)
          DML : 복구가 가능 (ROLLBACK) 
          DDL : 복구가 불가능 (사용자 계정)
      2. DDL에서 사용하는 명령어 
         === 테이블(저장 공간) , 뷰(가상테이블) , 시퀀스 , 인덱스 , PL/SQL(선언)
                CREATE TABLE , CREATE VIEW , CREATE SEQUENCE, CREATE INDEX
                CREATE FUNCTION , CREATE PROCEDURE , CREATE TRIGGER
                CREATE DATABASE
         === 생성 : CREATE 
         === 삭제 : DROP (메모리에서 완전 삭제) 
                         DROP TABLE , DROP VIEW...
         === 수정 : ALTER (184page)
                            = 컬럼 추가 
                               ALTER TABLE table_name ADD 컬럼명 데이터형 [제약조건]
                                  => 데이터가 있는 경우에는 (제약조건=>NOT NULL을 지정할 수 없다)
                                  => DEFAULT => 설정 
                            = 컬럼 삭제
                               ALTER TABLE table_name DROP COLUMN 컬럼명 
                                  => 컬럼이 FOREIGN Key (문제점 발생)
                            = 컬럼 수정 
                               ALTER TABLE table_name MODIFY 컬럼명 데이터형 [제약조건]
        === 데이터 잘라내기 : TRUNCATE (테이블은 존재 , 데이터 전체를 잘라낸다)
                                        원하는 부분만 삭제 : DELETE => COMMIT => 복구 가능 
                                        전체를 삭제 : TRUNCATE (AutoCommit) => 복구 불가능
        === 테이블명 , 컬럼명 변경 => RENAME TABLE old TO new

        *** 모든 테이블은 이상현상을 방지하기 위해서 => 데이터 무결성 
                                 ----------원하지 않는 데이터가 수정 , 삭제 
                                 ----------중복되지 않은 데이터가 필요하다 (PRIMARY KEY) => 권장 
                                 ---------- 홍길동 (h1), 홍길동 (h2), 홍길동 (h3)=> 홍길동 회원 탈퇴
       *** 테이블이 많이 나눠진다 (정규화) => 외래키-참조키 (참조 무결성) FOREIGN KEY (여러개 사용이 가능)
       === 제약조건 (필요한 데이터만 저장을 하기 위한 방법) 
              1)  NOT NULL : NULL을 허용하지 않는 데이터 (반드시 입력값을 주입)
                   -------------  *필수입력 (강제 입력 : Spring=>유효성 검사)
                   email, tel => NOT NULL(X) => UNIQUE(NULL 허용)
                   => 프로젝트 (기본 : 테이블 => 14~20) => 45~100
                   형식)
                            컬럼 데이터형 [NOT NULL]
                            컬럼 데이터형 [CONSTRAINT tableName_컬럼명_nn NOT NULL]
                            ---------------- 데이터수집시 데이터가 없는 경우도 존재
              2) UNIQUE : 중복없는 데이터 (NULL값을 허용) 
                   => 대체키 (id를 잃어버린 경우 => 찾을 수 있는 컬럼 지정) : 이메일,전화번호
                   형식)
                            컬럼 데이터형 [UNIQUE]
                            컬럼 데이터형 [CONSTRAINT tableName_컬럼명_uk UNIQUE]
              3) CHECK : 저장할 데이터를 지정 (반드시 지정된 데이터만 추가)
                   => 영화(장르) , 회사(직위,근무지) , 성별...
                   형식)
                            컬럼 데이터형 [CONSATRAINT tableName_컬럼명_ck 
                            CHECK(컬럼명 IN(값,값...))
              4) PRIMARY KEY : 기본키 (ROW에 대한 구분) => NOT NULL + UNIQUE 
                   => 게시판 (게시물번호), 
                        영화 (영화번호), 음악 (음악번호), 회원가입 (ID), 카테고리(번호) 
                   => 권장 사항 : 테이블 한개를 반드시 포함 
                   형식)
                           컬럼 데이터형 PRIMARY KEY
                           컬럼 데이터형 [CONSTRAINT tableName_컬럼_pk PRIMARY KEY(컬럼)]      
             5) FOREIGN KEY : 외래키 => 다른 테이블을 참조할 경우에 사용 (JOIN)
 
                   => 여러개 사용이 가능 
                  형식)
                           컬럼 데이터형 [CONSTRAINT tableName_컬럼_fk FOREIGNY KEY(컬럼)
                               REFERENCES 참조테이블(컬럼명) 
                           ] 
              6) DEFAULT : 사용자 입력이 없는 경우 추가할 데이터 설정  
                   => 등록일 (자동 지정 => SYSDATE)
                   컬럼 데이터형 DEFAULT 값
       === 데이터형 (오라클 == 자바) ==> 183page
              1) 문자형 (자바 : String) 
                    = CHAR(1~2000byte) : 고정 메모리 크기 
                       예) CHAR(10) ==> 'A' => 나머지 9byte는 공백 => 10byte를 유지 
                            글자수가 같은 경우에 주로 사용 
                            => 성별 (남자,여자) , 로그인 여부 (Y/N)
                            => CHAR(6) , CHAR(1)
                    = VARCHAR2(1~4000byte) : 가변 메모리 크기 (현실적으로 가장많이 사용)
                       예) VARCHAR2(100) => 'A' ==> 1byte만 메모리 
                                                          'AB' ==> 2byte만 메모리 
                            => 이름 , 직위 , 영화명...
                    = CLOB(4기가) : 가변 메모리 크기 
                           => 줄거리 , 음악 소개 , 회사 소개 , 뉴스 .... 
              2) 숫자형 (자바 : int , double) 
                    = NUMBER(p,s)  => p는 숫자 갯수 , s는 소수점 
                       => NUMBER ==> NUMBER(8,2)
                       => NUMBER(3)  ==> 0~100 =====> int
                       => NUMBER(2,1) ==> 4.8 , 5.0.... ===> double 
              3) 날짜형 (자바 : java.util.Date)
                    = DATE : 시간 , 날짜 저장 
              4) 기타형 (자바 : InputStream) : 4기가, 음악,그림 , 사진 
                    = BFILE : 파일 형식으로 저장 
                    = BLOB : 바이너리 형식으로 저장 

              = 입문 (간단한 테이블) : DML 
              = 포트폴리어 (2개이상)
                   => JSP , Spring , 최신기술 (VueJS , ReactJS, AI(챗봇) => 데이터가 오라클
              = 게시판 / 댓글 
              
              board
              -------------------------------------------------------------------------------------------
                   컬럼명              no     name    email   subject  content  pwd  regdate  hit
                              게시물 번호                                                  
                              구분(ROW)
              -------------------------------------------------------------------------------------------
                   키종류             pk       nn      null허용  nn         nn        nn           
              -------------------------------------------------------------------------------------------
                   참조테이블
              -------------------------------------------------------------------------------------------
                   참조 컬럼
              -------------------------------------------------------------------------------------------
                   CHECK                                                                                         >=0
              -------------------------------------------------------------------------------------------
                   데이터형    NUMBER  VARCHAR2 VARCHAR2 VARCHAR2 CLOB VARCHAR2
                                                                                                            DATE   NUMBER
              -------------------------------------------------------------------------------------------
                   크기          default(8,2)  34        100             2000                    10      default
              -------------------------------------------------------------------------------------------

              reply
             -------------------------------------------------------------------------------
                컬럼명          no       bno     id    name    msg    regdate  
                                  ----      -----                       ------
                댓글고유번호   게시물 참조                    댓글
             -------------------------------------------------------------------------------
                키종류         pk        fk      nn      nn       nn       default (SYSDATE)
             -------------------------------------------------------------------------------
               참조테이블             board
             -------------------------------------------------------------------------------
               참조컬럼                  no
             -------------------------------------------------------------------------------
               CHECK
             -------------------------------------------------------------------------------
               데이터형   NUMBER NUMBER VARCHAR2 VARCHAR2 CLOB DATE
             -------------------------------------------------------------------------------
               크기                                           20            34 
             -------------------------------------------------------------------------------

             1. 요구사항 분석 (사이트) 
             2. 저장할 데이터 찾기 
             3. 컬럼명 결정 
             4. 데이터형 확인
             5. 제약조건 확인
             6. 실제 테이블 만들기 

             약자 : PK , FK , UK , CK , NN
                     ----        ----
                     자동으로 인덱스가 만들어진다 
        
*/
-- board를 삭제 
DROP TABLE board; 
DROP TABLE reply;
/*
     class Board
     {
          저장할 멤버변수 
          int no;
          String name,email,subject,content,pwd;
          Date regdate;
          int hit;
     }
*/
CREATE TABLE board(
   no NUMBER,
   name VARCHAR2(34) CONSTRAINT board_name_nn NOT NULL,
   email VARCHAR2(100),
   subject VARCHAR2(2000) CONSTRAINT board_subject_nn NOT NULL,
   content CLOB CONSTRAINT board_content_nn NOT NULL,
   pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
   regdate DATE DEFAULT SYSDATE,
   hit NUMBER,
   CONSTRAINT board_no_pk PRIMARY KEY(no),
   CONSTRAINT board_hit_ck  CHECK(hit>=0)
);
-- NOT NULL,DEFAULT는 반드시 컬럼뒤에 설정 
-- 나머지 제약조건은 컬럼선언후에 나중에 설정 
CREATE TABLE reply(
   no NUMBER,
   bno NUMBER,
   id VARCHAR2(20) CONSTRAINT reply_id_nn NOT NULL,
   name VARCHAR2(34) CONSTRAINT reply_name_nn NOT NULL,
   msg CLOB CONSTRAINT reply_msg_nn NOT NULL,
   regdate DATE DEFAULT SYSDATE,
   CONSTRAINT reply_no_pk PRIMARY KEY(no),
   CONSTRAINT reply_bno_fk FOREIGN KEY(bno)
   REFERENCES board(no)
);







