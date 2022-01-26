-- 2022-01-13 (오라클 - 시퀀스) 
/*
      시퀀스 : 자동 증가 번호 (Primary Key)
                  게시물번호 , 영화번호 , 음악번호 , 맛집번호 ...
      생성 방법 => MYSQL,MARIADB => 컬럼뒤에 AUTOINCREMENT()
         = CREATE SQUENCE seq_name 
                                       ------------  중복으로 저장되면 안된다 
                                       ------------  테이블명_컬럼명_seq
            ***1) START WITH : 시작번호 (기본 1번부터 시작)
                       => START WITH 1
            ***2) INCREMENT BY : 증가값 
                       => INCREMENT BY 1 
            3) MAX_VALUE : 최대값 (증가)
            4) MIN_VALUE: 최소값
            ***5) CACHE | NOCACHE : 저장공간 
                    --------- 20정도를 메모리 저장 처리 (X)
                    --------- 저장되지 않은 상태 처리 (O)
            ***6) CYCLE | NOCYCLE : PRIMARY => NOCYCLE 
      삭제 방법 
         = DROP SEQUNCE sql_name

      값을 읽어오는 방법 
        = 현재값 => currval
        = 증가한 값 => nextval (O)
        = 무조건 증가 
             1
             2
             3
             4 
             5 => 삭제
           =======   1 2 3 4 6
      ===> SELECT MAX(no)+1 FROM table_name
*/
-- 간단한 테이블 
DROP TABLE student;
CREATE TABLE student(
     hakbun NUMBER,
     name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
     kor NUMBER(3),
     eng NUMBER(3),
     math NUMBER(3),
     CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun),
     CONSTRAINT std_kor_ck CHECK(kor>=0),
     CONSTRAINT std_eng_ck CHECK(eng>=0),
     CONSTRAINT std_math_ck CHECK(math>=0)
);
-- 시퀀스 제작 
/*
CREATE SEQUENCE std_hakbun_seq
      START WITH 100
      INCREMENT BY 1
      NOCACHE 
      NOCYCLE;
*/
-- 값 추가
/*
INSERT INTO student VALUES(std_hakbun_seq.nextval,'홍길동',90,80,70);
INSERT INTO student VALUES(std_hakbun_seq.nextval,'심청이',90,80,70);
INSERT INTO student VALUES(std_hakbun_seq.nextval,'박문수',90,80,70);
INSERT INTO student VALUES(std_hakbun_seq.nextval,'이순신',90,80,70);
INSERT INTO student VALUES(std_hakbun_seq.nextval,'강감찬',90,80,70);
COMMIT;
*/

SELECT std_hakbun_seq.currval FROM DUAL;
SELECT std_hakbun_seq.nextval FROM DUAL;
--SELECT * FROM student;










