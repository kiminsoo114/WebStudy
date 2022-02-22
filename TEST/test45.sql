-- 2022-01-13 (오라클 정리) 
/*
      ALTER => 제약조건  
      -----------------------
            ALTER TABLE table_name
            ADD CONTRAINT 제약조건명 PRIMARY KEY(컬럼)
           
            ALTER TABLE table_name
            ADD CONTRAINT 제약조건명 CHECK(컬럼 IN('', '', ''))
            ALTER TABLE table_name
            ADD CONTRAINT 제약조건명 UNIQUE(컬럼)
            ALTER TABLE table_name
            ADD CONTRAINT 제약조건명 FOREIGN KEY(컬럼)
            REFERENCES 참테이블(참조컬럼)
            ALTER TABLE table_name
            MODIFY 컬럼명 CONTRAINT 제약조건명 NOT NULL
            ALTER TABLE table_name
            MODIFY 컬러명 데이터형 DEFAULT 값
      VIEW   
      ------
        = 기존의 테이블을 참조해서 필요한 데이터를 모아서 새로운 테이블을 만든다 
        = 가상 테이블 (참조한 테이블의 SQL문장만 저장)
        = 보안, SQL => 재사용 , SQL간결하게 만들 수 있다 
        = 저장해서 사용하는 방식, ***저장하지 않고 사용하는 방법 
           --------------------------  -----------------------------------
               단순뷰 , 복합뷰                     인라인뷰 
            = 단순뷰 (테이블을 한개만 참조)
            = 복합뷰 (테이블 2개이상 참조) ==> JOIN, SUBQUERY 
            = 인라인뷰 => 인기순위 10 ... 공지사항 몇개 ... 예매순 ... (rownum)
            = 확인 (뷰) => SQL 
              SELECT text FROM user_views
              WHERE view_name = ''; 
              => 오라클에 저장 : 테이블, 컬럼명, 제약조건명, 뷰명, 함수명 .... (대소문자로 저장됨)
              => table 구조 확인 : user_tables
              => 제약조건 : user_constraints  
                   = type
                      C => NOT NULL , CHECK
                      R => FOREIGN KEY
                      U => UNIQUE
                      P => PRIMARY KEY
              => 컬럼명+제약조건 : user_cons_columns
                   *** 같은 이름을 사용하면 안된다 
                        => 테이블명_컬럼
              => 사용 용도 : 반복적으로 사용되는 SQL(페이지 나누기)
                                   SQL문장이 긴 경우 
          = 시퀀스 : 자동 증가 번호 (PRIMARY KEY에 값 지정) 
                         게시물 번호, 영화번호, 음악번호 .... 
                         *** 권장 : 모든 테이블은 기본키 한개가 존재...(구분 => ROW)
                         *** PRIMARY KEY는 특별한 경우가 아니면 대부분 숫자 
                         ?code=187320 => 자바에서 받아서 오라클을 연결 데이터를 가지고 온다 
              => START WITH 값 (시작번호)  ==> 1 ==> int i = 1
              => INCREMENT BY 값   (증가값)                   i++
              => NOCACHE => (CACHE)20~30정도의 숫자를 저장한 다음에 사용 
              => NOCYCLE => (CYCLE)마지막번호 출력 => 다음 처음으로 시작
                   MAX_VALUE = 10
                   MIN_VALUE = 1
                   1......10, 1 
                   =====> MAX_VALUE를 지정하지 않으면 무한대 
              => 실제 증가되기전 값 (시퀀스가 현재 가지고 있는 값: currVal)
              => 증가된 값 : nextVal
              => 시퀀스명 => 테이블명_컬럼명_seq
                                     ------------------------
              => 생성 
                   CREATE SEQUENCE (seq명) => 변경 
                          START WITH 1
                          INCREMENT BY 1
                          NOCYCLE 
                          NOCACHE
              => 삭제 
                   DROP SEQUENCE seq명 
                   CREATE => DROP => 전체
                   INSERT => DELETE => ROW단위 삭제 
                  *** 삭제 
                  DELETE         TRUNCATE      DROP
*/