-- 2022-01-06 ����Ŭ ��������
/*
- ���� 041 ==> SUBSTR => ���ڸ� 3���� ��� 
������ �Լ� 
    =���� ���� 
      LENGTH , SUBSTR , INSTR
�Ʒ��� ���� ����� ����Ͻÿ�.
 
SELECT ename,SUBSTR(ename,1,3) 
FROM emp;
________________________________________
 

- ���� 042
�̸��� ù��° ö�ڸ� ����ϴµ� �ҹ��ڷ� ��µǰ� �Ͻÿ�
SELECT ename,Lower(SUBSTR(ename,1,1))||UPPER(SUBSTR(ename,2,LENGTH(ename)-1))
 FROM emp;
____________________________________
 

- ���� 043
upper, lower, substr, || �� ����ؼ� �Ʒ��� ���� ����� ����Ͻÿ�.
SELECT ename , INITCAP(ename) 
FROM emp;
 
SELECT ename,SUBSTR(ename,1,1)||LOWER(SUBSTR(ename,2,LENGTH(ename)-1))
FROM emp;

SELECT ename,UPPER(SUBSTR(ename,1,1)) || LOWER(SUBSTR(ename,2))
FROM emp;
________________________________________
 
- ���� 044 ==> INSTR
�̸��� M�ڸ� �����ϰ��ִ� ������� �̸��� ������ ����Ͻÿ�.
=> INSTR 
SELECT ename,sal
FROM emp
WHERE INSTR(ename,'M',1,1)>=1;
=> LIKE
SELECT ename,sal
FROM emp
WHERE ename LIKE '%M%';
=> REGEXP_LIKE
SELECT ename,sal
FROM emp
WHERE REGEXP_LIKE(ename,'M');

SELECT ename,sal,hiredate
FROM emp
WHERE ename LIKE '%M%';
________________________________________
 

*****- ���� 045
�̸��� EN �Ǵ� IN�� �����ϰ� �ִ� ������� �̸��� �Ի����� ����ϴµ� 
�ֱٿ� �Ի��� ������ ����Ͻÿ�.
SELECT ename,hiredate
FROM emp
WHERE ename LIKE '%IN%' OR ename LIKE '%EN%';

SELECT ename,hiredate
FROM emp
WHERE INSTR(ename,'IN',1,1)>=1 OR  INSTR(ename,'EN',1,1)>=1;

SELECT ename,hiredate
FROM emp
WHERE REGEXP_LIKE(ename,'IN|EN');

SELECT ename,hiredate
FROM emp
WHERE REGEXP_LIKE(ename,'EN|IN')
ORDER BY hiredate;

- ���� 046
������ SALESMAN�� ������� ��� �̸��� ������ ������ ����ϴµ� 
������ ���� ������� ����Ͻÿ�.

SELECT ename,job,sal,hiredate
FROM emp
WHERE job='SALESMAN'
ORDER BY hiredate DESC;

- ����
����Ŭ ���� ������ from, where, select, order by ������ ����ȴ�.
�� ���� ������ ���� as ��Ī�� �ν��ϰ� ���ϴ� �� �� �ִ�.
 
________________________________________
 

- ���� 047
�̸��� ù���ڰ� A�� �����ϴ� ������� �̸��� ���ް� ������ ����Ͻÿ�. 
***
SELECT ename,sal,job
FROM emp
WHERE ename LIKE 'A%';

SELECT ename,sal,job
FROM emp
WHERE INSTR(ename,'A',1,1)=1;

SELECT ename,sal,job
FROM emp
WHERE REGEXP_LIKE(ename,'^A');

SELECT ename,sal,job
FROM emp
WHERE ename LIKE 'A%';

 
________________________________________
- ���� 048
������ 1000���� 3000 ������ ������� �̸��� ���ް� �Ի����� ����ϴµ�, 
�Ի����� ���� �Ի��� ������� ��µǰ� �Ͻÿ�.

SELECT ename,sal,hiredate
FROM emp
WHERE sal BETWEEN 1000 AND 3000
ORDER BY hiredate ASC;

SELECT ename,sal,hiredate
FROM emp
WHERE sal BETWEEN 1000 AND 3000
ORDER BY 3 ASC;

SELECT ename,sal,hiredate
FROM emp
WHERE sal BETWEEN 1000 AND 3000
ORDER BY hiredate;
________________________________________
 

****- ���� 049
1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 

SELECT ename,hiredate
FROM emp
WHERE TO_CHAR(hiredate,'YYYY')=1981;

SELECT ename,hiredate
FROM emp
WHERE hiredate LIKE '81%';

SELECT ename,hiredate
FROM emp
WHERE hiredate LIKE '81%';

________________________________________


- ����
�������Լ� : ����, ����, ��¥, ��ȯ, �Ϲ�
������ �Լ� : MAX, MIN, AVG, SUM, COUNT
���� �Լ� : upper, lower, initcap, substr, instr, lpad, rpad, trim, replace
 
________________________________________
 

- ���� 052
instr �Լ��� �̿��ؼ� �̸��� A�ڸ� �����ϰ� �ִ� ������� �̸��� ����Ͻÿ�. 
SELECT ename 
FROM emp
WHERE INSTR(ename,'A',1,1)>=1;

SELECT ename
FROM emp
WHERE INSTR(ename,'A')>=1;

- ���� 054 => RPAD => ���̵� ã�� , ��й�ȣ ã�� 
�̸��� ������ ����ϴµ� ������ ��ü 10�ڸ��� ����ϰ� ������ �ڸ��� *�� ����Ͻÿ�! 
SELECT ename,RPAD(sal,10,'*')
FROM emp

SELECT ename,RPAD(sal,10,*)
FROM emp

 
________________________________________
 

****- ���� 055
�̸��� ������ ����ϴµ� ������ ��ü 10�ڸ��� ����ϰ� 
������ �ڸ��� �������� ����Ͻÿ�. 

 SELECT ename,RPAD(sal,10,' ')
FROM emp; 

SELECT ename,LPAD(sal,10,' ')
FROM emp;
_______________________________________
 

- ���� 056
length �Լ��� �̿��ؼ� �̸��� �̸��� ö���� ������ ����Ͻÿ�. 
SELECT ename,LENGTH(ename) 
FROM emp;

SELECT ename,LENGTH(ename)
FROM emp;

- ����
length : ���ڿ��� ���̸� ���� �Լ�





- ���� 057 => TRUNC
�̸�, �Ի��� ��¥���� ���ñ��� �� ���� �ٹ��ߴ��� �Ҽ��� �ڿ��� �߶� ����Ͻÿ�.
_______________________________________
SELECT ename,TRUNC(SYSDATE-hiredate)
FROM emp;
 
�� ���� �Լ��� ����(round, trunc, mod)

1. round : �ݿø��ϴ� �Լ�(������ �ڸ������� �ݿø��ؼ� ǥ��)
select 756.89, round(756.89, 1)
    from dual;        
=756.9 

select 756.89, round(756.89, -3)
    from dual;
=1000         
select 756.89, round(756.89, -2)
    from dual;        
=800 
(���ʺ��� -3, -2, -1, 0, 1)
(�ӽ����� ����� ���� ���� ���� ���̺� dual)
 
2. trunc : �׳� ������ �Լ�(������ �ڸ������� �����ؼ� ǥ��)
select 756.89, trunc(756.89, 1)
    from dual;
select 756.89, trunc(756.89, -2)
    from dual;
 
 
3. mod : ������ ���� �� ������ ��
select 756.89, mod(756.89, 1)
    from dual; 
 
 
________________________________________
 

*****- ���� 058
�̸�, �Ի��� ��¥���� ���ñ��� �� ��� �ٹ��ߴ��� �Ҽ��� �ڿ��� �߶� ����Ͻÿ�.
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)/12)
FROM emp;

SELECT ename,

- ����
���� ��¥ Ȯ���ϴ� ���
select sysdate from dual;
 
 
________________________________________
 
 
�� ��¥�Լ�
 
1. months_between : ��¥�� ��¥ ������ ������ ���
��¥ + ��¥ = ��¥
��¥ - ���� = ��¥
��¥ - ��¥ = ����
 
2. add_months : ��¥���� �������� ���� ��¥
 
3. next_day : ������ ��¥���� ������ ���ƿ� ������ ��¥�� ���
 
4. last_day : ������ ��¥���� ������ ��¥�� ���
 
 
________________________________________
 

- ���� 059
���ú��� 100�� ���� ��¥�� ����Ͻÿ�.
SELECT ADD_MONTHS(SYSDATE,100) 
FROM DUAL;
___________________________________
 

- ���� 060
���ú��� ������ ���ƿ� �������� ��¥�� ����Ͻÿ�. 

SELECT NEXT_DAY(SYSDATE,'��') 
FROM DUAL; 

SELECT NEXT_DAY(SYSDATE,'��')
FROM DUAL;


_____________________________________
 

- ���� 061
���ú��� 100�޵� ���ƿ� �ݿ����� ��¥�� ����Ͻÿ�. 
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE,100),'��') 
FROM DUAL;

SELECT NEXT_DAY(ADD_MONTH(SYSDATE,100),'��')
FROM DUAL;
 
 
________________________________________
 

- ���� 062
�̹��� ������ ��¥�� ����Ͻÿ�. 
 
=> LAST_DAY 
SELECT LAST_DAY(SYSDATE) 
FROM DUAL;


 SELECT LAST_DAY(SYSDATE)
FROM DUAL;
 
________________________________________
 

- ���� 063
���ú��� ����� ���ϱ��� �� ���ϳ��Ҵ��� ����Ͻÿ�! 
SELECT LAST_DAY(SYSDATE)-SYSDATE 
FROM DUAL;

SELECT LAST_DAY(SYSDATE)-SYSDATE
________________________________________
 
 
 
�� ������ Ÿ���� ��ȯ�ϴ� �Լ�
1. ���ڷ� ����ȯ :to_char
2. ���ڷ� ����ȯ :to_number
3. ��¥�� ����ȯ :to_date
 
 
���ڷ� ����ȯ TO_CHAR
���ڷ� ����ȯ TO_NUMBER
��¥�� ����ȯ TO_DATE
________________________________________
 

- ���� 064
������ ���� �������� ����Ͻÿ�  => TO_CHAR => ���� DY
SELECT TO_CHAR(SYSDATE,'DY')||'����' 
FROM DUAL; 

SELECT TO_CHAR(SYSDATE,'DY')||'����'
FROM DUAL;

________________________________________
 

- ���� 065
�̸�, �Ի��� ������ ����Ͻÿ�. 
SELECT ename,hiredate,TO_CHAR(hiredate,'DY')||'����'"����"
FROM emp;



- ����
��¥ ���佺Ʈ��(����1�� ����1 4-12)
���� : day, dy
�⵵ : YYYY, YY, RRRR, RR, year
�� : mm, mon, month
�� : dd
�� : ww, w, iw
�ð� : hh, hh24
�� : mi
�� : ss
 
________________________________________
 

- ���� 066
���ú��� 200�� �ڿ� ���ƿ��� ��¥�� ������ ��� 
SELECT TO_CHAR(ADD_MONTHS(SYSDATE,200),'DY') FROM DUAL;

SELECT TO_CHAR(ADD_MONTHS(SYSDATE,200),'DY')
FROM DUAL;
__________________________________
 

- ���� 067
�̸��� �Ի��� �⵵�� ����Ͻÿ�.
 
SELECT ename , TO_CHAR(hiredate,'RRRR') FROM emp;

SELECT ename,TO_CHAR(hiredate,'YYYY')
FROM EMP;
 
 
________________________________________
 

- ���� 068
1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�.
 
SELECT ename,hiredate 
FROM emp
WHERE TO_CHAR(hiredate,'yyyy')='1981';

SELECT ename,hiredate
FROM emp
WHERE TO_CHAR(hiredate,'YYYY')=1981;
 
 
________________________________________
 

- ���� 069
����Ͽ� �Ի��� ������� �̸��� �Ի���, �Ի��� ������ ����Ͻÿ�.
SELECT ename,hiredate,TO_CHAR(hiredate,'DY')||'����'
FROM emp
WHERE TO_CHAR(hiredate,'DY')||'����'='�����';


SELECT ename,hiredate,TO_CHAR(hiredate,'DY')||'����'
FROM emp
WHERE TO_CHAR(hiredate,'DY')||'����'='�����';
 
- ����
trim�� DB�� ������ �ʰ� ������ ���� ������ �Լ�
 
 
________________________________________
 

- ���� 070
81�� 12�� 11�Ͽ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.

SELECT ename,TO_CHAR(hiredate,'YYYY"��" MM"��" DD"��"') "�Ի���"
FROM emp
WHERE  hiredate='81/12/11';


SELECT ename,TO_CHAR(hiredate,'YYYY"��" MM"��" DD"��")"�Ի���"
FROM emp
WHERE hiredate='81/12/03';
________________________________
 

- ���� 071
�̸��� ������ ����ϴµ� ���޿� õ������ �ο��Ͻÿ�! (��: 3000 -> 3,000)

SELECT ename,TO_CHAR(sal,'$99,999')
FROM emp;
_________________________________
 

- ���� 072
�̸��� ���� * 5400�� ����ϴµ�, õ�����͹鸸������ ����Ͻÿ�. 
SELECT ename,TO_CHAR(sal*5400,'$99,999,999')
FROM emp;

- ����
�Ϲ��Լ�
1. nvl
2. decode-- 2022-01-06 ����Ŭ ��������
/*
- ���� 041 ==> SUBSTR => ���ڸ� 3���� ��� 
������ �Լ� 
    =���� ���� 
      LENGTH , SUBSTR , INSTR
�Ʒ��� ���� ����� ����Ͻÿ�.
 
SELECT ename,SUBSTR(ename,1,3) 
FROM emp;
________________________________________
 

- ���� 042
�̸��� ù��° ö�ڸ� ����ϴµ� �ҹ��ڷ� ��µǰ� �Ͻÿ�
SELECT ename,Lower(SUBSTR(ename,1,1))||UPPER(SUBSTR(ename,2,LENGTH(ename)-1))
 FROM emp;
____________________________________
 

- ���� 043
upper, lower, substr, || �� ����ؼ� �Ʒ��� ���� ����� ����Ͻÿ�.
SELECT ename , INITCAP(ename) 
FROM emp;
 
SELECT ename,SUBSTR(ename,1,1)||LOWER(SUBSTR(ename,2,LENGTH(ename)-1))
FROM emp;

SELECT ename,UPPER(SUBSTR(ename,1,1)) || LOWER(SUBSTR(ename,2))
FROM emp;
________________________________________
 
- ���� 044 ==> INSTR
�̸��� M�ڸ� �����ϰ��ִ� ������� �̸��� ������ ����Ͻÿ�.
=> INSTR 
SELECT ename,sal
FROM emp
WHERE INSTR(ename,'M',1,1)>=1;
=> LIKE
SELECT ename,sal
FROM emp
WHERE ename LIKE '%M%';
=> REGEXP_LIKE
SELECT ename,sal
FROM emp
WHERE REGEXP_LIKE(ename,'M');

SELECT ename,sal,hiredate
FROM emp
WHERE ename LIKE '%M%';
________________________________________
 

*****- ���� 045
�̸��� EN �Ǵ� IN�� �����ϰ� �ִ� ������� �̸��� �Ի����� ����ϴµ� 
�ֱٿ� �Ի��� ������ ����Ͻÿ�.
SELECT ename,hiredate
FROM emp
WHERE ename LIKE '%IN%' OR ename LIKE '%EN%';

SELECT ename,hiredate
FROM emp
WHERE INSTR(ename,'IN',1,1)>=1 OR  INSTR(ename,'EN',1,1)>=1;

SELECT ename,hiredate
FROM emp
WHERE REGEXP_LIKE(ename,'IN|EN');

SELECT ename,hiredate
FROM emp
WHERE REGEXP_LIKE(ename,'EN|IN')
ORDER BY hiredate;

- ���� 046
������ SALESMAN�� ������� ��� �̸��� ������ ������ ����ϴµ� 
������ ���� ������� ����Ͻÿ�.

SELECT ename,job,sal,hiredate
FROM emp
WHERE job='SALESMAN'
ORDER BY hiredate DESC;

- ����
����Ŭ ���� ������ from, where, select, order by ������ ����ȴ�.
�� ���� ������ ���� as ��Ī�� �ν��ϰ� ���ϴ� �� �� �ִ�.
 
________________________________________
 

- ���� 047
�̸��� ù���ڰ� A�� �����ϴ� ������� �̸��� ���ް� ������ ����Ͻÿ�. 
***
SELECT ename,sal,job
FROM emp
WHERE ename LIKE 'A%';

SELECT ename,sal,job
FROM emp
WHERE INSTR(ename,'A',1,1)=1;

SELECT ename,sal,job
FROM emp
WHERE REGEXP_LIKE(ename,'^A');

SELECT ename,sal,job
FROM emp
WHERE ename LIKE 'A%';

 
________________________________________
- ���� 048
������ 1000���� 3000 ������ ������� �̸��� ���ް� �Ի����� ����ϴµ�, 
�Ի����� ���� �Ի��� ������� ��µǰ� �Ͻÿ�.

SELECT ename,sal,hiredate
FROM emp
WHERE sal BETWEEN 1000 AND 3000
ORDER BY hiredate ASC;

SELECT ename,sal,hiredate
FROM emp
WHERE sal BETWEEN 1000 AND 3000
ORDER BY 3 ASC;

SELECT ename,sal,hiredate
FROM emp
WHERE sal BETWEEN 1000 AND 3000
ORDER BY hiredate;
________________________________________
 

****- ���� 049
1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�. 

SELECT ename,hiredate
FROM emp
WHERE TO_CHAR(hiredate,'YYYY')=1981;

SELECT ename,hiredate
FROM emp
WHERE hiredate LIKE '81%';

SELECT ename,hiredate
FROM emp
WHERE hiredate LIKE '81%';

________________________________________


- ����
�������Լ� : ����, ����, ��¥, ��ȯ, �Ϲ�
������ �Լ� : MAX, MIN, AVG, SUM, COUNT
���� �Լ� : upper, lower, initcap, substr, instr, lpad, rpad, trim, replace
 
________________________________________
 

- ���� 052
instr �Լ��� �̿��ؼ� �̸��� A�ڸ� �����ϰ� �ִ� ������� �̸��� ����Ͻÿ�. 
SELECT ename 
FROM emp
WHERE INSTR(ename,'A',1,1)>=1;

SELECT ename
FROM emp
WHERE INSTR(ename,'A')>=1;

- ���� 054 => RPAD => ���̵� ã�� , ��й�ȣ ã�� 
�̸��� ������ ����ϴµ� ������ ��ü 10�ڸ��� ����ϰ� ������ �ڸ��� *�� ����Ͻÿ�! 
SELECT ename,RPAD(sal,10,'*')
FROM emp

SELECT ename,RPAD(sal,10,*)
FROM emp

 
________________________________________
 

****- ���� 055
�̸��� ������ ����ϴµ� ������ ��ü 10�ڸ��� ����ϰ� 
������ �ڸ��� �������� ����Ͻÿ�. 

 SELECT ename,RPAD(sal,10,' ')
FROM emp; 

SELECT ename,LPAD(sal,10,' ')
FROM emp;
_______________________________________
 

- ���� 056
length �Լ��� �̿��ؼ� �̸��� �̸��� ö���� ������ ����Ͻÿ�. 
SELECT ename,LENGTH(ename) 
FROM emp;

SELECT ename,LENGTH(ename)
FROM emp;

- ����
length : ���ڿ��� ���̸� ���� �Լ�





- ���� 057 => TRUNC
�̸�, �Ի��� ��¥���� ���ñ��� �� ���� �ٹ��ߴ��� �Ҽ��� �ڿ��� �߶� ����Ͻÿ�.
_______________________________________
SELECT ename,TRUNC(SYSDATE-hiredate)
FROM emp;
 
�� ���� �Լ��� ����(round, trunc, mod)

1. round : �ݿø��ϴ� �Լ�(������ �ڸ������� �ݿø��ؼ� ǥ��)
select 756.89, round(756.89, 1)
    from dual;        
=756.9 

select 756.89, round(756.89, -3)
    from dual;
=1000         
select 756.89, round(756.89, -2)
    from dual;        
=800 
(���ʺ��� -3, -2, -1, 0, 1)
(�ӽ����� ����� ���� ���� ���� ���̺� dual)
 
2. trunc : �׳� ������ �Լ�(������ �ڸ������� �����ؼ� ǥ��)
select 756.89, trunc(756.89, 1)
    from dual;
select 756.89, trunc(756.89, -2)
    from dual;
 
 
3. mod : ������ ���� �� ������ ��
select 756.89, mod(756.89, 1)
    from dual; 
 
 
________________________________________
 

*****- ���� 058
�̸�, �Ի��� ��¥���� ���ñ��� �� ��� �ٹ��ߴ��� �Ҽ��� �ڿ��� �߶� ����Ͻÿ�.
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate))
FROM emp;

SELECT ename,

- ����
���� ��¥ Ȯ���ϴ� ���
select sysdate from dual;
 
 
________________________________________
 
 
�� ��¥�Լ�
 
1. months_between : ��¥�� ��¥ ������ ������ ���
��¥ + ��¥ = ��¥
��¥ - ���� = ��¥
��¥ - ��¥ = ����
 
2. add_months : ��¥���� �������� ���� ��¥
 
3. next_day : ������ ��¥���� ������ ���ƿ� ������ ��¥�� ���
 
4. last_day : ������ ��¥���� ������ ��¥�� ���
 
 
________________________________________
 

- ���� 059
���ú��� 100�� ���� ��¥�� ����Ͻÿ�.
SELECT ADD_MONTHS(SYSDATE,100) FROM DUAL;
___________________________________
 

- ���� 060
���ú��� ������ ���ƿ� �������� ��¥�� ����Ͻÿ�. 

SELECT NEXT_DAY(SYSDATE,'��') FROM DUAL; 
_____________________________________
 

- ���� 061
���ú��� 100�޵� ���ƿ� �ݿ����� ��¥�� ����Ͻÿ�. 
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE,100),'��') FROM DUAL;

 
 
________________________________________
 

- ���� 062
�̹��� ������ ��¥�� ����Ͻÿ�. 
 
=> LAST_DAY 
SELECT LAST_DAY(SYSDATE) FROM DUAL;
 
 
________________________________________
 

- ���� 063
���ú��� ����� ���ϱ��� �� ���ϳ��Ҵ��� ����Ͻÿ�! 
SELECT LAST_DAY(SYSDATE)-SYSDATE FROM DUAL;
________________________________________
 
 
 
�� ������ Ÿ���� ��ȯ�ϴ� �Լ�
1. ���ڷ� ����ȯ :to_char
2. ���ڷ� ����ȯ :to_number
3. ��¥�� ����ȯ :to_date
 
 
________________________________________
 

- ���� 064
������ ���� �������� ����Ͻÿ�  => TO_CHAR => ���� DY
SELECT TO_CHAR(SYSDATE,'DY')||'����' FROM DUAL; 

________________________________________
 

- ���� 065
�̸�, �Ի��� ������ ����Ͻÿ�. 
SELECT ename,hiredate,TO_CHAR(hiredate,'DY') "����"
FROM emp;
- ����
��¥ ���佺Ʈ��(����1�� ����1 4-12)
���� : day, dy
�⵵ : YYYY, YY, RRRR, RR, year
�� : mm, mon, month
�� : dd
�� : ww, w, iw
�ð� : hh, hh24
�� : mi
�� : ss
 
________________________________________
 

- ���� 066
���ú��� 200�� �ڿ� ���ƿ��� ��¥�� ������ ��� 
SELECT TO_CHAR(ADD_MONTHS(SYSDATE,200),'DY') FROM DUAL;
__________________________________
 

- ���� 067
�̸��� �Ի��� �⵵�� ����Ͻÿ�.
 
SELECT ename , TO_CHAR(hiredate,'RRRR') FROM emp;

 
 
________________________________________
 

- ���� 068
1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�.
 
SELECT ename,hiredate 
FROM emp
WHERE TO_CHAR(hiredate,'yyyy')='1981';
 
 
________________________________________
 

- ���� 069
����Ͽ� �Ի��� ������� �̸��� �Ի���, �Ի��� ������ ����Ͻÿ�.
SELECT ename,hiredate,TO_CHAR(hiredate,'DY')||'����'
FROM emp
WHERE TO_CHAR(hiredate,'DY')||'����'='�����';
 
- ����
trim�� DB�� ������ �ʰ� ������ ���� ������ �Լ�
 
 
________________________________________
 

- ���� 070
81�� 12�� 11�Ͽ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.

SELECT ename,TO_CHAR(hiredate,'YYYY"��" MM"��" DD"��"') "�Ի���"
FROM emp
WHERE  hiredate='81/12/03';
________________________________
 

- ���� 071
�̸��� ������ ����ϴµ� ���޿� õ������ �ο��Ͻÿ�! (��: 3000 -> 3,000)

SELECT ename,TO_CHAR(sal,'$99,999')
FROM emp;
_________________________________
 

- ���� 072
�̸��� ���� * 5400�� ����ϴµ�, õ�����͹鸸������ ����Ͻÿ�. 
SELECT ename,TO_CHAR(sal*5400,'99,999,999')
FROM emp;

- ����
�Ϲ��Լ�
1. nvl
2. decode
3. case
 
________________________________________
 

- ���� 073
�̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� 0���� ����Ͻÿ�.
 
SELECT ename,NVL(comm,0)
FROM emp;

SELECT ename,NVL(comm,0)
FROM emp;
- ����
nvl �Լ��� argument ������ ������ Ÿ���� ����� �Ѵ�.
 
________________________________________
 

- ���� 074
�̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� no comm �̶� �۾��� ����Ͻÿ�.
SELECT ename , NVL(TO_CHAR(comm),'no comm')
FROM emp;
*/
 

 
 

3. case
 
________________________________________
 

- ���� 073
�̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� 0���� ����Ͻÿ�.
 
SELECT ename,NVL(comm,0)
FROM emp;
- ����
nvl �Լ��� argument ������ ������ Ÿ���� ����� �Ѵ�.
 
________________________________________
 

- ���� 074
�̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� no comm �̶� �۾��� ����Ͻÿ�.
SELECT ename , NVL(TO_CHAR(comm),'no comm')
FROM emp;
*/
 

 
 
