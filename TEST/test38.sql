-- 2022-01-12 ����Ŭ �̹����� SQL���� ����� 1ȸ�� 
/*
Category ���̺� 

CNO         NOT NULL NUMBER         
TITLE         NOT NULL VARCHAR2(2000) 
SUBJECT     NOT NULL VARCHAR2(2000) 
POSTER      NOT NULL VARCHAR2(260)  
LINK             VARCHAR2(260)

ī�װ��� cno�� 1~12������ �ϰ��� ��������Ʈ
               cno��  13~18 ������ ������ �α����
               cno��  19~30 ������ �޴��� �α����
---------------------------------------------------------------------
Food_house ���̺� 

NO                NOT NULL NUMBER         
CNO              NUMBER         
POSTER          NOT NULL VARCHAR2(2000) 
NAME            NOT NULL VARCHAR2(300)  
SCORE           NOT NULL NUMBER(2,1)    
ADDRESS       NOT NULL VARCHAR2(2000) 
TEL               NOT NULL VARCHAR2(20)   
TYPE             NOT NULL VARCHAR2(100)  
PRICE            NOT NULL VARCHAR2(30)   
TIME             VARCHAR2(50)   
PARKING        VARCHAR2(100)  
MENU           VARCHAR2(4000)
*/

-- Category���̺��� poster,title,subject => cno=1~cno=12 : BETWEEN ~ AND
/*
      �̹��� / ������Ʈ => ��¹� 
      ������ 
         �񱳿����� :  = , <> , < , > , <= , >=  ==> boolean(true/false)
         �������� : AND(����=> �ΰ��� true�϶� true), OR (���� => ���ʸ� true(true)
         NOT , NULL , IN , LIKE , BETWEEN 
*/

SELECT poster,title,subject 
FROM category
WHERE cno BETWEEN 1 AND 12;

SELECT poster,title,subject 
FROM category
WHERE cno BETWEEN 13 AND 18;

SELECT poster,title,subject 
FROM category
WHERE cno BETWEEN 19 AND 30;


-- 2�� ã�� 
SELECT poster,name,score,address
FROM food_house
WHERE cno=19;

-- �󼼺���
SELECT * 
FROM food_house
WHERE no=100;

-- ã�� => LIKE 
SELECT name,score,poster,address,type
FROM food_house
WHERE address LIKE '%ȫ��%'

SELECT name,score,poster,type,address,price,rownum
FROM food_house
WHERE address LIKE '%���빮��%'
AND rownum<=4;
--�ڹٿ��� ó�� 
SELECT LTRIM(SUBSTR(SUBSTR('����Ư���� ���빮�� ���뵿���� 45',
             INSTR('����Ư���� ���빮�� ���뵿���� 45',' ',1,1),
             INSTR('����Ư���� ���빮�� ���뵿���� 45',' ',1,2)),1,
             INSTR('���빮�� ���뵿����',' ',1,1)))
FROM DUAL;









