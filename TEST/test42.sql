-- 2022-01-13 (제약조건 제어,제약조건 확인) 
DROP TABLE reply;
DROP TABLE board;
DROP TABLE member;
/*
        member
          = ID  ==> 중복이 없는 값 대입 (기본키)
          = PWD => 비밀번호 (NN)
          = NAME => (NN)
          = SEX => CHECK 
          = BIRTHDAY => DATE 
          = EMAIL => UNIQUE
          = POST  => NN
          = ADDR1 => NN
          = ADDR2 => NULL허용 
          = TEL => UNIQUE
          = CONTENT => NULL허용 
          = REGDATE => DEFAULT 
          = ADMIN => Y/N
          = LOGIN  => Y/N
        board
          = NO => 시퀀스 (기본키)
          = NAME => NN
          = EMAIL => NULL 허용
          = SUBJECT => NN
          = CONTENT => NN
          = PWD => NN
          = REGDATE => DEFAULT
          = HIT => DEFAULT
        reply
          = NO => 시퀀스(기본키)
          = BNO => 게시물 번호 참조 
          = ID => FK (MEMBER)
          = NAME => NN
          = MSG => NN
          = REGDATE => DEFAULT
*/
/*
     제약조건(이상현상 방지 => 데이터 무결성,참조 무결성)
                  ---------- 수정,삭제시 다른 ROW에 영향이 없게 만든다 
                  ---------- 프로그램에 필요한 데이터만 첨부 (정형화된 데이터)
                  ---------- 빅데이터,AI => 데이터관리 
                               (형태소 , 데이터마이닝) 
    =  NOT NULL : NULL을 허용하지 않는다 (반드시 입력값이 있어야 한다)
    =  UNIQUE : 유일값을 저장(중복이 없는 데이터) => NULL허용 
    =  PRIMARY KEY : 기본키 (NOT NULL+UNIQUE) => ROW를 찾기위한
                                          구분자 : 권장(반드시 테이블에는 기본키가 존재)
        => 특별한 경우가 아니면 숫자를 이용한다 (시퀀스)
    =  FOREIGN KEY : 참조키 (다른 테이블의 데이터를 연결)
        참조하는 값은 반드시 저장이 되어 있는 값만 사용이 가능 
            -- 삭제 (참조테이블,참조대상테이블)
                                       ----------------- 삭제 (2)
                       ------------ 삭제  (1)
            예) 댓글 / 게시물 
                 게시물을 삭제하려면 => 반드시 댓글을 먼저 삭제후에 게시물 삭제 
    = CHECK : 지정된 데이터만 첨부 
    = DEFAULT : 사용자가 값을 전송하지 않은 경우 자동으로 지정된 데이터 첨부 
       ----------- 게시물번호 , 오늘 날짜 
                     -------------  -----------
                          |                 | DEFAULT를 이용해서 첨부 
                      시퀀스를 이용해서 자동 추가 
   -- ALTER를 이용해서 제약조건을 설정 
    CREATE TABLE member(
      id VARCHAR2(20),
      pwd VARCHAR2(10),
      name VARCHAR2(34),
      sex VARCHAR2(6),
      birthday DATE,
      email VARCHAR2(100),
      post VARCHAR2(7),
      addr1 VARCHAR2(200),
      addr2 VARCHAR2(200),
      tel VARCHAR2(20),
      content CLOB,
      regdate DATE,
      admin CHAR(1),
      login CHAR(1)
    );
     
    제약조건 확인하는 SQL 
    SELECT owner,constraint_name,constraint_type
    FROM user_constraints
    WHERE table_name='MEMBER';

    SELECT owner,constraint_name,table_name,
       column_name
   FROM user_cons_columns
   WHERE table_name='MEMBER';
	
*/
-- BYTE => EUC-KR(한글자당 2byte) , UTF-8(Unicode) => 한글자 Byte : 3Byte)
-- Member제작 (회원가입)
CREATE TABLE member(
   id VARCHAR2(20),
  pwd VARCHAR2(10) CONSTRAINT member_pwd_nn NOT NULL,
  name VARCHAR2(34) CONSTRAINT member_name_nn NOT NULL,
  sex VARCHAR2(6),
  birthday DATE CONSTRAINT member_birthday_nn NOT NULL,
  email VARCHAR2(100),
  post VARCHAR2(7) CONSTRAINT member_post_nn NOT NULL,
  addr1 VARCHAR2(200) CONSTRAINT member_addr1_nn NOT NULL,
  addr2 VARCHAR2(200),
  tel VARCHAR2(20),
  content CLOB,
  regdate DATE DEFAULT SYSDATE,
  admin CHAR(1) DEFAULT 'n',
  login CHAR(1) DEFAULT 'n',
  CONSTRAINT member_id_pk PRIMARY KEY(id),
  CONSTRAINT member_sex_ck CHECK(sex IN('남자','여자')),
  CONSTRAINT member_email_uk UNIQUE(email),
  CONSTRAINT member_tel_uk UNIQUE(tel),
  CONSTRAINT member_admin_ck CHECK(admin IN('y','n')),
  CONSTRAINT member_login_ck CHECK(login IN('y','n'))
);
-- Board 제작 
CREATE TABLE board(
  no NUMBER,
  name VARCHAR2(34) CONSTRAINT board_name_nn NOT NULL,
  email VARCHAR2(100),
  subject VARCHAR2(2000) CONSTRAINT board_subject_nn NOT NULL,
  content CLOB CONSTRAINT board_content_nn NOT NULL,
  pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
  regdate DATE DEFAULT SYSDATE,
  hit NUMBER DEFAULT 0,
  CONSTRAINT board_no_pk PRIMARY KEY(no)
);
-- 댓글 제작 
-- 컬럼뒤에 => NOT NULL, DEFAULT 
-- 컬럼 선언후에 => PRIMARY , FOREIGN , CHECK 
CREATE TABLE reply(
   no NUMBER,
   bno NUMBER,
   id VARCHAR2(20),
   name VARCHAR2(34) CONSTRAINT reply_name_nn NOT NULL,
   msg CLOB CONSTRAINT reply_msg_nn NOT NULL,
   regdate DATE DEFAULT SYSDATE,
   CONSTRAINT reply_no_pk PRIMARY KEY(no),
   CONSTRAINT reply_bno_fk FOREIGN KEY(bno)
   REFERENCES board(no),
   CONSTRAINT reply_id_fk FOREIGN KEY(id)
   REFERENCES member(id) 
);
/*
    constraint_type
    C : NOT NULL , CHECK
    R : FOREIGN
    U : UNIQUE  
    P : PRIMARY
*/
-- 제약조건 확인 
SELECT owner,constraint_name,constraint_type
FROM user_constraints
WHERE table_name='MEMBER';

SELECT owner,constraint_name,constraint_type
FROM user_constraints
WHERE table_name='BOARD';

SELECT owner,constraint_name,constraint_type
FROM user_constraints
WHERE table_name='REPLY';









