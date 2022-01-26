-- 2022-01-05 ����Ŭ (�����Լ�) => ����Ŭ���� �����ϴ� ���̺귯��
/*
      ���̺귯�� => �Լ��� (�޼ҵ��) => �Ű�����(����) => �����
      ======== �ʿ�ø��� ����� �����ϰ� ������� �ִ� (�ϱ�=> ���� ���)
      ����� ���� => ���α׷����� �� �������� �ʴ´� => PL/SQL 

      �����Լ� : SELECT => �÷��� �����ؼ� ��� 
                    WHERE => ���ǿ� �´� ������ ���� 
                    ORDER BY => ���� ���ÿ��� ����� ���� 
                                        �Լ� 
                             -----------------------
                             |                          |
                       ������ �Լ�           ���� �Լ�(������ �Լ�)
                             |                          | GROUP BY => ���� 
                      --------------------------------------------------------
                      |                   |                |              |              |
                 ���ڿ� �Լ�    �����Լ�       ��¥�Լ�    ��ȯ�Լ�   ��Ÿ�Լ� 
                      |
                  ��ȯ,               ���� ���� ,         ���ڰ��� 
                 ====              ======           ======
                   UPPER            CONCAT            ***LENGTH
                   LOWER           ***RPAD/LPAD
                   INITCAP          LTRIM / RTRIM
                   ***REPLACE     ***SUBSTR 
                                        ***INSTR

                 �����Լ� 
                 ======
                   **ROUND : �ݿø�  ==> ROUND(�Ǽ�,����)  
                                              => ROUND(123456.789,2) ==> 123456.79
                                                                             =
                                              �޿� / ȣ�� ....
                                              
                   **TRUNC : ����  ==> TRUNC(�Ǽ�,����) 
                                             => TRUNC(123456.789,2) ==> 123456.78
                   ***CEIL : �ø�     ==> CEIL(123456.78) ==> 123457
                       ==> �������� ���� ��쿡 �ַ� ��� 
                   MOD   : ������   ==> MOD(����,����) 
                                                  => MOD(100,2) = 0   ==> 100%2                     
*/
-- MOD : ������ 
-- emp���� ����� ¦���� ������� ��� ������ ��� 
SELECT *
FROM emp
WHERE MOD(empno,2)=0;

-- ROUND (�ݿø�)
SELECT ROUND(123456.789,2) FROM DUAL;
-- TRUNC (����)
SELECT TRUNC(123456.789,2) FROM DUAL;
-- ***CEIL (�ø�)
SELECT CEIL(117/10.0) FROM DUAL;

SELECT name , kor ,eng , math , (kor+eng+math) "total",
          ROUND((kor+eng+math)/3,2) "avg"
FROM student;
/*
                ��¥�Լ�
               =======
               *****1) SYSDATE : �ý����� ��¥ , �ð��� �о� �ö� => �Խ��� �۾��� , ���(�ð�)
               ======= ����ó�� ����� ���� 
               SYSDATE : ���� ��¥ ,  ���� => SYSDATE-1
                                               ���� => SYSDATE+1  ==> ����,��ȭ => ���� ���� 
               2) LAST_DAY : �Էµ� ���� ������ ��¥�� �о� �´� 
                  LAST_DAY(SYSDATE) ==> 22/01/31
                  LAST_DAY('22/02/01') ==> 22/02/28
               3) NEXT_DAY(��¥,'����')
                   NEXT_DAY(SYSDATE,'��') ==> 22/01/06

               *****4) MONTHS_BETWEEN : ����~��������� �� ������ �о� �´� 
                   => ����+�ð� => �Ҽ������� ���� �� �ִ� 
               5) ADD_MONTHS : ���� 
                  ADD_MONTHS(SYSDATE,3) => ����+3������ => ��¥ 
                                                    == ����
                        => ���� , ���� 
               
*/
SELECT SYSDATE-1 "����", SYSDATE "����", SYSDATE+1 "����"
FROM DUAL;
SELECT LAST_DAY(SYSDATE), LAST_DAY('22/02/01')
FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'��'),NEXT_DAY(SYSDATE,'��') FROM DUAL;
-- MONTHS_BETWEEN 
-- emp�� �ִ� ��� ����� �ٹ� ���� , �ٹ� ���� ��� 
SELECT ename,ROUND(MONTHS_BETWEEN(SYSDATE,hiredate),0) "�ٹ�������",
           TRUNC(ROUND(MONTHS_BETWEEN(SYSDATE,hiredate),0)/12,0) "�ٹ�����"
FROM emp;

SELECT ADD_MONTHS(SYSDATE,3) FROM DUAL;
/*
      ��ȯ�Լ� (Format)
      ***TO_CHAR : ���ڿ� ��ȯ
          ��¥ => ���ڿ� (SimpleDateFormat)
                      YYYY : 4�ڸ� �⵵ => RRRR 
                      YY : 2�ڸ� �⵵     => RR
                      M  : 1~12 
                      MM : 01,02...10,11,12 
                      D : 1~31
                      DD : 01,02....
                      DY : ���� ��� 
                      ============== ��¥
                      HH => 1~12
                      HH24 => 1~24(�ð�)
                      MI => 0~59(��)
                      SS  => �� 
                     
          ���� => ���ڿ� (���� 99999999)
                      ==> 999,999  => õ������ ,�� �Է� 
                             $999,999
                             L999,999
      TO_DATE : ������ => ���ڿ� => Date������ ��ȯ 
      TO_NUMBER : ���ڿ�=> ����  
*/
-- TO_CHAR  => emp (hiredate) ==> YY/MM/DD => YYYY/MM/DD
SELECT ename , hiredate , TO_CHAR(hiredate,'YYYY-MM-DD'),
           TO_CHAR(hiredate,'RRRR-MM-DD')
FROM emp;
SELECT ename,hiredate,TO_CHAR(hiredate,'DY')
FROM emp;
-- emp ����߿� ����Ͽ� �Ի��� ������� �̸� , �Ի��� , �Ի���� 
SELECT ename , hiredate, TO_CHAR(hiredate,'DY')
FROM emp
WHERE TO_CHAR(hiredate,'DY')='��';

-- �Ի� ���Ϻ� , �޿� ���� , �޿� ��� 
SELECT TO_CHAR(hiredate,'DY'), sum(sal),avg(sal)
FROM emp
GROUP BY TO_CHAR(hiredate,'DY');

-- ���� ���� 
SELECT ename , TO_CHAR(hiredate,'YYYY"�⵵" MM"��" dd"��"'),
           TO_CHAR(sal,'$999,999')
FROM emp;
SELECT ename , TO_CHAR(hiredate,'YYYY"�⵵" MM"��" dd"��"'),
           TO_CHAR(sal,'L999,999')
FROM emp;

-- ��¥ ��ȯ 
SELECT TO_DATE('22/01/05','YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
-- ���ں�ȯ 
-- �ڵ� ����ȯ 
SELECT '100'+'200'
FROM DUAL;
-- ���� ����ȯ => �ӵ��� ������ 
SELECT TO_NUMBER('100')+TO_NUMBER('200')
FROM DUAL; 
/*
                      TO_CHAR  =>            TO_DATE =>
       ������    =========   ������  ========  ��¥��
                    <=    TO_NUMBER      <=   TO_CHAR
       ��� => �ð� ��� , ���� ���� => �ð� ��� (TO_CHAR)
*/
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

/*
      ��Ÿ �Լ� 
       *****1) NVL : ����� �����Ͱ� NULL�� ��쿡 �ٸ� ���� ��ü�ؼ� ��� 
       *****2) ROWNUM : �����Ͱ� ������ �Ǹ� �ڵ����� row�� ���� ��ȣ
                            �����͸� �߶�ö� (�α���� 5��)  => ������ ������ ���
             3) DECODE : switch~case
             4) CASE : ���� if��                

*/
SELECT ename,sal,hiredate,rownum
FROM emp
WHERE rownum<=5;

-- NVL 
-- ������� �޿��� ��� (�޿�+������) => �������� NULL(����ó���� �ȵȴ�)
SELECT ename, sal,NVL(comm,0),sal+NVL(comm,0)
FROM emp;

SELECT ename, sal,NVL(comm,0),sal+comm
FROM emp;
-- DECODE : SWITCH ~ CASE
SELECT ename, deptno,DECODE(deptno,10,'������',
                                                         20,'���ߺ�',
                                                         30,'�ѹ���',
                                                         40,'����') dname
FROM emp;
-- CASE : ���� ���ǹ�
SELECT ename, deptno, CASE
                                  WHEN deptno=10 THEN '������'
                                  WHEN deptno=20 THEN '���ߺ�'
                                  WHEN deptno=30 THEN '�ѹ���' 
                                  END as dname
FROM emp;

                                     











