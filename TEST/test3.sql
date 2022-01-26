-- 2022-01-04 ����Ŭ 2���� (���ǿ� �´� ������ ���� => WHERE (if))
/*
     SELECT�� ����
 
     SELECT �÷���...| *
     FROM ���̺�� (��� , SELECT ~~)  => �� , �ζ��κ� 

    1.  WHERE   ===> ���ǿ� �´� �����͸� ���� 
         => true�϶� ���� 
         WHERE ���ǹ� ==> ������ 
    2.  GROUP BY
    2.  HAVING
    3.  ORDER BY
    ====================================
     �ΰ��̻��� ���̺��� ���ϴ� ������ ���� 
     ============ JOIN , SubQuery 
     ���� : ���� , ���� 
     SELECT 
     FROM 
     WHERE 
     ORDER BY

     ���� : �׷� , �׷� ���� 
     SELECT
     FROM 
     GROUP BY
     HAVING 

    ==> 3�� ~
    1) WHERE ������ ���� 
        SELECT
        FROM
        WHERE  �÷���(�Լ�) ������ ��
                    =============== true => ���� , false => ����
        = ����Ŭ ������ (149page) 
        1. ��������� :  +  , -  , *  , /
                              + : �����ϰ� ������길 ���� (���ڿ�(X) => ||)
                              / : 0���� ���� �� ���� , ����/����=�Ǽ� 
                              => �ַ� SELECT �÷��� ����ÿ� �ַ� ��� 
                              kor , eng ,math 
                              SELECT kor+eng+math , (kor+eng+math)/3
                               ���� , ��� , ���� ....
        ==============================================
                  => ������� true/false => WHERE���� ������ ���� �ַ� ���
                  => ���ڸ� ���ϴ� ���� �ƴϰ� ���ڿ� , ��¥���� ����ó�� ���� 
                  => name>'King' , day>'22/01/04'
                  => ���ڿ� , ���� , ��¥�� �ݵ�� ''�� ����Ѵ� 
                  => ���� �����Ǿ� �ִ� ��¥ ���� => 'YY/MM/DD'
        2. �񱳿����� : = (����) 
                             != , <> , ^=  (���� �ʴ�)
                             != : ���α׷��� 
                             <> : ����Ŭ ������ (DBA)
                             ===> �����ͺ��̽� ���� , PL/SQL
                             < : �۴� 
                             > : ũ�� 
                             <= : �۰ų� ����  ==>    < OR =
                             >= : ũ�ų� ����  ==>    > OR =

        3. �������� : OR => ���� �ۿ� �ִ� ��� 
                             AND => ���� �ȿ� ���Ե� ��� 
                            (����) OR|AND (����)
                            OR ==> �Ѱ��̻��� true�϶� => true
                            AND => �ΰ��� ������ true�϶� => true
        4. IN : OR�� ���� ��� �ַ� ���Ǵ� ������ 
                 WHERE deptno=10 OR deptno=20 OR deptno=30 ....
                 => ���� 
                 WHERE deptno IN(10,20,30) => deptno�� 10,20,30 �����ϰ� �ִٸ� 
        5. BETWEEN : ����,�Ⱓ�� ���� => ����¡��� , üũ�� 
                            WHERE total>=60 AND total<=100;
                            WHERE total BETWEEN 60 AND 100 
        6. LIKE : ���ڿ� ã�� 
                    % : ���ڿ� (������ ������ �� �� ���� ���) 
                          �ڹ�% ,  %�ڹ�  , %�ڹ�% => �ڹٰ� ���Ե� ��� ���ڿ� 
                          ====   =====  ======
                             |           | �ڹٷ� ������ ��� ���ڿ� 
                          �ڹٷ� �����ϴ� ��� ���ڿ� 
                    _ : �ѱ��� (���ڼ��� �ƴ� ���)
                        �̸��߿� 4������ ����� ��� : '____'
                        2��° �̸��� I =>   : '_I%' , '_I__'
                    [A-C] : A,B,C������ �ִ� ������ ���  
                    [^A-C] : ������ �ݴ�ȿ�� (^:NOT)
                    = ���۹��ڿ�   A%
                    = �����ڿ�      %A
                    = ���ڿ� ����  %A%
                    = [0-5] : 0~5�� ���۵Ǵ� ���ڿ� 
                    = [^0-5]  ^(����)

        7. NOT  : ���������� 
                     NOT IN() 
                     NOT BETWEEN ~ AND ==> �������� �ƴ� �� 
                     NOT LIKE 
                     WHERE NOT (total>=60 AND total<=100)
        8. NULL : 
               ** NULL�� � �����͵� ���� ���� => ����ó���� �� �� ���� 
               10+NULL => NULL
               NULL�� ���  ============> 
                  WHERE comm=null (X) 
                  WHERE comm IS NULL
               NULL�� �ƴ� ���
                  WHERE comm!=null (X)
                  WHERE comm IS NOT NULL

               IS NULL => �����Ͱ��� NULL�� ��� ó��
               IS NOT NULL => �����Ͱ��� NULL�� �ƴ� ��� ó�� 
        ===============================================
*/
-- ��������� ==> (�ڹ�: + ,- , * , / , %)  => ����Ŭ������ �Լ��� ���� (MOD)
-- ����ó�� , �Լ� => ������ ���̺� => DUAL (����Ŭ���� �����ϴ� ������)
SELECT 10+20 
FROM DUAL;
-- ����ó�� => ���ڿ��ε� ����  '100' => �ڵ� ����ȯ
-- ������ ��ȯ => TO_NUMBER('100') => Integer.parseInt("100") 
SELECT '10'+'20'
FROM DUAL;
-- ����/���� = �Ǽ�  => �Ҽ������� 2�ڸ� (�ݿø� : round(), ����:trunc() , �ø�:ceil())
SELECT 10/3
FROM DUAL;
-- 0���� ���� ��쿡�� ���� �߻�
SELECT 10/0
FROM DUAL;

SELECT 10-5
FROM DUAL;
-- �ڵ� ����ȯ => ���������� ���� 
SELECT '10'-'5'
FROM DUAL;

SELECT 10*5
FROM DUAL;
-- �ڵ� ����ȯ => ���������� ���� 
SELECT '10'*'5'
FROM DUAL;

-- ���� ������ ����� : ���̺� 
/*
CREATE TABLE student(
    name VARCHAR2(20),
    kor NUMBER(3),
    eng NUMBER(3),
    math NUMBER(3)
);
-- ������ �߰�
INSERT INTO student VALUES('ȫ�浿',90,89,78);
INSERT INTO student VALUES('��û��',67,78,89);
INSERT INTO student VALUES('�ڹ���',56,67,88);
INSERT INTO student VALUES('�̼���',89,67,90);
INSERT INTO student VALUES('������',97,95,56);
COMMIT;
*/
-- ��ü �����͸� ����Ѵ� 
/*
SELECT * 
FROM student;
-- ��ü ������ + ���� , ��� => ��������ڴ� ���,��� => �ַ� SELECT �÷�ó�� ���
SELECT name,kor,eng,math,(kor+eng+math) "total",(kor+eng+math)/3 "avg"
FROM student;
-- ��ü ������ + ���� , ��� , ���
SELECT name,kor,eng,math,(kor+eng+math) "total",(kor+eng+math)/3 "avg",
          RANK() OVER(ORDER BY (kor+eng+math) DESC) "rank"
FROM student;
*/
-- �񱳿����� (149page)
-- (=) => ã��/�󼼺���  ==> ����Ǿ� �ִ� ���������ʹ� ��ҹ��ڸ� ���� 
-- <> , != 
-- emp�� �ִ� ��� ������ ��� 
SELECT *
FROM emp;
-- emp(�������) => SCOTT���(7788)�� ������ �˰� �ʹ� 
-- 1. ������� ã�� ���(�ַ� ���) => �ߺ����� �����ͷ� ã�� 
SELECT *
FROM emp
WHERE empno=7788;
-- 2. �̸����� ã�� 
SELECT *
FROM emp
WHERE ename='SCOTT';
-- ������ ��쿡�� ��ҹ��ڸ� �����Ѵ� 
-- WHERE �÷��� ������ ��
--            ename    =  'SCOTT'
SELECT *
FROM emp
WHERE ename='scott';

-- (=) ���� 
-- ���� �ʴ� (!=,<>)
-- emp(�������) ����߿� �޿� 3000�� �ƴ� ����� ��� ����(*) ��� 
SELECT *
FROM emp
WHERE sal!=3000;

SELECT *
FROM emp
WHERE sal<>3000;

-- emp(�������) ����߿� �޿� 3000�� �ƴ� ����� �̸�,�޿� ��� (ename,sal)
SELECT ename,sal
FROM emp
WHERE sal<>3000;

-- < (�۴�)
-- emp���� ����߿� �޿��� 1500���� ���� ����� �̸� , �޿� ��� 
SELECT ename,sal
FROM emp
WHERE sal<1500; 
-- > (ũ��)
-- ����߿� �޿��� 2000���� ���� �޴� ����� �̸� ,�޿� ,���� ��� 
SELECT ename,sal,job
FROM emp
WHERE sal>2000;
-- <= (�۰ų� ����)
-- emp���� ����߿� �޿��� 1500���� ���� ����� �̸� , �޿� ��� 
SELECT ename,sal
FROM emp
WHERE sal<=1500;
-- >= (ũ�ų� ����)
-- ����߿� �޿��� 2000�̻� ���� �޴� ����� �̸� ,�޿� ,���� ���
SELECT ename,sal,job
FROM emp
WHERE sal>=2000;
-- �� ������ (AND , OR) => && (Scanner) , ||(���ڿ� ����)

/*
SELECT *
FROM emp
WHERE empno=&no;
*/
TRUNCATE TABLE emp; --�����͸� �����
INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902,TO_DATE('1980-12-17', 'YYYY-MM-DD'), 800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698,TO_DATE('1981-02-20', 'YYYY-MM-DD'), 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698,TO_DATE('1981-02-22', 'YYYY-MM-DD'), 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839,TO_DATE('1981-04-02', 'YYYY-MM-DD'), 2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698,TO_DATE('1981-09-28', 'YYYY-MM-DD'), 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839,TO_DATE('1981-05-01', 'YYYY-MM-DD'), 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839,TO_DATE('1981-06-09', 'YYYY-MM-DD'), 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566,TO_DATE('1982-12-09', 'YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL,TO_DATE('1981-11-17', 'YYYY-MM-DD'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698,TO_DATE('1981-09-08', 'YYYY-MM-DD'), 1500, 0, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788,TO_DATE('1983-01-12', 'YYYY-MM-DD'), 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698,TO_DATE('1981-12-03', 'YYYY-MM-DD'), 950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566,TO_DATE('1981-12-03', 'YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782,TO_DATE('1982-01-23', 'YYYY-MM-DD'), 1300, NULL, 10);
COMMIT;
SELECT * FROM emp;












