-- 2022-01-11 ����Ŭ ����(179~192)
/*
    �Ǹ���ǥ
���� / �÷�	��ǥ��ȣ	�Ǹ�����	����	�Ѿ�
��������	     pk	  nn	Nn	
���� ���̺�				
���� �÷�				
CHECK 				>0
�������� 	VARCHAR2	DATE	VARCHAR2	NUMBER
ũ��	12		34	

��ǰ 
���� / �÷�	��ǰ��ȣ	��ǰ��	��ǰ�ܰ�
��������	pk	nn	
���� ���̺�			
���� �÷�			
CHECK 			0>
�������� 	VARCHAR2	VARCHAR2	NUMBER
ũ��	12	100	

��ǥ�� 
���� / �÷�	��ǥ��ȣ	��ǰ��ȣ	����	�ܰ�	�ݾ�
��������	Pk,fk	fk	Nn	nn	
���� ���̺�	�Ǹ���ǥ	��ǥ��			
���� �÷�	��ǥ��ȣ	��ǰ��ȣ			
CHECK 					>0
�������� 	VARCHAR2	VARCHAR2	NUMBER	NUMBER	NUMBER
ũ��	12	12			


*/
/*
     1. FOREIGN KEY ==> 
         =��������
           ������� ���̺��� ���� ��������� 
           �Ǹ���ǥ / ��ǰ  (1)
           -----------------
                   |
             ��ǥ�� (2) 
         =�������� 
          �Ǹ���ǥ / ��ǰ  (2)
           -----------------
                   |
             ��ǥ�� (1) 
          = ������ ���� ���� ��� => ON DELETE CASCADE
*/
/*
-- �Ǹ���ǥ 
-- NOT NULL�� �ݵ�� �÷� �ڿ� ���� 
-- DEFAULT �ݵ�� �÷� �ڿ� ���� 
-- PK,FK,CK,UK ==> �÷��ڿ� ���� , �÷������Ŀ� ���� 
CREATE TABLE �Ǹ���ǥ(
   ��ǥ��ȣ VARCHAR2(12),
   �Ǹ����� DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL, 
   ����	VARCHAR2(34) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL,
   �Ѿ� NUMBER,
   CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
   CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0)
);
-- ��ǰ 
CREATE TABLE ��ǰ(
  ��ǰ��ȣ VARCHAR2(12),
  ��ǰ�� VARCHAR2(100) CONSTRAINT ��ǰ_��ǰ��_nn NOT NULL,
  ��ǰ�ܰ� NUMBER,
  CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ),
  CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ�>0)
);
-- ��ǥ�� (�� �÷��� �������� ������ ����� ����)
CREATE TABLE ��ǥ��(
   ��ǥ��ȣ VARCHAR2(12),	
   ��ǰ��ȣ VARCHAR2(12),
   ���� NUMBER CONSTRAINT ��ǥ��_����_nn NOT NULL,
   �ܰ� NUMBER CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL,
   �ݾ� NUMBER,
   CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
   CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
   REFERENCES �Ǹ���ǥ(��ǥ��ȣ) ON DELETE CASCADE,
   CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǰ��ȣ)
   REFERENCES ��ǰ(��ǰ��ȣ) ON DELETE CASCADE,
   CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ�>0)
);
*/
DROP TABLE ��ǥ��;
DROP TABLE �Ǹ���ǥ;
DROP TABLE ��ǰ;

















