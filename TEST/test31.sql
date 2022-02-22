-- 2022-01-11 오라클 (DDL)
/*
      ----------------
      1. 카테고리 
      2. FOOD 
      ---------------- 망고플레이트 

      -----------------------------------
      1. 레시피
      2. 레시피 제작 
      3. 쉐프 
      4. 레시피스토어 (장바구니)
      ----------------------------------- 10000개의 레시피 
      
      -----------------------------------------------------
      음악 (지니,멜론)
      영화 (다음,네이버,CGV,롯데시네마,메가박스)
      여행 
      ----------------------------------------------------- 예매,코스
*/
-- 맛집의 카테고리 => 테이블 (PRIMARY => 구분자) 
DROP TABLE category;
CREATE TABLE category(
   cno NUMBER,
   title VARCHAR2(2000) CONSTRAINT category_title_nn NOT NULL,
   subject VARCHAR2(2000) CONSTRAINT category_subject_nn NOT NULL,
   poster VARCHAR2(260) CONSTRAINT category_poster_nn NOT NULL,
   link VARCHAR2(260),
   CONSTRAINT category_cno_pk PRIMARY KEY(cno)
);

-- 맛집 => 테이블 (PRIMARY)
DROP TABLE food_house;
CREATE TABLE food_house(
   no NUMBER,
   cno NUMBER,
   poster VARCHAR2(2000) CONSTRAINT fh_poster_nn NOT NULL,
   name VARCHAR2(300) CONSTRAINT fh_name_nn NOT NULL ,
   score NUMBER(2,1) CONSTRAINT fh_score_nn NOT NULL,
   address VARCHAR2(2000) CONSTRAINT fh_addr_nn NOT NULL,
   tel VARCHAR2(20) CONSTRAINT fh_tel_nn NOT NULL,
   type VARCHAR2(100) CONSTRAINT fh_type_nn NOT NULL,
   price VARCHAR2(30) CONSTRAINT fh_price_nn NOT NULL,
   time VARCHAR2(50),
   parking VARCHAR2(100),
   menu VARCHAR2(4000),
   CONSTRAINT fh_no_pk PRIMARY KEY(no),
   CONSTRAINT fh_cno_fk FOREIGN KEY(cno)
   REFERENCES category(cno)
);










