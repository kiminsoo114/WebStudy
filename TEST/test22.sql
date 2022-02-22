-- 2022-01-10 오라클 (SELECT : 데이터 검색 => SQL문장 제작) 
/*
      SQL (구조화된 질의 언어 => 문자열)
      =====
         DML : 데이터 조작언어 
           SELECT : 데이터 검색 (데이터 읽기)
                       1) 영화 목록 ,  게시판 목록 , 음악 목록 , 맛집 목록 
                          (웹사이트의 첫 페이지는 목록) => 인라인뷰(페이지 나누기)
                       2) 상세보기 (WHERE (조건)) 
                       3) 찾기 (LIKE , REGEXP_LIKE)
                       4) 게시판 <==> 댓글 (조인) 
                           맛집 <==> 명소 , 자연 , 호텔  (조인) 
                           =========== 주소로 찾는다 (SUBSTR)
                       5) 조인을 대체 => 서브쿼리 
           INSERT : 데이터 추가 
                        회원 가입 , 게시판 글 올리기 , 댓글 쓰기...
                        장바구니 ,예매저장 ...
           UPDATE : 데이터 수정 
                        회원 수정 , 게시판 수정 , 댓글 수정 
                        장바구니 , 예매...
           DELETE : 데이터 삭제 
                        회원 탈퇴 , 게시물 삭제 , 장바구니 삭제 ,예매 취소 ...
         DDL : 데이터 선언언어 (오라클에서 제공하는 데이터형 , 제약조건)
                 -------------
                   데이터 저장소 제작 : 테이블 
                   가상 테이블 : 뷰 
                   자동 증가 번호 : 시퀀스 
                   찾기에 대한 최적화 :인덱스
                   ===================== 오라클 응용(PL/SQL) ,
                                                                자바 응용(JDBC) ********* 
                   함수 : FUNCTION
                   프로시저 : PROCEDURE
                   트리거 : TRIGGER 
                   = 생성  : CREATE 
                   = 수정  : ALTER
                   = 삭제 : DROP 
                   = 이름변경 : RENAME 
                   = 데이터 잘라내기 : TRUNCATE
                   ===================== 
         TCL : 일괄 처리 
                   정상 수행시 저장  : COMMIT
                  비정상일 경우 취소 : ROLLBACK 
*/
-- 부속질의 (서브쿼리) => 170page (BOOK : dept, CUSTOMER: emp, ODRERS : salgrade)
DESC BOOK
/*
    BOOKID       NOT NULL NUMBER(2) : 책의 고유번호 (중복이 없는 번호)
    BOOKNAME  VARCHAR2(40) : 책이름 
    PUBLISHER  VARCHAR2(40) : 출판사
    PRICE    NUMBER(8) : 금액 
*/
DESC ORDERS
/*
    ORDERID  NOT NULL NUMBER(2) : 중복이 안된 번호 => 구분자 
    CUSTID  NUMBER(2) : 구매자에 대한 정보
    BOOKID  NUMBER(2) : 책에 대한 정보 
    SALEPRICE  NUMBER(8) : 총구매한 금액 
    ORDERDATE  DATE : 구매한 날짜 
*/
DESC CUSTOMER
/*
    CUSTID   NOT NULL NUMBER(2) : 중복이 없는 번호 => 구분자 (ID를 문자열)
    NAME    VARCHAR2(40) : 이름
    ADDRESS   VARCHAR2(50) : 주소 
    PHONE    VARCHAR2(20) : 전화번호 
*/
-- BOOK 출력 
--SELECT bookid,bookname,price
--FROM BOOK;
-- 서브쿼리 
-- 책 금액중에 가장 비싼 책을 출력하다 => 책이름 , 출판사, 금액 
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

-- 구매자중에 출판사 '대한미디어'를 구매한 고객의 이름을 출력 
SELECT name
FROM Customer
WHERE custid IN(SELECT custid 
                        FROM Orders
                        WHERE bookid IN(SELECT bookid 
                                                   FROM book
                                                   WHERE publisher='대한미디어'));
-- 175page
-- 출판사의 평균 도서가격보다 비싼 도서를 구하시오 
SELECT b1.bookname
FROM Book b1
WHERE b1.price>(SELECT avg(b2.price) 
                         FROM book b2
                         WHERE b2.publisher=b1.publisher);



