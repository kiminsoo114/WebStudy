-- 2022-01-07 오라클 (SQL)
/*
     저장장소 : 데이터베이스 (테이블)
                   --------------- ---------
                         폴더          파일 
    --> 1~8장(기본)  , 11,12장,15장 
          -------------    --------------- 라이브러리 
           배열 : 코딩테스트 
    --> 3장 , 4장 , 5장 (핵심) => 오라클 2주
    --> 데이터가 저장 : 추가 , 삭제 , 수정 , 읽기
         ========================== DML
         SQL 
      
           = DML(CURD)
                1. 데이터 읽기 : SELECT
                2. 데이터 쓰기 : INSERT
                3. 데이터 수정 : UPDATE
                4. 데이터 삭제 : DELETE 
          ------------- 웹 프로그래머  
           = DDL
           = TCL 
           = DCL
         -------------- 데이터베이스 관리자 
*/
-- 1-2 : BOOK (테이블) ==> 제목 , 출판사 
-- 전체 데이터 출력 
-- 테이블의 구조(컬럼, 어떤 데이터로 저장되는 지 확인 
-- 검색 ==> 문자 , 날짜 ==> ''
DESC book; 
/*
    BOOKID                                    NOT NULL NUMBER(2) (구분)
      => 중복이 안된 값
    BOOKNAME                                        VARCHAR2(40)
    PUBLISHER                                          VARCHAR2(40)
    PRICE                                              NUMBER(8)
*/
/*
     1. 전체를 읽어 온다 (저장된 데이터) => *
     2. 필요한 값(컬럼 구분)만 출력 => column1,column2...
*/
-- 데이터 전체 출력 요청  => ROW
SELECT * 
FROM book;
-- 원하는 데이터만 추출  => 도메인 
SELECT bookname,publisher
FROM book;
/*
      1. SELECT 문장 
         *** DISTINCT  : 컬럼값중에 중복이 없는 데이터 추출 
               예)  SELECT DISTINCT ename => 영화 장르 , 음악 장르 
                                                              직위의 종류 ...
         *** || : 문자열 결합 (자바 : +)
         *** &: 오라클에서 사용자 입력값을 받는 경우 => Scanner
         = 형식)
            SELECT [DISTINCT] *(전체 데이터)|column1,column2(선택 데이터)
            FROM 데이터가 저장된 위치 (테이블|뷰|SELECT~)
                     => SELECT : 데이터 검색 
                          용도 : 컬럼 대신 사용 ( 스칼라 서브쿼리)
                          SELECT (SELECT dname FROM dept) dname
                                   테이블 대신 사용 (인라인 뷰)
                          SELECT ~
                          FROM (SELECT ~)
            [
                WHERE 조건절(연산자)
                GROUP BY 그룹으로 묶어서 그룹별 따로 처리 
                                ------------------ (동일한 값이 여러개...)
                                직위, 부서번호, 입사일년도 ....
                HAVING 그룹에 대한 조건 (GROUP BY를 설정했을때만 사용이 가능)
                ORDER BY 정렬(올림차순 ASC , 내림차순 DESC)
                                      ---------------- 생략이 가능 
                                      *** 오라클에 저장된 데이터는 정렬이 된 상태가 아니다 
            ]

        -- 조건 처리 (연산자)
            오라클에서 제공하는 연산자 
            = 산술연산자 (+,-,*,/) 
                 -- 자동 형변환이 된다   10+10.5 => 20.5
                                                 '10'+'20' => 30
                                                  10    20 => 30
                 -- / => 정수/정수=실수 
                 -- 숫자 (정수,실수가 포함)
                 -- 문자 (문자,문자열 포함) ==> ''
                 -- 날짜는 문자형 (YY/MM/DD)
             = 비교연산자 ( =  ,  !=(<>) , < , > , <= , >=)
                                 ---       -----
             = 논리연산자 ( AND , OR )
             = NOT => NOT LIKE , NOT IN , NOT BETWEEN ~ AND
             = IN => OR가 여러개 사용시에 주로 처리 (체크박스)
             = BETWEEN ~ AND : 기간, 범위 지정 (페이지 , 예약일...)
             = LIKE  
                  % : 글자수를 모르는 경우 
                  _ : 글자 1글자 
                  => REGEXP_LIKE() => 대체 
             = NULL : 연산을 처리 할 수 없다 (값을 가지고 있지 않은 상태)
                          IS NULL : NULL인 상태
                          IS NOT NULL : NULL이 아닌 상태 
             = WHERE , HAVING에서 주로 사용 
        -- 원하는 형태로 데이터 읽기 (내장 함수)
            ==>ROW 단위 처리 (단일행 함수)
            문자 함수 
               => SUBSTR(문자열|컬럼명, 시작번호 , 문자갯수)
               => INSTR(문자열|컬럼명 , 찾는문자 , 시작번호,몇번째있는지)
                    INSTR('Hello Oracle','l' , 1,3) => 위치번호 리턴
                    *** 오라클은 1번 , 자바는 0번 
               => LENGTH : 문자갯수 
            숫자 함수
               => ROUND : 반올림 
               => CEIL : 올림 => 총페이지 
            날짜 함수 
               => SYSDATE : 시스템의 시간 , 날짜 
               => MONTHS_BETWEEN : 기간의 개월수 
            변환 함수 
               => TO_CHAR 
                       패턴 (YYYY,MM,DD,MI,HH24,SS)
                              (999,999)
            기타 함수 
               => NVL : NULL을 다른 값을 대체해서 사용 
                            NVL(컬럼명 , 대체값)
                                  --------  -------- 반드시 일치가 되어야 한다 
        -- 그룹별 처리 
            GROUP BY : 그룹별 처리 
            ======== 집계함수 
                             SUM 
                             AVG
                             ***MAX : 자동 증가번호 MAX+1
                             MIN
                             ***COUNT : row의 갯수 => 로그인 ...
                             ---------- 분석함수
                              RANK,DENSE_RANK
                              CUBE 
                              ROLLUP 
                              *** 가로 통계
                              *** 세로 통계 
                             ----------
        -- 정렬 : ORDER BY 컬럼순서 , 컬럼명 
                    --------------------------------- ASC(올림차순) 생략이 가능
                                                             DESC(내림차순) 생략할 수 없다
                   ORDER BY 1; = ASC가 생략
                   ORDER BY 2 DESC; 
                   ORDER BY sal;
                   ORDER BY sal DESC;
                   => 이중 정렬 
                   ORDER BY sal DESC,ename ASC; => 답변형 , 댓글 ...
                                  정렬은 급여가 높은 순서로 출력 
                                            => 급여가 같은 경우에는 이름을 ASC
                  *** 데이터가 많은 경우에는 속도가 느리다 (단점)
                       => 보완 : 인덱스 => INDEX_ASC() , INDEX_DESC() , INDEX()
        -- 테이블이 여러개에 데이터 추출 (조인) 
            --> 중복을 제거 , 수정,삭제가 많은 경우 => 테이블 나눠서 사용 
                 ------------------------------------------------------------------
                    테이블과 테이블의 데이터를 합쳐서 데이터 추출 (조인) 
                    게시판 <==> 댓글 , 회원가입 <===> 예매 
                                                   |
                                                마이페이지 , 쿠키 , 장바구니
            --> 조인의 종류 
                  = INNER JOIN(중심)
                       ***=> (=) : 동등 , EQUI
                       => (=이 아닌 연산자 사용) : 비등가 , NON EQUI
                            포함형태 => BETWEEN , 논리 , 비교 
                       => 연산자 사용 (NULL일 경우는 데이터를 추출하지 못한다)
                       => 교집합 (INTERSECT)
                  = OUTER JOIN : INNER JOIN에 데이터 추출 + NULL일 경우 처리 가능 
                       ***=> LEFT OUTER JOIN
                       ***=> RIGTH OUTER JOIN
                       => FULL OUTER JOIN
              --> JOIN의 형식 
                  = 오라클 조인 => WHERE
                      SELECT A.col,B.col
                      FROM A,B
                      WHERE A.col=B.col
                  = ANSI 조인(표준화) => 일반 데이터베이스는 동일 하게 사용 
                     *** 데이터베이스 : 오라클 , MS-SQL , MYSQL, MariaDB,DB2
                     JOIN~ON
                     SELECT A.col,B.col
                     FROM A JOIN B
                     ON A.col=B.col
                     => FROM A,B => , 대신 JOIN
                     => WHERE A.col=B.col => WHERE 대신 ON
                     1) 주의점 
                         = 테이블끼리 같은 컬럼명을 가지고 있는 경우
                            어떤 테이블의 데이터인지를 확인 
                            테이블명.컬럼 , 별칭.컬럼  ====> 애매한 정의
                         = 원칙적으로는 모든 컬럼에 (테이블명,별칭)을 사용한다 
                            테이블의 컬럼명 다른 경우에는 생략이 가능 
                   --------------------------------------------------------------------
                   OUTER JOIN 형식 

                   = LEFT OUTER JOIN
                       = 오라클 조인 
                          SELECT A.col,B.col ....
                          FROM A , B
                          WHERE A.col=B.col(+)
                       = ANSI 조인 
                          SELECT A.col,B.col ....
                          FROM A LEFT OUTER JOIN B
                          ON A.col=B.col
                   = RIGHT OUTER JOIN
                       = 오라클 조인 
                          SELECT A.col,B.col ....
                          FROM A , B
                          WHERE A.col(+)=B.col
                       = ANSI 조인 
                          SELECT A.col,B.col ....
                          FROM A RIGHT OUTER JOIN B
                          ON A.col=B.col
                   = FULL OUTER JOIN

                       = ANSi만 존재 
                          SELECT A.col,B.col ....
                          FROM A FULL OUTER JOIN B
                          ON A.col=B.col
*/








