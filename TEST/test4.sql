-- 2022-01-04 ����Ŭ ������ (�������� : OR,AND)
-- ����Ŭ���� �����ϴ� ������ (IN,LIKE,BTEWEEN,NULL,NOT)
/*
      �񱳿����� : = (�Ѱ��� ���� : �󼼺���)
                       = ȸ�� Ż��, ȸ�� ���� 
*/
/*
       �������� (AND (����), OR(����))
       (����) AND (����) => �Ⱓ�̳� ���� ���� 
       =================
         true  true   ===> true
       =================
         true  false  ===> false
       =================
         false true   ===> false
       =================
         false false  ===> false
       =================
     
       (����) OR (����) => �Ⱓ�̳� ���� ������ 
       =================
         true  true   ===> true
       =================
         true  false  ===> true
       =================
         false true   ===> true
       =================
         false false  ===> false
       =================
*/

-- AND : ���� 
-- emp���� ����߿� �޿��� 1500�̻� 3000������ ����� ��� ����(*)
SELECT *
FROM emp
WHERE sal>=1500 AND sal<=3000;
-- BETWEEN ~ AND
-- emp���� ����߿� �޿��� 1500���ϰų� 3000�̻� ����� ��� ����(*)
SELECT *
FROM emp
WHERE sal<=1500 OR sal>=3000;
-- IN
-- ����߿� 1982�⿡ �Ի��� ����� ��� ������ ������ �´� 
SELECT *
FROM emp
WHERE hiredate>='82/01/01' AND hiredate<='82/12/31';
/*
SELECT *
FROM emp
WHERE hiredate LIKE '82%';

SELECT *
FROM emp
WHERE substr(hiredate,1,2)=82;

SELECT *
FROM emp
WHERE hiredate BETWEEN '82/01/01' AND '82/12/31';
*/

-- ����߿� �޿��� 3000�̰� �̸� SCOTT�� ����� ��� ���� ��� 
SELECT *
FROM emp
WHERE sal=3000 AND ename='SCOTT';
-- ID , ���� ��¥ ���� ����  ==> AND ==> ���� ���� Ȯ�� 
-- ��Ű id , ���� ��¥ 

-- IN ������ (���Ե� ���)
-- ���� : WHERE �÷� IN(�����Ͱ�...) => �÷��ȿ� IN�� ������ �����Ͱ� �ִ� ��� ��� 
-- OR�� ���� ��쿡 ��ü 
-- KING , SCOTT , CLARK => ���� Ȯ�� => OR 
SELECT *
FROM emp
WHERE ename='KING' OR ename='SCOTT' OR ename='CLARK'; 

-- IN������ 
SELECT *
FROM emp
WHERE ename IN('KING','SCOTT','CLARK');

-- �μ���ȣ�� 10,20,30�� �ִ� ��� ��� ������ ������ �´� 
SELECT *
FROM emp
WHERE deptno=10 OR deptno=20 OR deptno=30;

SELECT *
FROM emp
WHERE deptno IN(10,20,30);

-- üũ�ڽ� (���� �˻��� ���� ���) => �� ���� 
-- LIKE => �˻� 
/*
      % : ���� ������ ��� ����
      _  : ���� 1��  
           _____
      1. ���� ���ڿ� ==> AB% => AB�� �����ϴ� ��� ���ڿ��� �о� �´� 
      2. ������ ���ڿ� ===> %T => T�� ������ ��� ���ڿ��� �о� �´� 
      ***3. �����ϴ� ���ڿ�  ==> %AB% AB�� ���Ե� ��� ���ڿ��� �о� �´� 
      4. ������ ���� ===> _A___  => �� ���ڼ��� 5�����ε� �ι����ڰ� A�� ã�´�
      5. ���ڰ� 5������ ������ �д´� => '_____' 

      ����)
       WHERE ename(�÷�) LIKE '%T%'  => T�� ���ԵǾ� �ִ� ��� �̸��� �д´� 
       ==> ���� ã�� ��� : REGEXP_LIKE()

      SELECT : ������ �˻� (��ü , �κ�, ã�� �κ�) => �ش� �����͸� �о� ���� ��ɹ�
      ======
         1. SELECT�� ���� (����)
         ***2. ���� ó�� => ������ 
         3. �Լ� (���ϴ� ���·� �����͸� �б� ���ؼ�)
         4. JOIN (�������� ���̺��� ���õ� �����͸� �ѹ��� �о� �´�)
            => ����ȭ 
            => ���̺� �������� ��� ���
         5. SubQuery 
            => SQL������ ������ ��� �ѹ��� ������ ���� 
*/

-- LIKE 1. �����ϴ� ���ڿ��� ������ �´� (������Ʈ:�ڵ� �ϼ���) => ����%
-- emp �̸��߿� A�ڷ� �����ϴ� ��� ����� ������ ������ �´� 
SELECT *
FROM emp
WHERE ename LIKE 'A%';

-- emp �̸��߿� SC�� �����ϴ� ��� ����� ������ ������ �´� 
SELECT *
FROM emp
WHERE ename LIKE 'SC%';

-- LIKE 2. ������ ���ڿ��� ã�� ����  => %����
-- emp �̸��߿� T�ڷ� ������ ����� ��� ������ ������ �´� 
SELECT *
FROM emp
WHERE ename LIKE '%T';
-- ER / N�� ������ �̸��� ��� ���� ������ �´� 
SELECT *
FROM emp
WHERE ename LIKE '%ER' OR ename LIKE '%N';

-- ���� ���� ���Ǵ� LIKE ==> ���� (contains())�� ���ڿ��� �о� �ö� ��� 
-- %���ڿ�%
-- emp���� ����̸��߿� A�� �����ϰ� �ִ� ����� ��� ������ �˻��Ѵ� 
SELECT *
FROM emp
WHERE ename LIKE '%A%';

-- emp���� ����̸��߿� EN , IN�� ���Ե� �̸��� ��� ������ �о� �´� 
SELECT *
FROM emp
WHERE ename LIKE '%EN%' OR ename LIKE '%IN%';
-- �Խ��� ã�� , �̸��� ã�� , ī�� ã�� ,��ȭ ,���� ....
-- books���� ����ڰ� �˻��� �ܾ ���Ե� ������ ������ �´� 
/*
SELECT title
FROM books 
WHERE title LIKE '%��Ȱ%';
*/
-- ���ڼ��� �˰� �ִ� ���� �˻� ==> _
-- emp���� �̸��� ���ڼ��� 5���� ����� ������ �о�´� 
SELECT *
FROM emp
WHERE ename LIKE '_____';

-- ���ڼ��� 5�����ε� J�� �����ϴ� ����� ������ �о� �´� 
-- J____  , J%
SELECT *
FROM emp
WHERE ename LIKE 'J____';

-- ���ڼ��� �˼� ���� �ι�° ���ڰ� A�� ����� ������ ������ �´� 
SELECT *
FROM emp
WHERE ename LIKE '_A%';  
-- �̸��߿� A�� K�� ���Ե� ����̸��� ���� �б�
-- ���¼Һм� => ������ �ִ� ������ ��õ�� �ּ��� => AI
SELECT *
FROM emp
WHERE ename LIKE '%A%K%';
-- %AK%  => 
SELECT *
FROM emp
WHERE ename LIKE '%AK%';
-- IN , LIKE , BETWEEN ~ AND 
-- NOT ������ ���� ==> 151page 
-- ������ MANAGER , CLERK�� ����� ��� ������ ��� 
SELECT *
FROM emp
WHERE job IN('MANAGER','CLERK');

-- ������ MANAGER , CLERK �ƴ�  ����� ��� ������ ��� 
SELECT *
FROM emp
WHERE job NOT IN('MANAGER','CLERK');


SELECT *
FROM emp
WHERE job='MANAGER' OR job='CLERK';

SELECT *
FROM emp
WHERE NOT (job='MANAGER' OR job='CLERK');

-- NOT LIKE 
-- �̸� �߿� A�� �����ϰ� ���� �ʴ� ����� ��� ���� 
SELECT *
FROM emp
WHERE ename NOT LIKE '%A%';
-- NOT BETWEEN AND  ==> �Ⱓ , ����   =>  >= AND <=
-- ����߿� �޿�(sal)�� 1500�̻��̰� 3000������ ����� ��� ���� �б�
-- 1. �񱳿����� 
SELECT *
FROM emp
WHERE sal>=1500 AND sal<=3000;
-- 2. BETWEEN ~ AND 
SELECT *
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

SELECT *
FROM emp
WHERE sal NOT BETWEEN 1500 AND 3000;

-- ���� ������ �� , üũ�� , ������������ 
-- NULL : ���� �������� �ʴ´� (����ó���� �ȵȴ�) 
-- IS NULL (NULL���� ��쿡 ó��), IS NOT NULL(NULL���� �ƴѰ��� �б�)
-- ����� ���� ����� ��� ���� 
SELECT *
FROM emp
WHERE mgr IS NULL;
-- ������(comm)�� ���� ����� ��� ���  comm=null (=> null)
SELECT *
FROM emp
WHERE comm IS NULL OR comm=0;
-- �������� �޴� ����� ���� ���  comm!=null (=> null)
SELECT *
FROM emp
WHERE comm IS NOT NULL AND comm<>0;

-- ����� �޿���� => ������ ���� => �ѱ޿� 
-- sal+comm
SELECT ename , sal , comm, sal+NVL(comm,0) "�ѱ޿�"
FROM emp;















