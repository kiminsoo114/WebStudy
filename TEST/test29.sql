-- 2022-01-11 DML(������ ���۾��) 
/*
      SABUN                                     NOT NULL NUMBER(4)
      --------- PRIMARY KEY
      NAME                                      NOT NULL VARCHAR2(34)
      --------- NOT NULL
      DEPT                                        VARCHAR2(9)
      LOC                                          VARCHAR2(2)
      JOB                                          VARCHAR2(6)
      --------------------------------- CHECK (������ �����͸� �Է�)
      HIREDATE                                 DATE
      ------------ YY/MM/DD
      PAY                                          NUMBER
      COMM                                      NUMBER
      ------------ NULL��� 

      ������ ���� 
      -------------
       1) ������ �߰� : INSERT 
       2) ������ ���� : UPDATE 
       3) ������ ���� : DELETE
       4) ������ �˻� : SELECT 
*/
-- sawon�� ������ �߰� 
-- ��ü �߰� 
-- ���� �߻�(������ Ʋ����)
-- INSERT INTO sawon VALUES(1000,'ȫ�浿','���ߺ�','����','�븮','19/02/03',3600);
-- ���� �߻�(����� �ߺ�����)
-- INSERT INTO sawon VALUES(1000,'�ڹ���','������','�λ�','���','21/11/20',3000,NULL);
-- ���� �߻�(���ֻ���� �� ����)
-- INSERT INTO sawon VALUES(1001,'��û��','�ѹ���','����','����','15/01/03',5000,300);
-- �ڸ��� : TRUNCATE TABLE table_name
-- TRUNCATE TABLE sawon;
-- ���� ������ ÷�� 
/*
INSERT INTO sawon VALUES(1000,'ȫ�浿','���ߺ�','����','�븮','19/02/03',3600,NULL);
INSERT INTO sawon VALUES(1001,'�ڹ���','������','�λ�','���','21/03/01',3000,NULL);
INSERT INTO sawon VALUES(1002,'��û��','�����','�λ�','����','16/11/10',4500,NULL);
INSERT INTO sawon VALUES(1003,'������','�ѹ���','���','����','12/10/15',5600,NULL);
INSERT INTO sawon VALUES(1004,'�̼���','���ߺ�','����','���','21/03/01',3000,NULL);
-- ���� ��ɾ ���� (�ڹٿ��� Auto) 
COMMIT;

-- ���ϴ� �÷��� ����  => DEFAULT ���� , NULL�� �ڵ����� ó�� (192page)
   *** COMMIT�� �����ϸ� => ROLLBACK�� ������� �ʴ´� 
   *** COMMIT ���� RollBack�� �����Ͽ� ���������� ���� 
   COMMIT => �޸𸮾ȿ� ���� (�����ϱ�)
   ROLLBACK => ����Ŭ ��� ��� (������ϱ�)
*/
/*
INSERT INTO sawon(sabun,name,dept,loc,job,pay)
VALUES(1005,'������','���ߺ�','����','���',3100);
*/
/*
-- INSERT , UPDATE , DELETE => COMMIT ��� (����)
INSERT INTO sawon(sabun,name,dept,loc,job,pay,comm)
VALUES(1006,'������','�ѹ���','���','�븮',3700,300);
COMMIT; 
*/
-- ����(DELETE)  => ROW���� (INSERT,UPDATE,SELECT)  
/*
    ��ü ���� 
    DELETE FROM table_name 
    ���ϴ� ������ ����   
    DELETE FROM table_name
    WHERE �÷���=��
               -------- ����(PK)
*/
--DELETE FROM sawon;
--SELECT * FROM sawon;
--DELETE FROM sawon
--WHERE name='������';
--SELECT * FROM sawon;
/*
     UPDATE (����)
     ����)
     UPDATE table_name SET
     ----------                  ----
     �÷���=��(����) , �÷���=�� , �÷���=�� 
     (= ���Կ�����)
     [WHERE �÷���=�� (= �񱳿�����)]
      *** WHERE���� ����ϸ� �񱳿�����
      *** WHERE�ܿ��� ����ϸ� ���Կ�����

     INSERT , UPDATE , DELETE => ���������� ����(COMMIT) ,
                                                 ��ɾ ���(ROLLBACK)
     *** DDL�� �ڵ�ó�� (COMMIT,ROLLBACK�� ������� �ʴ´�)  

     INSERT INTO sawon(sabun,name,dept,loc,job,pay)
     VALUES(1005,'������','���ߺ�','����','���',3100);
*/
-- ���� 
/*
UPDATE sawon SET
dept='�ѹ���' , loc='�λ�' , job='�븮' , pay=3600 , comm=500 
WHERE sabun=1005;

SELECT * FROM sawon;
*/
/*
     ========> 3�� (�⺻ SQL)
     ����)
        DDL ==> column
          = CREATE
          = ALTER (ADD,MODIFY,DROP)
          = DROP 
          = TRUNCATE
          = RENAME 
       ------------------------- ROW
        DML
          = INSERT 
          = UPDATE
          = DELETE
        DQL
          = SELECT  
       -------------------------

       1. ���� , 2. ���� (���̺� => ����Ʈ)
       2. �˻� (SELECT) 
*/










