-- 2022-01-13 (�������� ����,�������� Ȯ��) 
DROP TABLE reply;
DROP TABLE board;
DROP TABLE member;
/*
        member
          = ID  ==> �ߺ��� ���� �� ���� (�⺻Ű)
          = PWD => ��й�ȣ (NN)
          = NAME => (NN)
          = SEX => CHECK 
          = BIRTHDAY => DATE 
          = EMAIL => UNIQUE
          = POST  => NN
          = ADDR1 => NN
          = ADDR2 => NULL��� 
          = TEL => UNIQUE
          = CONTENT => NULL��� 
          = REGDATE => DEFAULT 
          = ADMIN => Y/N
          = LOGIN  => Y/N
        board
          = NO => ������ (�⺻Ű)
          = NAME => NN
          = EMAIL => NULL ���
          = SUBJECT => NN
          = CONTENT => NN
          = PWD => NN
          = REGDATE => DEFAULT
          = HIT => DEFAULT
        reply
          = NO => ������(�⺻Ű)
          = BNO => �Խù� ��ȣ ���� 
          = ID => FK (MEMBER)
          = NAME => NN
          = MSG => NN
          = REGDATE => DEFAULT
*/
/*
     ��������(�̻����� ���� => ������ ���Ἲ,���� ���Ἲ)
                  ---------- ����,������ �ٸ� ROW�� ������ ���� ����� 
                  ---------- ���α׷��� �ʿ��� �����͸� ÷�� (����ȭ�� ������)
                  ---------- ������,AI => �����Ͱ��� 
                               (���¼� , �����͸��̴�) 
    =  NOT NULL : NULL�� ������� �ʴ´� (�ݵ�� �Է°��� �־�� �Ѵ�)
    =  UNIQUE : ���ϰ��� ����(�ߺ��� ���� ������) => NULL��� 
    =  PRIMARY KEY : �⺻Ű (NOT NULL+UNIQUE) => ROW�� ã������
                                          ������ : ����(�ݵ�� ���̺��� �⺻Ű�� ����)
        => Ư���� ��찡 �ƴϸ� ���ڸ� �̿��Ѵ� (������)
    =  FOREIGN KEY : ����Ű (�ٸ� ���̺��� �����͸� ����)
        �����ϴ� ���� �ݵ�� ������ �Ǿ� �ִ� ���� ����� ���� 
            -- ���� (�������̺�,����������̺�)
                                       ----------------- ���� (2)
                       ------------ ����  (1)
            ��) ��� / �Խù� 
                 �Խù��� �����Ϸ��� => �ݵ�� ����� ���� �����Ŀ� �Խù� ���� 
    = CHECK : ������ �����͸� ÷�� 
    = DEFAULT : ����ڰ� ���� �������� ���� ��� �ڵ����� ������ ������ ÷�� 
       ----------- �Խù���ȣ , ���� ��¥ 
                     -------------  -----------
                          |                 | DEFAULT�� �̿��ؼ� ÷�� 
                      �������� �̿��ؼ� �ڵ� �߰� 
   -- ALTER�� �̿��ؼ� ���������� ���� 
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
     
    �������� Ȯ���ϴ� SQL 
    SELECT owner,constraint_name,constraint_type
    FROM user_constraints
    WHERE table_name='MEMBER';

    SELECT owner,constraint_name,table_name,
       column_name
   FROM user_cons_columns
   WHERE table_name='MEMBER';
	
*/
-- BYTE => EUC-KR(�ѱ��ڴ� 2byte) , UTF-8(Unicode) => �ѱ��� Byte : 3Byte)
-- Member���� (ȸ������)
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
  CONSTRAINT member_sex_ck CHECK(sex IN('����','����')),
  CONSTRAINT member_email_uk UNIQUE(email),
  CONSTRAINT member_tel_uk UNIQUE(tel),
  CONSTRAINT member_admin_ck CHECK(admin IN('y','n')),
  CONSTRAINT member_login_ck CHECK(login IN('y','n'))
);
-- Board ���� 
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
-- ��� ���� 
-- �÷��ڿ� => NOT NULL, DEFAULT 
-- �÷� �����Ŀ� => PRIMARY , FOREIGN , CHECK 
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
-- �������� Ȯ�� 
SELECT owner,constraint_name,constraint_type
FROM user_constraints
WHERE table_name='MEMBER';

SELECT owner,constraint_name,constraint_type
FROM user_constraints
WHERE table_name='BOARD';

SELECT owner,constraint_name,constraint_type
FROM user_constraints
WHERE table_name='REPLY';









