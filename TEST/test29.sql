-- 2022-01-11 DML(데이터 조작언어) 
/*
      SABUN                                     NOT NULL NUMBER(4)
      --------- PRIMARY KEY
      NAME                                      NOT NULL VARCHAR2(34)
      --------- NOT NULL
      DEPT                                        VARCHAR2(9)
      LOC                                          VARCHAR2(2)
      JOB                                          VARCHAR2(6)
      --------------------------------- CHECK (지정된 데이터만 입력)
      HIREDATE                                 DATE
      ------------ YY/MM/DD
      PAY                                          NUMBER
      COMM                                      NUMBER
      ------------ NULL허용 

      데이터 관리 
      -------------
       1) 데이터 추가 : INSERT 
       2) 데이터 수정 : UPDATE 
       3) 데이터 삭제 : DELETE
       4) 데이터 검색 : SELECT 
*/
-- sawon에 데이터 추가 
-- 전체 추가 
-- 오류 발생(갯수가 틀리다)
-- INSERT INTO sawon VALUES(1000,'홍길동','개발부','서울','대리','19/02/03',3600);
-- 오류 발생(사번은 중복없다)
-- INSERT INTO sawon VALUES(1000,'박문수','영업부','부산','사원','21/11/20',3000,NULL);
-- 오류 발생(제주사용할 수 없다)
-- INSERT INTO sawon VALUES(1001,'심청이','총무부','제주','과장','15/01/03',5000,300);
-- 자르기 : TRUNCATE TABLE table_name
-- TRUNCATE TABLE sawon;
-- 실제 데이터 첨부 
/*
INSERT INTO sawon VALUES(1000,'홍길동','개발부','서울','대리','19/02/03',3600,NULL);
INSERT INTO sawon VALUES(1001,'박문수','영업부','부산','사원','21/03/01',3000,NULL);
INSERT INTO sawon VALUES(1002,'심청이','자재부','부산','과장','16/11/10',4500,NULL);
INSERT INTO sawon VALUES(1003,'춘향이','총무부','경기','부장','12/10/15',5600,NULL);
INSERT INTO sawon VALUES(1004,'이순신','개발부','서울','사원','21/03/01',3000,NULL);
-- 저장 명령어를 전송 (자바에는 Auto) 
COMMIT;

-- 원하는 컬럼만 지정  => DEFAULT 적용 , NULL을 자동으로 처리 (192page)
   *** COMMIT을 수행하면 => ROLLBACK이 수행되지 않는다 
   *** COMMIT 전에 RollBack을 수행하여 정상적으로 수행 
   COMMIT => 메모리안에 저장 (저장하기)
   ROLLBACK => 오라클 명령 취소 (저장안하기)
*/
/*
INSERT INTO sawon(sabun,name,dept,loc,job,pay)
VALUES(1005,'강감찬','개발부','서울','사원',3100);
*/
/*
-- INSERT , UPDATE , DELETE => COMMIT 사용 (저장)
INSERT INTO sawon(sabun,name,dept,loc,job,pay,comm)
VALUES(1006,'강감찬','총무부','경기','대리',3700,300);
COMMIT; 
*/
-- 삭제(DELETE)  => ROW단위 (INSERT,UPDATE,SELECT)  
/*
    전체 삭제 
    DELETE FROM table_name 
    원하는 데이터 삭제   
    DELETE FROM table_name
    WHERE 컬럼명=값
               -------- 권장(PK)
*/
--DELETE FROM sawon;
--SELECT * FROM sawon;
--DELETE FROM sawon
--WHERE name='강감찬';
--SELECT * FROM sawon;
/*
     UPDATE (수정)
     형식)
     UPDATE table_name SET
     ----------                  ----
     컬럼명=값(변경) , 컬럼명=값 , 컬럼명=값 
     (= 대입연산자)
     [WHERE 컬럼명=값 (= 비교연산자)]
      *** WHERE에서 사용하면 비교연산자
      *** WHERE외에서 사용하면 대입연산자

     INSERT , UPDATE , DELETE => 정상적으로 저장(COMMIT) ,
                                                 명령어를 취소(ROLLBACK)
     *** DDL은 자동처리 (COMMIT,ROLLBACK이 적용되지 않는다)  

     INSERT INTO sawon(sabun,name,dept,loc,job,pay)
     VALUES(1005,'강감찬','개발부','서울','사원',3100);
*/
-- 전출 
/*
UPDATE sawon SET
dept='총무부' , loc='부산' , job='대리' , pay=3600 , comm=500 
WHERE sabun=1005;

SELECT * FROM sawon;
*/
/*
     ========> 3장 (기본 SQL)
     형식)
        DDL ==> column
          = CREATE
          = ALTER (ADD,MODIFY,DROP)
          = DROP 
          = TRUNCATE
          = RENAME 
       ------------------------- ROW
        DML
          = INSERT 
          = UPDATE
          = DELETE
        DQL
          = SELECT  
       -------------------------

       1. 형식 , 2. 응용 (테이블 => 사이트)
       2. 검색 (SELECT) 
*/










