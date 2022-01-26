-- 2022-01-20 (PROCEDURE , TRIGGER)
/*
      267page ~ 293page 
                      �ǹ� 
                      -----
                      PM  (7����)
             ---------------------------
             |             |         |        |
           PL          PL      DBA   Publisher
           -------------- 5 ����
            |            |
          -----     -------
          |    |     |       |
       ��� ����             ===> ***������(Back-End) , ����(DBA) , ***����Ʈ(Front-End)

           
      SQL��� 
      ---------- DBA (�����ͺ��̽� ������) , ***�����α׷���(������)
         DML (SELECT , INSERT,UPADTE,DELETE) -- �����α׷���
         ----------------------------------------------------------------
         DDL (CREATE , ALTER , DROP , RENAME , TRUNCATE)
         DCL (GRANT , REVOKE)
         ------------------------------------------------------DBA
         TCL (COMMIT , ROLLBACK) -- �����α׷���
         �Թ� : DDL���� ������ ���̺� ������ ���� (�Խ���,�������� , ȸ������)
                  => �������� , �������� 
      
      ***** ����Ŭ�� ���ڿ��� �� ���� (����)
      1. �����ͺ��̽� ���� ���α׷� 
         = SQL ���� ��� (PL/SQL) => ����Ŭ���� ����  
            1) ���� 
                ���� , ������ , ���
                = ����
                     ����Ŭ �Ϲ� ��������(��Į��)
                     ------------------------ NUMBER , DATE , CHAR , VARCHAR2, CLOB
                     *** ����Ŭ�� ������ �� �ִ� ������ (���ڿ� , ���� , ��¥)
                     *** ���� ���� ��� 
                          ���� ��������;  
                          ��)  name VARCHAR2(n)
                                day  DATE 
                                no NUMBER
                = ������ (������ ���� ó��)
                          1) ��� ������ ( + , -  , *  , / ) => SELECT������ �ַ� ��� 
                          ---------------------------------- WHERE , HAVING
                          2) �� ������ ( AND , OR )
                               = && (�Է°��� �޴� ���) ==> �̹��� ,��� ...
                               = || (���ڿ� ����) ==> �̹��� 
                               *** �����ͼ��� (��ü�ϴ� ���ڸ� ���)
                               *** ���� , �Ⱓ 
                                    -------------
                                      ���� ���� : AND 
                                      ���� ������ : OR
                          3) �� ������ ( = , <>(!=) , <  , > , <= , >= ) => true/false
                                                --- �ڹ�(==) , �ڹٽ�ũ��Ʈ(===)
                          4) IN (OR�� ���� ��쿡 ���)
                          5) BETWEEN ~ AND :  >= AND <=  => ���� (����,�Ⱓ)
                              --------------------- ������ ������ , ������ ������ ��...
                          6) LIKE : _ (���ڼ��� �˰� �ִ� ���� : �ѱ���), %(���ڼ��� ������ ����)
                                      => ã�� (�������� ã��� �ȵȴ�=>Function)
                          7) NOT : ���� (!�� ����ϸ� �ȵȴ�) 
                                       NOT IN()
                                       NOT LIKE
                                       NOT BETWEEN ~ AND 
                                       NOT (no>=10 AND no<=30)
                          8) NULL : ����ó���� �ȵȴ� (����ü�� �����ϴ� �ʴ� ���) 
                                         NULL�� �����ϸ� ��� ���� NULL�̴�
                                         IS NULL : NULL�� ���
                                         IS NOT NULL : NULL�� �ƴ� ��� 
                           DML�� �ַ� ��� , Function, Procedure , Trigger���� ��� 
                          ---------------------------------- 
                = ��� (���� , �ݺ�)
                   DML������ �������� �ʴ´� (DML���� ��� => DECODE,CASE)
                                                           --------------------------------- ���� ���ǹ�
                   PL/SQL������ ����
                   ---------
                      = ���ǹ� 
                         1) �������ǹ� 
                              IF (���ǹ�) THEN
                                 ó������ (SQL����)
                              END IF;
                         2) �������ǹ� 
                              �԰�/��� ==> ����� 
                              ------------------------------------- �ڵ�ȭ ó��
                              ��ǰ��ȣ �ִٸ� => ���� ���� 
                              ��ǰ��ȣ�� ���ٸ� => ���� �߰�
                              ---------------------------------------- Ʈ����  
                              IF (���ǹ�) THEN
                                 ó������ (SQL����)
                              ELSE
                                 ó������ (SQL����)
                              END IF;
                         3) �������ǹ� 
                             IF (���ǹ�) THEN
                                 ó������(SQL)
                             ELSIF (���ǹ�) THEN
                                 ó������(SQL)
                             ELSIF (���ǹ�) THEN
                                 ó������(SQL)
                             ELSE
                                 ó������ (�ش������� ���� ��쿡 ó��)
                             END IF;
                      = �ݺ���  : ���ν��� 
                         ***1) FOR (����Ŭ�� ����� ����)
                             FOR �޴º��� IN [RESERSE] lo..hi LOOP
                                 �ݺ� ���� ���� 
                             END LOOP;
                         2) WHILE
                             WHILE ���ǹ� LOOP
                                 �ݺ� ���๮�� 
                             END LOOP;
            = ���õ� ��ɾ ��Ƽ� ó�� (�Լ�) 
            --------------------------------------------
                �ڹٿ��� �ҽ� �ڵ��� ���̴� ��� : �� ��ü���� �ٸ� �� �ִ� 
                => �Լ��� ó������ => Function => �޴��� (��ü ���̺귯��)
            2) FUNCTION : ������(����� => �ݵ�� 1��)�� ������ �ִ� �Լ� 
                                  => �����ġ : SELECT�� => �÷���� ��� 
                                  => JOIN/SUBQUERY��� ��� �� �� �ִ�
                ����)
                        CREATE [OR REPLACE] FUNCTION func_name(�Ű�����..)
                        RETURN ��������
                        IS
                          �������� 
                        BEGIN
                                SQL���� ó�� 
                                RETURN �����;
                        END;
                          /
                          *** ����� = �������� 
            ***3) PROCEDURE : �������� ���� ������� ���� �� �ִ� (�Ű�����)
                        => ��� (�ݺ����� SQL����� �ִ� ��쿡 �ַ� ���) 
                        => ��� ������ ��� 
                             ��ȭ �󼼺��� , �Խ��� , ���� , ����...
                        => 1������ �ݺ��������� => PROCEDURE���� 
                        => ���� ���� , ���� ������ ���� ���
                             ----------- �������� ����Ŭ ���� : INSERT , UPDATE, DELETE(IN) 
                             ----------- ������ ������� �о� �´� (OUT) => SELECT
                             ----------- ����/�б� => INOUT 
                        => ����)
                             CREATE [OR REPLACE] PROCEDURE pro_name(
                                 �Ű����� IN => ����Ŭ�� ���� �����Ͱ� ���� 
                                 �Ű����� OUT => ����Ŭ���� ������ ���� �޴� ���� 
                             )
                            IS
                               �������� 
                            BEGIN
                                SQL�������� ó�� ==> ���� �޴� ��� 
                                SELECT ~ INTO OUT���� ���� 
                                              ------- ���ప�� ������ ���� 
                            END;
                               /
            ***4) TRIGGER : �ڵ� �̺�Ʈ ó�� (�̸� ������ ���ǿ� �´� ��쿡 �ڵ� ����)
                            *** FUNCTION,PROCEDURE�� �ڹٿ� �����Ҷ� ȣ�� 
                            *** TRIGGER�� ����Ŭ ��ü���� ó�� =>�ڹٿ��� ȣ������ �ʴ´� 
                                 ����ó�� => ������(�ڹٺм��� ��ƴ�)
                            *** ���� => ����Ŭ ��ƴ� 
                            *** Trigger�� INSERT,UPDATE , DELETE���� ó�� 
                            ��) �԰� => INSERT (�ڵ� : ���)
                     ����)
                              CREATE [OR REPLACE] TRIGGER trigger_name 
                              AFTER|BEFORE (INSERT|UPDATE|DELETE) ON table_name
                              *** AFTER : �԰��� INSERT�� ����� ������ ���ó��
                                               -------------------------------------------------
                              *** BEFORE : �԰��� INSERT�� ����Ǳ� ���� ���ó��(PRIMARY KEY)
                              FOR EACH ROW  : ����� �����࿡ ���� ���� 
                              DECLARE
                                  -- �ʿ��� ���� ���� 
                              BEGIN
                                  SQL / ��� 
                                  => �ڵ� COMMIT ==> COMMIT�� ����� �� ���� 
                              END;
                               / 
                              ==> ��ȭ����(���̺�) / ���(���̺�)
                                                                ����� �ø��� ==> �ڵ����� ��ȭ������ 
                                                                                            ��۰������� 
                              ==> �α���� 
                              ==> �Խ��� => �󼼺��� (��ȸ�� ����)
                       ***** :NEW.�÷��� : ���ο� �� 
                       ***** :OLD.�÷��� : ������ ����� �� 
                       INSERT INTO �԰� VALUES(1,5,1500) => ǰ�� , ���� , �ݾ�
                                                             ========
                                                             :NEW.ǰ�� , :NEW.���� , :NEW.�ݾ� 
         ---------------------------------------------
         = ���α׷����� ����(�ڹ�,C/C++,C#,Python,Kotlin) => �ڹٿ��� ���� 
                                         ----- JDBC , ODBC 
         = �����α׷�(JSP,ASP,PHP,NODEJS)
                            ----              ----------  ������(JSP) / ä�ü��� 
                                                              http/https        ws 
*/
-- Ʈ���� ���� 
/*
DROP TABLE ��ǰ;
DROP TABLE �԰�;
DROP TABLE ���;
DROP TABLE ���;
CREATE TABLE ��ǰ(
    ǰ�� NUMBER,
    ��ǰ�� VARCHAR2(1000),
    �ܰ� NUMBER
);
CREATE TABLE �԰�(
    ǰ�� NUMBER,
    ���� NUMBER,
    �ݾ� NUMBER
);
CREATE TABLE ���(
    ǰ�� NUMBER,
    ���� NUMBER,
    �ݾ� NUMBER
);
CREATE TABLE ���(
    ǰ�� NUMBER,
    ���� NUMBER,
    �ݾ� NUMBER,
  �����ݾ� NUMBER
);

-- ��ǰ ��� 

TRUNCATE TABLE ��ǰ;
INSERT INTO ��ǰ VALUES(1,'�����',1500);
INSERT INTO ��ǰ VALUES(2,'���ڱ�',2000);
INSERT INTO ��ǰ VALUES(3,'������',2500);
INSERT INTO ��ǰ VALUES(4,'������',1000);
INSERT INTO ��ǰ VALUES(5,'¯��',500);
COMMIT;
*/
SELECT * FROM ��ǰ;
-- Ʈ���� ���� => �԰��� INSERT => �����
DROP TRIGGER �԰�_trigger; 
-- �԰� ���� ����� �� ������ ��� ó���� �Ѵ� : AFTER 
CREATE OR REPLACE TRIGGER input_trigger
/*�԰� ���� ������ ��� ó��*/
AFTER INSERT ON �԰� 
/* ����� ������ �࿡ ���� */
FOR EACH ROW
DECLARE
   /* �������� */
   v_cnt NUMBER; 
BEGIN
   /*�԰��� INSERT�� => ���� ǰ���� �̿��(UPDATE) , �ٸ� ǰ�� �̿�� (INSERT)*/
   SELECT COUNT(*) INTO v_cnt
   FROM ���
   WHERE ǰ��=:NEW.ǰ��;

   /*INSERT INTO �԰� VALUES(1,5,1500);*/
   IF (v_cnt=0) THEN
     /*���ο� ǰ���� �԰� �� ��� => INSERT*/
     INSERT INTO ��� VALUES(:NEW.ǰ��,:NEW.����,:NEW.�ݾ�,:NEW.����*:NEW.�ݾ�);
   ELSE
     /*������ ��ϵ� ǰ���� ���  => UPDATE (���� , �����ݾ�)*/
     UPDATE ��� SET
     ����=����+:NEW.����,
     �����ݾ�=�����ݾ�+(:NEW.����*:NEW.�ݾ�)
     WHERE ǰ��=:NEW.ǰ��;
   END IF;
END;
/
/*
INSERT INTO �԰� VALUES(1,10,1500);
COMMIT;
SELECT * FROM �԰�;
SELECT * FROM ���;
*/
-- ���  => ��� ���� => �ڵ� ó�� (Ʈ����)
CREATE OR REPLACE TRIGGER out_trigger
AFTER INSERT ON ��� 
-- ����� INSERT�� �� ��쿡 
FOR EACH ROW 
DECLARE 
 -- ��������
 v_cnt NUMBER; 
 /*
       INSERT INTO ��� VALUES(1(ǰ��),5(����),1500(�ݾ�))
       => :NEW.ǰ�� ==> 1 
       => :NEW.���� ==> 5
       => :NEW.�ݾ� ==> 1500
*/
BEGIN
  SELECT ���� INTO v_cnt
  FROM ���
  WHERE ǰ��=:NEW.ǰ��;
 
  -- ���� ��ü�� ��� 
  IF (:NEW.���� = v_cnt) THEN 
    DELETE FROM ���
    WHERE ǰ��=:NEW.ǰ��;
  ELSE
    UPDATE ��� SET
    ���� = ����-:NEW.����,
    �����ݾ�=�����ݾ�-(:NEW.����*:NEW.�ݾ�)
    WHERE ǰ��=:NEW.ǰ��;
   END IF;
END;
/

INSERT INTO ��� VALUES(1,15,1500);
COMMIT;
SELECT * FROM ���;
SELECT * FROM ���;
-- Ʈ���� (�۵���� => �ڵ�ó��) => ���̺��� �ڵ����� ���� (Ʈ����)
-- ������� => ���̺� ���� INSERT,UPDATE,DELETE => �ٸ� ���̺��� �����͸� ���������� ���� 
-- �ڵ����� ��۰����� ���� , HIT(��ȸ��) , ��Ű�� ����� �� ����...
-- ���� �޿� ���� ...










