-- 2022-01-11 DDL(���̺� ����,����,�߰�) => ALTER (179~192������)
-- DML (INSERT , UPDATE , DELETE) 
/*
        ���̺� : Sawon
       ------------------------------------
        sabun : ��� => �ߺ����� ������ (����)
        name : �̸� => NULL�� ������� �ʴ´� 
        dept : �μ��� => ���ߺ� , ����� , ��ȹ�� ,������ , �ѹ��� 
        loc : �ٹ���   => ���� , �λ� ,��� 
        job : ����    => ��� , �븮, ���� ,����,����
        hiredate : �Ի��� 
        pay : ���� 
        comm : ������ ==> NULL��� 
*/

CREATE TABLE sawon(
    sabun NUMBER(4), 
    name VARCHAR2(34) CONSTRAINT sawon_name_nn NOT NULL,
    dept VARCHAR2(9),
    loc VARCHAR2(2),
    job VARCHAR2(6),
    hiredate DATE DEFAULT SYSDATE,
    pay NUMBER,
    comm NUMBER,
    CONSTRAINT sawon_sabun_pk PRIMARY KEY(sabun),
    CONSTRAINT sawon_dept_ck CHECK(dept IN('���ߺ�' , '�����' , '��ȹ��' ,'������' , '�ѹ���')),
    CONSTRAINT sawon_loc_ck CHECK(loc IN('����' , '�λ�' ,'���')),
    CONSTRAINT sawon_job_ck CHECK(job IN('���' , '�븮', '����' ,'����','����'))
);

-- comm�� �߰�  (ALTER)  =>184 ~ 185 
-- CONSTRAINT : �߰� , ���� , ���� 
/*
     ���̺� ���� 
     -------------
     1) �÷� �߰�  => ADD  ===> comm
         ����)
                 ALTER TABLE table_name ADD �÷��� �������� [��������]
     2) �÷� ����  => MODIFY===> loc (���ڼ� ����)
                 ALTER TABLE table_name MODIFY �÷��� �������� [��������]
     3) �÷� ����  => DROP ===> �߰� email (UNIQUE) ==> ���� 
                ALTER TABLE table_name DROP COLUMN �÷���
*/

-- comm�߰� 
-- ALTER TABLE sawon ADD comm NUMBER;
-- email �߰� 
--ALTER TABLE sawon ADD email VARCHAR2(100) CONSTRAINT sawon_email_uk UNIQUE; 
-- loc ���� 
--ALTER TABLE sawon MODIFY loc VARCHAR2(6);
-- email ���� 
-- ALTER TABLE sawon DROP COLUMN email;

-- ���̺� ��ü ���� (186)
-- ����) DROP TABLE table_name;
-- DROP TABLE sawon;
-- ALTER , CREATE , DROP => �������� ���Ѵ� (admin)







