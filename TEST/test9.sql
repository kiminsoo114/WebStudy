-- �����͸� �����Ҷ� ���ϴ� �������� �����ؼ� ���� (�����Լ�) 
/*
        ���̵� ã�� 
        => ad*****  => RPAD()

       ����Ŭ���� �����ϴ� ���� �Լ� 
       ������ �Լ� , �����Լ� (GROUP BY) 
       ======== �Ѱ��� ���ؼ��� ó�� 
         ������ �Լ� 
           = ���� �Լ� 
              1) ��ȯ �Լ� 
                  ***�빮�� ��ȯ => UPPER() => UPPER('hello') => HELLO
                  ***�ҹ��� ��ȯ => LOWER() => LOWER('HELLO') => hello
                  �̴ϼ� ��ȯ => INITCAP() => INITCAP('HELLO') => Hello
              2) ���ڿ� ���� 
                  CONCAT() => CONCAT('Hello','Java') => HelloJava 
                    ||           => 'Hello'||'Java' => HelloJava (���� ���)
              3) ������ ���ڸ� ���� => (�ڹٿ����� ���� => trim())
                  ***LTRIM:���ʿ� �ִ� ���ڸ� ����
                                => LTRIM('ABCDEFGA','A') => ���ʿ� �ִ� A�� ���� 
                                                => ����� : BCDEFGA
                                => LTRIM(' ABCDEFGA ') => ������ ���� 
                                                 => ����� : 'ABCDEFGA '
                  ***RTRIM:�����ʿ� �ִ� ���ڸ� ����
                                => RTRIM('ABCDEFGA','A') => �����ʿ� �ִ� A�� ���� 
                                                => ����� : ABCDEFG
                                => RTRIM(' ABCDEFGA ') => ������ ���� 
                                                 => ����� : ' ABCDEFGA'

                                *** RTRIM('AAAAAAAABCDEFGA','A') => �����ʿ� �ִ� A�� ���� 
                                                => ����� : AAAAAAAABCDEFG
                                *** LTRIM('AAAAAAAABCDEFGA','A') => ���ʿ� �ִ� A�� ���� 
                                                => ����� : BCDEFGA
                  TRIM : �¿쿡 �ִ� ���ڸ� ���� 
                               => TRIM('A' FROM 'AAAAAAAABCDEFGAAAAA') 
                                        => ����� : BCDEFG
               4) ���ڸ� Ư�����ڷ� ��ȯ 
                   LPAD : ���ʺκи� ����  
                              LPAD(s,n,c) => s=>string, n=> ���� , c=>���� 
                              ��) LPAD('Oracle',10,'#')
                                   => ####Oracle
                                   LPAD('Oracle',5,'#') 
                                   => Oracl
                   *****RPAD : ������ �κи� ���� (���̵� ã��, ��й�ȣ ã��) 
                             RPAD(s,n,c) 
                             ��) RPAD('Oracle',10,'*') => ���ڼ��� ���ڶ�� ��쿡 *
                                  => Oracle**** 
               5) ���� ���� 
                   ***REPLACE(s1,s2,s3) => s=String
                            ��) REPLACE('Hello Java','old','new') => old => new 
                                 REPLACE("Hello Java', 'a','b') => a�� b�� ����
                                     => Hello Jbvb
                                 REPLACE("Hello Java', 'Java','Oracle')
                                     => Hello Oracle
               6) ���� ���� Ȯ�� 
                   ***** LENGTH(s)
                          ��) LENGTH('Hello') ==> 5  ==> ���� 
                               LENGTH('ȫ�浿') ==> 3
                               LENGTHB('Hello') ==> 5 ==> byte��� (ASC)
                               LENGTHB('ȫ�浿') ==> 6 , 9 (UNICODE)
               7) ���ڿ� ���� (�ڸ���)
                   ***** SUBSTR(s,s,n)    => s=string, s=������ġ , n=����
                          ***����Ŭ������ ���ڿ���ȣ 1������ ���� (�ڹ�:0)
                          String s="H e l l o O r a c l e"
                                        0 1 23 4 5 6 7 8 910
                          Hello Oracle 
                           1234567891011  ==> ����Ŭ�� ��� ��ȣ ���� => 1
                                                          �ڹٴ� ��� ��ȣ ���� => 0
                          ��) 
                                SUBSTR('Hello Oracle',1,3) 
                                => ù��°��ġ�������� 3���ڸ� �ڸ��� => Hel
                                SUBSTR('81/12/03' , 7,2) => 03
                                SUBSTR('Hello Oracle',-1,3) ==> cle
                                                               ==
                                                                ��� : �տ�������  
                                                                ���� : �ڿ�������
                 8) ������ġ���� ������ �´� => indexOf , lastIndexOf 
                     *** INSTR(s,s,n,e)  => s=>String, s =���ϴ� ����, n=> ����, e=>���°
                         ==========
                          INSTR('Hello Oracle','l',1,1) => 3
                          INSTR('Hello Oracle','l',1,2) => 4
                     ==> SELECT �÷��� ���� 
                            FROM
                            WHERE �Լ�|�÷�
                            GROUP BY �Լ�|�÷�
                            HAVING �Լ�|�÷�
                            ORDER BY �Լ�|�÷�
           = ���� �Լ� 
                *****1) �ݿø� : ROUND()
                *****2) ���� : TRUNC()
                *****3) �ø� : CEIL()
                *****4) ������ : MOD()
           = ��¥ �Լ� 
                *****1) SYSDATE : �ý����� ��¥ , ���� 
                ***2) MONTHS_BETWEEN : �ѳ�¥�� �������� ��� (������...)
                ***3) ADD_MONTHS() : ���� , ���� ... 
                4) LAST_DAY() => ��¥�� �Է��ϸ� => �״��� ������ ��¥�� ������ �´� 
                                          22/01/05 ==> 22/01/31
                5) NEXT_DAY() => ��¥�� �Է��ϸ� , ���� ==> ������ ������ ���� 
           = ��ȯ �Լ� 
                *****1) TO_CHAR  => ����,��¥�� ���ڿ��� ��ȯ 
                2) TO_NUMBER => ���ڿ��� ���������� ����
                3) TO_DATE => ���ڿ��� ��¥������ ���� 
           = ��Ÿ �Լ� 
               ************1) NVL :NULL�� �ٽð����� �����ؼ� ��� 
               ***2) DECODE : switch~case 
               3) CASE : ���� if  ===> PL/SQL (�Լ�=>����,���,������) => �ݺ� 
*/
-- ��ȯ (�빮�� , �ҹ��� , �̴ϼ�) => UPPER , LOWER , INITCAP 
-- emp�� �ִ� ����� �̸��� �빮�� , �ҹ��� , �̴ϼȷ� ��� 
SELECT ename , UPPER(ename) "�빮��" , LOWER(ename) "�ҹ���", INITCAP(ename) "�̴ϼ�" 
FROM emp;
-- ������� �Է°��� ���� ��쿡 ��ҹ��� ������� ó�� 
SELECT ename , job, hiredate 
FROM emp
WHERE ename=UPPER('king');

SELECT ename , job, hiredate 
FROM emp
WHERE LOWER(ename)='king';

-- CONCAT : ���ڿ� ���� => ������ ���̺�(DUAL) => ���� ���� , �Լ��� ������� Ȯ�� 
SELECT CONCAT('Hello',' Oracle!!') FROM DUAL;
SELECT 'Hello'||' Oracle!!' FROM DUAL;
SELECT CONCAT('Hello',' Oracle!!') FROM emp;
-- TRIM => ���鹮�ڸ� ���� (����� �Է� => space����) => �ڹ� : trim():���鹮�� ���� 
-- LTRIM => ���ʿ� �ִ� ���ڸ� ���� => ����� : BCDEFGAAA
SELECT LTRIM('AAABCDEFGAAA','A') FROM DUAL;
-- RTRIM => �����ʿ� �ִ� ���ڸ� ���� => AAABCDEFG
SELECT RTRIM('AAABCDEFGAAA','A') FROM DUAL;
-- TRIM => �¿쿡 �ִ� ���ڸ� ���� => ����� : BCDEFG
SELECT TRIM('A' FROM 'AAABCDEFGAAA') FROM DUAL;
-- LPAD 
-- ���ڼ��� ������ ũ�⺸�� ������ �� ���鿡 *�� ����Ѵ�(����)
SELECT LPAD('Oracle',10,'*') FROM DUAL;
-- RPAD
-- ���ڼ��� ������ ũ�⺸�� ������ �� ���鿡 *�� ����Ѵ�(������)
SELECT RPAD('Oracle',10,'*') FROM DUAL;
-- emp�� �ִ� ����� �̸��� �α��ڸ� ��� �������� *�� ����ؼ� ��� (���̵�ã��)
SELECT ename, RPAD(SUBSTR(ename,1,2),LENGTH(ename),'*') "RPAD" FROM emp;
-- REPLACE => ���ڸ� ���� 
SELECT REPLACE('Hello Oracle!!', 'l','K') FROM DUAL;
SELECT REPLACE('Hello Oracle!!', 'Hello','Hi') FROM DUAL;
-- & || => ����Ŭ���� ����ϴ� ��ȣ�� �����ؼ� ���� ...
-- LENGTH => ���� ���� 
SELECT LENGTH('Hello'),LENGTH('ȫ�浿') FROM DUAL;
SELECT LENGTHB('Hello'),LENGTHB('ȫ�浿') FROM DUAL;
--�ַ� ��� (������ ������ ����) => ���̺��� ���� => ���� ���� ���� 
-- emp���� �̸��� ������ 5���� ����� �̸��� ��� 
SELECT ename 
FROM emp
WHERE ename LIKE '_____';

SELECT ename
FROM emp
WHERE LENGTH(ename)=5;

-- SUBSTR => ���ڿ� �ڸ��� ��� (���ϴ� �κи� ����)  => �ڹ� substring()
-- SUBSTR(���ڿ�, ������ġ , �ڸ������� ����) 
SELECT SUBSTR('Hello Oracle',3,3) FROM DUAL; 
-- emp���� ���� , �ϻ� �� , �Ի���  => 81/12/03
SELECT CONCAT('19',SUBSTR(hiredate,1,2)) "Year",
           SUBSTR(hiredate,4,2) "Month",SUBSTR(hiredate,7,2) "Day"
FROM emp;

-- emp���� 12�� �Ի��� ����� �̸� , �Ի��� , ������ ��� 
SELECT  ename,hiredate,job
FROM emp
WHERE SUBSTR(hiredate,4,2)=12;
-- (int)'D'
SELECT 'D' , ASCII('D') FROM DUAL;

-- INSTR() => ������ ��ġ��ȣ  => (�ڹ�: +:indexOf , -:lastIndexOf)
-- INSTR(���ڿ�, ã�� ����(��) , ���°���� (������ġ) , ��°)
-- ��) 'Hello Oracle'  ==> l  => 1, 3
SELECT INSTR('Hello Oracle','l',1,1) FROM DUAL;
SELECT INSTR('Hello Oracle','l',1,2) FROM DUAL;
SELECT INSTR('Hello Oracle','l',1,3) FROM DUAL;

-- emp���� 2��° ���ڰ� A�� ��� �̸�,����,�Ի��ϸ� ��� 
SELECT ename,job,hiredate
FROM emp
WHERE ename LIKE '_A%';

-- INSTR�� �����ؼ� ã�� 
SELECT ename,job,hiredate 
FROM emp
WHERE INSTR(ename,'A',1,1)=2;








