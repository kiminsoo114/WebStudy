-- 2022-01-13 (����Ŭ - ������) 
/*
      ������ : �ڵ� ���� ��ȣ (Primary Key)
                  �Խù���ȣ , ��ȭ��ȣ , ���ǹ�ȣ , ������ȣ ...
      ���� ��� => MYSQL,MARIADB => �÷��ڿ� AUTOINCREMENT()
         = CREATE SQUENCE seq_name 
                                       ------------  �ߺ����� ����Ǹ� �ȵȴ� 
                                       ------------  ���̺��_�÷���_seq
            ***1) START WITH : ���۹�ȣ (�⺻ 1������ ����)
                       => START WITH 1
            ***2) INCREMENT BY : ������ 
                       => INCREMENT BY 1 
            3) MAX_VALUE : �ִ밪 (����)
            4) MIN_VALUE: �ּҰ�
            ***5) CACHE | NOCACHE : ������� 
                    --------- 20������ �޸� ���� ó�� (X)
                    --------- ������� ���� ���� ó�� (O)
            ***6) CYCLE | NOCYCLE : PRIMARY => NOCYCLE 
      ���� ��� 
         = DROP SEQUNCE sql_name

      ���� �о���� ��� 
        = ���簪 => currval
        = ������ �� => nextval (O)
        = ������ ���� 
             1
             2
             3
             4 
             5 => ����
           =======   1 2 3 4 6
      ===> SELECT MAX(no)+1 FROM table_name
*/
-- ������ ���̺� 
DROP TABLE student;
CREATE TABLE student(
     hakbun NUMBER,
     name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
     kor NUMBER(3),
     eng NUMBER(3),
     math NUMBER(3),
     CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun),
     CONSTRAINT std_kor_ck CHECK(kor>=0),
     CONSTRAINT std_eng_ck CHECK(eng>=0),
     CONSTRAINT std_math_ck CHECK(math>=0)
);
-- ������ ���� 
/*
CREATE SEQUENCE std_hakbun_seq
      START WITH 100
      INCREMENT BY 1
      NOCACHE 
      NOCYCLE;
*/
-- �� �߰�
/*
INSERT INTO student VALUES(std_hakbun_seq.nextval,'ȫ�浿',90,80,70);
INSERT INTO student VALUES(std_hakbun_seq.nextval,'��û��',90,80,70);
INSERT INTO student VALUES(std_hakbun_seq.nextval,'�ڹ���',90,80,70);
INSERT INTO student VALUES(std_hakbun_seq.nextval,'�̼���',90,80,70);
INSERT INTO student VALUES(std_hakbun_seq.nextval,'������',90,80,70);
COMMIT;
*/

SELECT std_hakbun_seq.currval FROM DUAL;
SELECT std_hakbun_seq.nextval FROM DUAL;
--SELECT * FROM student;










