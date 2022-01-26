-- 2022-01-12 오라클(4장) => 고급 SQL  ==> 209페이지 
/*
       내장함수 
       서브쿼리 고급 (스칼라 서브쿼리 , 인라인뷰)
       뷰 
       시퀀스
            => 테이블 제작 / 필요한 데이터 수집 (응용)  
       => 인덱스 / => PL/SQL
       => JDBC(자바 오라클 연결)
            ---------------------------
*/
/*
     내장 함수 : 오라클 지원하는 함수 (PL/SQL => 사용자 정의 함수 제작)
     ROW단위로 처리  ==> 단일행 함수 
     COLUMN단위 처리 ==> 다중행 함수(집합함수 , 집계함수)
     단일행 함수 
       = 문자관련 함수 (자바: String)
          변경 , 제어 
          = 변경 
                      검색 (오라클 => SQL문장은 대소문자를 구분하지 않는다)
                      ==> 저장된 데이터는 대소문자를 구분한다 
                      ==> 사용자가 검색어를 보내 줄때 (대소문자 구분없이 전송이 가능)
             ------------------------------------------------------
             1) UPPER : 대문자 변환 (자바: toUpperCase())
                   UPPER('abc'|컬럼명) ==> ABC
             2) LOWER : 소문자 변환 (자바:toLowerCase())
                   LOWER('ABC'|컬럼명) ==> abc
             ------------------------------------------------------
             3) INITCAT ====> 자바에서 존재하지 않는다 
                   INITCAP('abc'|컬럼명) ==> Abc
             4) LTRIM : 왼쪽에 있는 문자를 제거 
                   LTRIM('AABCD','A') => 왼쪽에 있는 모든 A를 제거 => BCD
                   LTRIM(' AABCD') => 왼쪽에 있는 공배을 제거 
                   *** 자바에서 사용하는 trim() => 좌우의 공백을 제거 
             5) RTRIM : 오른쪽에 있는 문자를 제거 
                   RTRIM('AABBAA'|컬럼명, 'A') => AABB
                   RTRIM('AABBAA ')  => 오른쪽에 있는 공백을 제거 
             6) LPAD : 문자의 갯수를 지정하고 문자를 출력할 경우에
                            갯수가 모자라면 지정된 문자를 채워준다 (왼쪽)
                 LPAD('ABC',10,'#') ==> #######ABC => 10글자를 만들어 준다 
                    => 아이디찾기 , 비밀번호 .. 이메일주소 ... (보안)
             ***7) RPAD : 오른쪽에 채운다 (자바에 존재하지 않는다)
                 RPAD('ABC',7,'*') => ABC****
                 RPAD('ABCDEFG',5,'*') => ABCDE
                 RPAD('ABCDE',5,'^') => ABCDE
             ***8) REPLACE : 원하는 문자나 문자열을 변경할때 사용 
                 REPLACE('Hello Oracle!!','l','k') => Hekko Oracke!!
                 REPLACE('Hello Oracle!!','ra','oo') => Hello Ooocle!!
                 => 데이터 수집 ( & , || ) => 문자를 변경 
                                        === 입력요청 , || 문자열 결합 
                                         & , || ==> 이미지 
           -- https://mp-seoul-image-production-s3.mangoplate.com/254511/1679022_1640799901695_14797?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80
          = 제어 
             ***1) SUBSTR : 문자열을 잘라내기 할때 => 글자수를 줄이는 경우
                    SUBSTR('문자열'|컬럼명,시작위치,자를 갯수)
                    SUBSTR('Hello Oracle' , 3 , 2) ==> ll
                    H e l l o  O r a c l e
                    1 2 3456 7 8 9 10 11 12
                         ---
                    *** 오라클은 시작위치 => 1
                         자바는 시작위치 => 0
             ***2) INSTR : 문자의 위치를 찾는 경우 사용 (indexOf,lastIndexOf)
                     INSTR('ABCDECG','C',1,1) ==> 3
                     INSTR('ABCDECG','C',1,2) ==> 6
             ***3) LENGTH : 문자의 갯수 
                     LENGTH('ABC')  ==> 3
                     LENGTH('홍길동') => 3

              *** 암기 (RPAD , REPLACE , SUBSTR , INSTR , LENGTH)
                           ----------------------------------------------------- 웹 사이트 제작 
       = 숫자관련 함수 (자바: Math)
            ***1) ROUND() : 반올림 함수 => 통계 
                    => ROUND(AGV(sal),2)  => 예매율 , 평균 ...
                    => ROUND(AGV(sal)) 
            2) TRUNC() : 버림 함수
            ***3) CEIL() : 올림 함수 => 총페이지 (사이트는 페이지를 나눠서 출력) 
       = 날짜관련 함수 (자바: Date)
            ***1) SYSDATE : 시스템의 시간 , 날짜 ( 정수형 ) =>날짜수+시간 => 소수점
                => 등록일 저장 (게시판 등록일, 회원가입...)
            2) MONTHS_BETWEEN : 이전 ~ 현재의 총 개월수를 가지고 올때 
                                               입사일~현재 (ERP:관리프로그램)
                => 공기업 (국세청..한전) , 금융권 (은행,증권,신용,보험)
       = 변환 함수 (자바: SimpleDateFormat,MessageFormat...)
          *** TO_CHAR : 날짜나 숫자를 문자열로 변환 
               연산처리 => 자동으로 변환  '1'+'2'=> 1+2=3
                                 SYSDATE+1 ==> 22/01/13
               => 날짜 변환 , 숫자 변환 
                    ======   =======  L999,999
                     YYYY/RRRR
                     MM / DD / HH24(HH12) / MI / SS ==댓글/공지사항 (자바에서 시간처리를 못한다)
       = 기타 
         *** NVL : NULL값을 다른 값을 대체하는 함수 
              NVL(comm,1) => comm이 NULL값이면 1로 변경 
                    -------- -- 반드시 일치 
              NVL(bunji, '') => NULL  ==> ''(NULL)
              NVL(bunji,' ') => 공백    ==> ' '
              ****** NULL이 있는 경우 => 브라우저에 출력 (null)

      = 다중행 함수 (집계함수)
         *** 집계함수는 일반 컬럼이나 단일행함수와 같이 사용할 수 없다 
                              ----------------------------
              (단 사용을 하려면 => 반드시 GROUP BY 처리)
         1) SUM => 전체 column의 합을 구한다 
             SUM(컬럼명)  ==> SUM(sal)
         2) AVG  => 전체 column에 대한 평균을 구한다 
             AVG(컬럼명)  ==> AVG(sal)
         3) 최대값 , 최소값 
             ***MAX(sal) , MIN(sal)
                ------------ 자동 증가번호 
         4) ROW의 갯수 구하기 
             COUNT
              ***= COUNT(*) ==> NULL을 포함 
                     검색결과,로그인 ,아이디중복,페이지
              = COUNT(컬럼명) ==> NULL을 미포함 
         5) RANK : 순위를 결정 
                ==> ORDER BY를 이용 => ASC/DESC
             RANK() => 같은 순위가 있는 경우에 건너뛴다 
                              1
                              2
                              2
                              4
             DENSE_RANK() => 같은 순위가 있는 경우에 건너뛰지 않는다 
                              1
                              2
                              2
                              3
            사용법 
              RANK OVER(ORDER BY sal DESC) 
              RANK OVER(ORDER BY sal ASC)
              DENSE_RANK OVER(ORDER BY sal DESC) 
              DENSE_RANK OVER(ORDER BY sal ASC)
              => 예매율 , 음반 판매순 , 히트수 
      
*/
/*
DROP TABLE member2;

CREATE TABLE Member2(
      no NUMBER,
      name VARCHAR2(34) CONSTRAINT mem_name_nn NOT NULL,
      sex VARCHAR2(6),
      CONSTRAINT mem_no_pk PRIMARY KEY(no),
      CONSTRAINT mem_sex_ck CHECK(sex IN('남자','여자'))
);
-- Member2에 데이터를 추가 
INSERT INTO Member2 VALUES(1,'홍길동','남자');
INSERT INTO Member2 VALUES(2,'심청이','여자');
INSERT INTO Member2 VALUES((SELECT MAX(no)+1 FROM member2),'춘향이','여자');
INSERT INTO Member2 VALUES((SELECT MAX(no)+1 FROM member2),'이순신','남자');
INSERT INTO Member2 VALUES((SELECT MAX(no)+1 FROM member2),'박순신','남자');
COMMIT;
*/
-- SELECT COUNT(*) FROM member2;
SELECT COUNT(*) FROM member2
WHERE name='강감찬';

SELECT COUNT(*) FROM member2
WHERE name='홍길동';


SELECT COUNT(*) FROM member2
WHERE name LIKE '%이%';

SELECT COUNT(*) FROM member2
WHERE name LIKE '%강%';










