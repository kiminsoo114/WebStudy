-- 2022-01-13 (ALTER를 이용한 제약조건 추가)
/*
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
*/
DROP TABLE reply;
DROP TABLE member;
-- 데이터값이 존재 
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

-- PRIMARY KEY => id 
ALTER TABLE member 
ADD CONSTRAINT member_id_pk PRIMARY KEY(id);
-- NOT NULL
ALTER TABLE member
MODIFY pwd CONSTRAINT member_pwd_nn NOT NULL; 

ALTER TABLE member
MODIFY name CONSTRAINT member_name_nn NOT NULL; 

ALTER TABLE member
MODIFY birthday CONSTRAINT member_birthday_nn NOT NULL; 

ALTER TABLE member
MODIFY post CONSTRAINT member_post_nn NOT NULL;

ALTER TABLE member
MODIFY addr1 CONSTRAINT member_addr1_nn NOT NULL;

-- CHECK 
ALTER TABLE member
ADD CONSTRAINT member_sex_ck CHECK(sex IN('남자','여자'));

ALTER TABLE member
ADD CONSTRAINT member_admin_ck CHECK(admin IN('y','n'));

ALTER TABLE member
ADD CONSTRAINT member_login_ck CHECK(login IN('y','n'));

-- UNIQUE
ALTER TABLE member
ADD CONSTRAINT member_email_uk UNIQUE(email);

ALTER TABLE member
ADD CONSTRAINT member_tel_uk UNIQUE(tel);

-- FOREIGN KEY

-- DEFAULT (제약조건이 아니다)
ALTER TABLE member
MODIFY regdate DATE DEFAULT SYSDATE;




