-- 2022-01-11 오라클 정리(179~192)
/*
    판매전표
설정 / 컬럼	전표번호	판매일자	고객명	총액
제약조건	     pk	  nn	Nn	
참조 테이블				
참조 컬럼				
CHECK 				>0
데이터형 	VARCHAR2	DATE	VARCHAR2	NUMBER
크기	12		34	

제품 
설정 / 컬럼	제품번호	제품명	제품단가
제약조건	pk	nn	
참조 테이블			
참조 컬럼			
CHECK 			0>
데이터형 	VARCHAR2	VARCHAR2	NUMBER
크기	12	100	

전표상세 
설정 / 컬럼	전표번호	제품번호	수량	단가	금액
제약조건	Pk,fk	fk	Nn	nn	
참조 테이블	판매전표	전표상세			
참조 컬럼	전표번호	제품번호			
CHECK 					>0
데이터형 	VARCHAR2	VARCHAR2	NUMBER	NUMBER	NUMBER
크기	12	12			


*/
/*
     1. FOREIGN KEY ==> 
         =생성순서
           참조대상 테이블이 먼저 만들어진다 
           판매전표 / 제품  (1)
           -----------------
                   |
             전표상세 (2) 
         =삭제순서 
          판매전표 / 제품  (2)
           -----------------
                   |
             전표상세 (1) 
          = 삭제를 하지 않을 경우 => ON DELETE CASCADE
*/
/*
-- 판매전표 
-- NOT NULL은 반드시 컬럼 뒤에 설정 
-- DEFAULT 반드시 컬럼 뒤에 설정 
-- PK,FK,CK,UK ==> 컬럼뒤에 설정 , 컬럼선언후에 설정 
CREATE TABLE 판매전표(
   전표번호 VARCHAR2(12),
   판매일자 DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL, 
   고객명	VARCHAR2(34) CONSTRAINT 판매전표_고객명_nn NOT NULL,
   총액 NUMBER,
   CONSTRAINT 판매전표_전표번호_pk PRIMARY KEY(전표번호),
   CONSTRAINT 판매전표_총액_ck CHECK(총액>0)
);
-- 제품 
CREATE TABLE 제품(
  제품번호 VARCHAR2(12),
  제품명 VARCHAR2(100) CONSTRAINT 제품_제품명_nn NOT NULL,
  제품단가 NUMBER,
  CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호),
  CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0)
);
-- 전표상세 (한 컬럼에 제약조건 여러개 사용이 가능)
CREATE TABLE 전표상세(
   전표번호 VARCHAR2(12),	
   제품번호 VARCHAR2(12),
   수량 NUMBER CONSTRAINT 전표상세_수량_nn NOT NULL,
   단가 NUMBER CONSTRAINT 전표상세_단가_nn NOT NULL,
   금액 NUMBER,
   CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호),
   CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
   REFERENCES 판매전표(전표번호) ON DELETE CASCADE,
   CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
   REFERENCES 제품(제품번호) ON DELETE CASCADE,
   CONSTRAINT 전표상세_금액_ck CHECK(금액>0)
);
*/
DROP TABLE 전표상세;
DROP TABLE 판매전표;
DROP TABLE 제품;

















