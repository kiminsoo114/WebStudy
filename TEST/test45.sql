-- 2022-01-13 (����Ŭ ����) 
/*
      ALTER => ��������  
      -----------------------
            ALTER TABLE table_name
            ADD CONTRAINT �������Ǹ� PRIMARY KEY(�÷�)
           
            ALTER TABLE table_name
            ADD CONTRAINT �������Ǹ� CHECK(�÷� IN('', '', ''))
            ALTER TABLE table_name
            ADD CONTRAINT �������Ǹ� UNIQUE(�÷�)
            ALTER TABLE table_name
            ADD CONTRAINT �������Ǹ� FOREIGN KEY(�÷�)
            REFERENCES �����̺�(�����÷�)
            ALTER TABLE table_name
            MODIFY �÷��� CONTRAINT �������Ǹ� NOT NULL
            ALTER TABLE table_name
            MODIFY �÷��� �������� DEFAULT ��
      VIEW   
      ------
        = ������ ���̺��� �����ؼ� �ʿ��� �����͸� ��Ƽ� ���ο� ���̺��� ����� 
        = ���� ���̺� (������ ���̺��� SQL���常 ����)
        = ����, SQL => ���� , SQL�����ϰ� ���� �� �ִ� 
        = �����ؼ� ����ϴ� ���, ***�������� �ʰ� ����ϴ� ��� 
           --------------------------  -----------------------------------
               �ܼ��� , ���պ�                     �ζ��κ� 
            = �ܼ��� (���̺��� �Ѱ��� ����)
            = ���պ� (���̺� 2���̻� ����) ==> JOIN, SUBQUERY 
            = �ζ��κ� => �α���� 10 ... �������� � ... ���ż� ... (rownum)
            = Ȯ�� (��) => SQL 
              SELECT text FROM user_views
              WHERE view_name = ''; 
              => ����Ŭ�� ���� : ���̺�, �÷���, �������Ǹ�, ���, �Լ��� .... (��ҹ��ڷ� �����)
              => table ���� Ȯ�� : user_tables
              => �������� : user_constraints  
                   = type
                      C => NOT NULL , CHECK
                      R => FOREIGN KEY
                      U => UNIQUE
                      P => PRIMARY KEY
              => �÷���+�������� : user_cons_columns
                   *** ���� �̸��� ����ϸ� �ȵȴ� 
                        => ���̺��_�÷�
              => ��� �뵵 : �ݺ������� ���Ǵ� SQL(������ ������)
                                   SQL������ �� ��� 
          = ������ : �ڵ� ���� ��ȣ (PRIMARY KEY�� �� ����) 
                         �Խù� ��ȣ, ��ȭ��ȣ, ���ǹ�ȣ .... 
                         *** ���� : ��� ���̺��� �⺻Ű �Ѱ��� ����...(���� => ROW)
                         *** PRIMARY KEY�� Ư���� ��찡 �ƴϸ� ��κ� ���� 
                         ?code=187320 => �ڹٿ��� �޾Ƽ� ����Ŭ�� ���� �����͸� ������ �´� 
              => START WITH �� (���۹�ȣ)  ==> 1 ==> int i = 1
              => INCREMENT BY ��   (������)                   i++
              => NOCACHE => (CACHE)20~30������ ���ڸ� ������ ������ ��� 
              => NOCYCLE => (CYCLE)��������ȣ ��� => ���� ó������ ����
                   MAX_VALUE = 10
                   MIN_VALUE = 1
                   1......10, 1 
                   =====> MAX_VALUE�� �������� ������ ���Ѵ� 
              => ���� �����Ǳ��� �� (�������� ���� ������ �ִ� ��: currVal)
              => ������ �� : nextVal
              => �������� => ���̺��_�÷���_seq
                                     ------------------------
              => ���� 
                   CREATE SEQUENCE (seq��) => ���� 
                          START WITH 1
                          INCREMENT BY 1
                          NOCYCLE 
                          NOCACHE
              => ���� 
                   DROP SEQUENCE seq�� 
                   CREATE => DROP => ��ü
                   INSERT => DELETE => ROW���� ���� 
                  *** ���� 
                  DELETE         TRUNCATE      DROP
*/