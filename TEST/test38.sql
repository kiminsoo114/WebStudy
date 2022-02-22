-- 2022-01-12 오라클 이미지로 SQL문장 만들기 1회차 
/*
Category 테이블 

CNO         NOT NULL NUMBER         
TITLE         NOT NULL VARCHAR2(2000) 
SUBJECT     NOT NULL VARCHAR2(2000) 
POSTER      NOT NULL VARCHAR2(260)  
LINK             VARCHAR2(260)

카테고리는 cno가 1~12번까지 믿고보는 맛집리스트
               cno가  13~18 번까지 지역별 인기맛집
               cno가  19~30 번까지 메뉴별 인기맛집
---------------------------------------------------------------------
Food_house 테이블 

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

-- Category테이블에서 poster,title,subject => cno=1~cno=12 : BETWEEN ~ AND
/*
      이미지 / 웹사이트 => 출력물 
      연산자 
         비교연산자 :  = , <> , < , > , <= , >=  ==> boolean(true/false)
         논리연산자 : AND(직렬=> 두개가 true일때 true), OR (병렬 => 한쪽만 true(true)
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


-- 2번 찾기 
SELECT poster,name,score,address
FROM food_house
WHERE cno=19;

-- 상세보기
SELECT * 
FROM food_house
WHERE no=100;

-- 찾기 => LIKE 
SELECT name,score,poster,address,type
FROM food_house
WHERE address LIKE '%홍대%'

SELECT name,score,poster,type,address,price,rownum
FROM food_house
WHERE address LIKE '%동대문구%'
AND rownum<=4;
--자바에서 처리 
SELECT LTRIM(SUBSTR(SUBSTR('서울특별시 서대문구 연대동문길 45',
             INSTR('서울특별시 서대문구 연대동문길 45',' ',1,1),
             INSTR('서울특별시 서대문구 연대동문길 45',' ',1,2)),1,
             INSTR('서대문구 연대동문길',' ',1,1)))
FROM DUAL;









