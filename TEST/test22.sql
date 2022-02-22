-- 2022-01-10 ����Ŭ (SELECT : ������ �˻� => SQL���� ����) 
/*
      SQL (����ȭ�� ���� ��� => ���ڿ�)
      =====
         DML : ������ ���۾�� 
           SELECT : ������ �˻� (������ �б�)
                       1) ��ȭ ��� ,  �Խ��� ��� , ���� ��� , ���� ��� 
                          (������Ʈ�� ù �������� ���) => �ζ��κ�(������ ������)
                       2) �󼼺��� (WHERE (����)) 
                       3) ã�� (LIKE , REGEXP_LIKE)
                       4) �Խ��� <==> ��� (����) 
                           ���� <==> ��� , �ڿ� , ȣ��  (����) 
                           =========== �ּҷ� ã�´� (SUBSTR)
                       5) ������ ��ü => �������� 
           INSERT : ������ �߰� 
                        ȸ�� ���� , �Խ��� �� �ø��� , ��� ����...
                        ��ٱ��� ,�������� ...
           UPDATE : ������ ���� 
                        ȸ�� ���� , �Խ��� ���� , ��� ���� 
                        ��ٱ��� , ����...
           DELETE : ������ ���� 
                        ȸ�� Ż�� , �Խù� ���� , ��ٱ��� ���� ,���� ��� ...
         DDL : ������ ������ (����Ŭ���� �����ϴ� �������� , ��������)
                 -------------
                   ������ ����� ���� : ���̺� 
                   ���� ���̺� : �� 
                   �ڵ� ���� ��ȣ : ������ 
                   ã�⿡ ���� ����ȭ :�ε���
                   ===================== ����Ŭ ����(PL/SQL) ,
                                                                �ڹ� ����(JDBC) ********* 
                   �Լ� : FUNCTION
                   ���ν��� : PROCEDURE
                   Ʈ���� : TRIGGER 
                   = ����  : CREATE 
                   = ����  : ALTER
                   = ���� : DROP 
                   = �̸����� : RENAME 
                   = ������ �߶󳻱� : TRUNCATE
                   ===================== 
         TCL : �ϰ� ó�� 
                   ���� ����� ����  : COMMIT
                  �������� ��� ��� : ROLLBACK 
*/
-- �μ����� (��������) => 170page (BOOK : dept, CUSTOMER: emp, ODRERS : salgrade)
DESC BOOK
/*
    BOOKID       NOT NULL NUMBER(2) : å�� ������ȣ (�ߺ��� ���� ��ȣ)
    BOOKNAME  VARCHAR2(40) : å�̸� 
    PUBLISHER  VARCHAR2(40) : ���ǻ�
    PRICE    NUMBER(8) : �ݾ� 
*/
DESC ORDERS
/*
    ORDERID  NOT NULL NUMBER(2) : �ߺ��� �ȵ� ��ȣ => ������ 
    CUSTID  NUMBER(2) : �����ڿ� ���� ����
    BOOKID  NUMBER(2) : å�� ���� ���� 
    SALEPRICE  NUMBER(8) : �ѱ����� �ݾ� 
    ORDERDATE  DATE : ������ ��¥ 
*/
DESC CUSTOMER
/*
    CUSTID   NOT NULL NUMBER(2) : �ߺ��� ���� ��ȣ => ������ (ID�� ���ڿ�)
    NAME    VARCHAR2(40) : �̸�
    ADDRESS   VARCHAR2(50) : �ּ� 
    PHONE    VARCHAR2(20) : ��ȭ��ȣ 
*/
-- BOOK ��� 
--SELECT bookid,bookname,price
--FROM BOOK;
-- �������� 
-- å �ݾ��߿� ���� ��� å�� ����ϴ� => å�̸� , ���ǻ�, �ݾ� 
/*
SELECT MAX(price) 
FROM book;

SELECT bookname,price
FROM book
WHERE price=(SELECT MAX(price) 
                    FROM book);
*/
SELECT * 
FROM Orders;
-- 171 page
SELECT name
FROM Customer
WHERE custid IN(1,2,3);
-- 172page 
SELECT name
FROM Customer
WHERE custid IN(SELECT DISTINCT custid FROM Orders);

-- �������߿� ���ǻ� '���ѹ̵��'�� ������ ���� �̸��� ��� 
SELECT name
FROM Customer
WHERE custid IN(SELECT custid 
                        FROM Orders
                        WHERE bookid IN(SELECT bookid 
                                                   FROM book
                                                   WHERE publisher='���ѹ̵��'));
-- 175page
-- ���ǻ��� ��� �������ݺ��� ��� ������ ���Ͻÿ� 
SELECT b1.bookname
FROM Book b1
WHERE b1.price>(SELECT avg(b2.price) 
                         FROM book b2
                         WHERE b2.publisher=b1.publisher);



