-- 2022-01-11 ����Ŭ (DDL) => 179~
/*
      *** DML / DDL
           ===   ===
            row���� , column���� 
      ������ ���Ǿ� (DDL) => �������� �ʼ� 
                                   => ����Ʈ�� �ʿ��� �����͸� ������ �Ŀ� ���� 
      1. ������ ���� (DML => ����) => INSERT , UPDATE , DELETE 
                                                 => �� (�ζ��κ�,��Į�� ��������, Top-N)
                                                 => ������ (�ߺ����� ������)
                                                 => ���α׷� ���� (PS/SQL,JDBC)
                                                      ====================
                                                 => �ε��� 
                                                 => �����ͺ��̽� �𵨸�(����ȭ, ERD)
          DML : ������ ���� (ROLLBACK) 
          DDL : ������ �Ұ��� (����� ����)
      2. DDL���� ����ϴ� ��ɾ� 
         === ���̺�(���� ����) , ��(�������̺�) , ������ , �ε��� , PL/SQL(����)
                CREATE TABLE , CREATE VIEW , CREATE SEQUENCE, CREATE INDEX
                CREATE FUNCTION , CREATE PROCEDURE , CREATE TRIGGER
                CREATE DATABASE
         === ���� : CREATE 
         === ���� : DROP (�޸𸮿��� ���� ����) 
                         DROP TABLE , DROP VIEW...
         === ���� : ALTER (184page)
                            = �÷� �߰� 
                               ALTER TABLE table_name ADD �÷��� �������� [��������]
                                  => �����Ͱ� �ִ� ��쿡�� (��������=>NOT NULL�� ������ �� ����)
                                  => DEFAULT => ���� 
                            = �÷� ����
                               ALTER TABLE table_name DROP COLUMN �÷��� 
                                  => �÷��� FOREIGN Key (������ �߻�)
                            = �÷� ���� 
                               ALTER TABLE table_name MODIFY �÷��� �������� [��������]
        === ������ �߶󳻱� : TRUNCATE (���̺��� ���� , ������ ��ü�� �߶󳽴�)
                                        ���ϴ� �κи� ���� : DELETE => COMMIT => ���� ���� 
                                        ��ü�� ���� : TRUNCATE (AutoCommit) => ���� �Ұ���
        === ���̺�� , �÷��� ���� => RENAME TABLE old TO new

        *** ��� ���̺��� �̻������� �����ϱ� ���ؼ� => ������ ���Ἲ 
                                 ----------������ �ʴ� �����Ͱ� ���� , ���� 
                                 ----------�ߺ����� ���� �����Ͱ� �ʿ��ϴ� (PRIMARY KEY) => ���� 
                                 ---------- ȫ�浿 (h1), ȫ�浿 (h2), ȫ�浿 (h3)=> ȫ�浿 ȸ�� Ż��
       *** ���̺��� ���� �������� (����ȭ) => �ܷ�Ű-����Ű (���� ���Ἲ) FOREIGN KEY (������ ����� ����)
       === �������� (�ʿ��� �����͸� ������ �ϱ� ���� ���) 
              1)  NOT NULL : NULL�� ������� �ʴ� ������ (�ݵ�� �Է°��� ����)
                   -------------  *�ʼ��Է� (���� �Է� : Spring=>��ȿ�� �˻�)
                   email, tel => NOT NULL(X) => UNIQUE(NULL ���)
                   => ������Ʈ (�⺻ : ���̺� => 14~20) => 45~100
                   ����)
                            �÷� �������� [NOT NULL]
                            �÷� �������� [CONSTRAINT tableName_�÷���_nn NOT NULL]
                            ---------------- �����ͼ����� �����Ͱ� ���� ��쵵 ����
              2) UNIQUE : �ߺ����� ������ (NULL���� ���) 
                   => ��üŰ (id�� �Ҿ���� ��� => ã�� �� �ִ� �÷� ����) : �̸���,��ȭ��ȣ
                   ����)
                            �÷� �������� [UNIQUE]
                            �÷� �������� [CONSTRAINT tableName_�÷���_uk UNIQUE]
              3) CHECK : ������ �����͸� ���� (�ݵ�� ������ �����͸� �߰�)
                   => ��ȭ(�帣) , ȸ��(����,�ٹ���) , ����...
                   ����)
                            �÷� �������� [CONSATRAINT tableName_�÷���_ck 
                            CHECK(�÷��� IN(��,��...))
              4) PRIMARY KEY : �⺻Ű (ROW�� ���� ����) => NOT NULL + UNIQUE 
                   => �Խ��� (�Խù���ȣ), 
                        ��ȭ (��ȭ��ȣ), ���� (���ǹ�ȣ), ȸ������ (ID), ī�װ�(��ȣ) 
                   => ���� ���� : ���̺� �Ѱ��� �ݵ�� ���� 
                   ����)
                           �÷� �������� PRIMARY KEY
                           �÷� �������� [CONSTRAINT tableName_�÷�_pk PRIMARY KEY(�÷�)]      
             5) FOREIGN KEY : �ܷ�Ű => �ٸ� ���̺��� ������ ��쿡 ��� (JOIN)
 
                   => ������ ����� ���� 
                  ����)
                           �÷� �������� [CONSTRAINT tableName_�÷�_fk FOREIGNY KEY(�÷�)
                               REFERENCES �������̺�(�÷���) 
                           ] 
              6) DEFAULT : ����� �Է��� ���� ��� �߰��� ������ ����  
                   => ����� (�ڵ� ���� => SYSDATE)
                   �÷� �������� DEFAULT ��
       === �������� (����Ŭ == �ڹ�) ==> 183page
              1) ������ (�ڹ� : String) 
                    = CHAR(1~2000byte) : ���� �޸� ũ�� 
                       ��) CHAR(10) ==> 'A' => ������ 9byte�� ���� => 10byte�� ���� 
                            ���ڼ��� ���� ��쿡 �ַ� ��� 
                            => ���� (����,����) , �α��� ���� (Y/N)
                            => CHAR(6) , CHAR(1)
                    = VARCHAR2(1~4000byte) : ���� �޸� ũ�� (���������� ���帹�� ���)
                       ��) VARCHAR2(100) => 'A' ==> 1byte�� �޸� 
                                                          'AB' ==> 2byte�� �޸� 
                            => �̸� , ���� , ��ȭ��...
                    = CLOB(4�Ⱑ) : ���� �޸� ũ�� 
                           => �ٰŸ� , ���� �Ұ� , ȸ�� �Ұ� , ���� .... 
              2) ������ (�ڹ� : int , double) 
                    = NUMBER(p,s)  => p�� ���� ���� , s�� �Ҽ��� 
                       => NUMBER ==> NUMBER(8,2)
                       => NUMBER(3)  ==> 0~100 =====> int
                       => NUMBER(2,1) ==> 4.8 , 5.0.... ===> double 
              3) ��¥�� (�ڹ� : java.util.Date)
                    = DATE : �ð� , ��¥ ���� 
              4) ��Ÿ�� (�ڹ� : InputStream) : 4�Ⱑ, ����,�׸� , ���� 
                    = BFILE : ���� �������� ���� 
                    = BLOB : ���̳ʸ� �������� ���� 

              = �Թ� (������ ���̺�) : DML 
              = ��Ʈ������ (2���̻�)
                   => JSP , Spring , �ֽű�� (VueJS , ReactJS, AI(ê��) => �����Ͱ� ����Ŭ
              = �Խ��� / ��� 
              
              board
              -------------------------------------------------------------------------------------------
                   �÷���              no     name    email   subject  content  pwd  regdate  hit
                              �Խù� ��ȣ                                                  
                              ����(ROW)
              -------------------------------------------------------------------------------------------
                   Ű����             pk       nn      null���  nn         nn        nn           
              -------------------------------------------------------------------------------------------
                   �������̺�
              -------------------------------------------------------------------------------------------
                   ���� �÷�
              -------------------------------------------------------------------------------------------
                   CHECK                                                                                         >=0
              -------------------------------------------------------------------------------------------
                   ��������    NUMBER  VARCHAR2 VARCHAR2 VARCHAR2 CLOB VARCHAR2
                                                                                                            DATE   NUMBER
              -------------------------------------------------------------------------------------------
                   ũ��          default(8,2)  34        100             2000                    10      default
              -------------------------------------------------------------------------------------------

              reply
             -------------------------------------------------------------------------------
                �÷���          no       bno     id    name    msg    regdate  
                                  ----      -----                       ------
                ��۰�����ȣ   �Խù� ����                    ���
             -------------------------------------------------------------------------------
                Ű����         pk        fk      nn      nn       nn       default (SYSDATE)
             -------------------------------------------------------------------------------
               �������̺�             board
             -------------------------------------------------------------------------------
               �����÷�                  no
             -------------------------------------------------------------------------------
               CHECK
             -------------------------------------------------------------------------------
               ��������   NUMBER NUMBER VARCHAR2 VARCHAR2 CLOB DATE
             -------------------------------------------------------------------------------
               ũ��                                           20            34 
             -------------------------------------------------------------------------------

             1. �䱸���� �м� (����Ʈ) 
             2. ������ ������ ã�� 
             3. �÷��� ���� 
             4. �������� Ȯ��
             5. �������� Ȯ��
             6. ���� ���̺� ����� 

             ���� : PK , FK , UK , CK , NN
                     ----        ----
                     �ڵ����� �ε����� ��������� 
        
*/
-- board�� ���� 
DROP TABLE board; 
DROP TABLE reply;
/*
     class Board
     {
          ������ ������� 
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
-- NOT NULL,DEFAULT�� �ݵ�� �÷��ڿ� ���� 
-- ������ ���������� �÷������Ŀ� ���߿� ���� 
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







