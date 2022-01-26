-- 데이터를 추출할때 원하는 형식으로 변경해서 추출 (내장함수) 
/*
        아이디 찾기 
        => ad*****  => RPAD()

       오라클에서 지원하는 내장 함수 
       단일행 함수 , 집합함수 (GROUP BY) 
       ======== 한개에 대해서만 처리 
         단일행 함수 
           = 문자 함수 
              1) 변환 함수 
                  ***대문자 변환 => UPPER() => UPPER('hello') => HELLO
                  ***소문자 변환 => LOWER() => LOWER('HELLO') => hello
                  이니셜 변환 => INITCAP() => INITCAP('HELLO') => Hello
              2) 문자열 결합 
                  CONCAT() => CONCAT('Hello','Java') => HelloJava 
                    ||           => 'Hello'||'Java' => HelloJava (많이 사용)
              3) 지정된 문자를 제거 => (자바에서는 공백 => trim())
                  ***LTRIM:왼쪽에 있는 문자만 제거
                                => LTRIM('ABCDEFGA','A') => 왼쪽에 있는 A를 제거 
                                                => 결과값 : BCDEFGA
                                => LTRIM(' ABCDEFGA ') => 공백을 제거 
                                                 => 결과값 : 'ABCDEFGA '
                  ***RTRIM:오른쪽에 있는 문자만 제거
                                => RTRIM('ABCDEFGA','A') => 오른쪽에 있는 A를 제거 
                                                => 결과값 : ABCDEFG
                                => RTRIM(' ABCDEFGA ') => 공백을 제거 
                                                 => 결과값 : ' ABCDEFGA'

                                *** RTRIM('AAAAAAAABCDEFGA','A') => 오른쪽에 있는 A를 제거 
                                                => 결과값 : AAAAAAAABCDEFG
                                *** LTRIM('AAAAAAAABCDEFGA','A') => 왼쪽에 있는 A를 제거 
                                                => 결과값 : BCDEFGA
                  TRIM : 좌우에 있는 문자를 제거 
                               => TRIM('A' FROM 'AAAAAAAABCDEFGAAAAA') 
                                        => 결과값 : BCDEFG
               4) 문자를 특수문자로 변환 
                   LPAD : 왼쪽부분만 변경  
                              LPAD(s,n,c) => s=>string, n=> 갯수 , c=>문자 
                              예) LPAD('Oracle',10,'#')
                                   => ####Oracle
                                   LPAD('Oracle',5,'#') 
                                   => Oracl
                   *****RPAD : 오른쪽 부분만 변경 (아이디 찾기, 비밀번호 찾기) 
                             RPAD(s,n,c) 
                             예) RPAD('Oracle',10,'*') => 글자수가 모자라는 경우에 *
                                  => Oracle**** 
               5) 문자 변경 
                   ***REPLACE(s1,s2,s3) => s=String
                            예) REPLACE('Hello Java','old','new') => old => new 
                                 REPLACE("Hello Java', 'a','b') => a를 b로 변경
                                     => Hello Jbvb
                                 REPLACE("Hello Java', 'Java','Oracle')
                                     => Hello Oracle
               6) 문자 갯수 확인 
                   ***** LENGTH(s)
                          예) LENGTH('Hello') ==> 5  ==> 갯수 
                               LENGTH('홍길동') ==> 3
                               LENGTHB('Hello') ==> 5 ==> byte출력 (ASC)
                               LENGTHB('홍길동') ==> 6 , 9 (UNICODE)
               7) 문자열 추출 (자른다)
                   ***** SUBSTR(s,s,n)    => s=string, s=시작위치 , n=갯수
                          ***오라클에서는 문자열번호 1번부터 시작 (자바:0)
                          String s="H e l l o O r a c l e"
                                        0 1 23 4 5 6 7 8 910
                          Hello Oracle 
                           1234567891011  ==> 오라클은 모든 번호 시작 => 1
                                                          자바는 모든 번호 시작 => 0
                          예) 
                                SUBSTR('Hello Oracle',1,3) 
                                => 첫번째위치에서부터 3글자를 자른다 => Hel
                                SUBSTR('81/12/03' , 7,2) => 03
                                SUBSTR('Hello Oracle',-1,3) ==> cle
                                                               ==
                                                                양수 : 앞에서부터  
                                                                음수 : 뒤에서부터
                 8) 문자위치값을 가지고 온다 => indexOf , lastIndexOf 
                     *** INSTR(s,s,n,e)  => s=>String, s =원하는 문자, n=> 개수, e=>몇번째
                         ==========
                          INSTR('Hello Oracle','l',1,1) => 3
                          INSTR('Hello Oracle','l',1,2) => 4
                     ==> SELECT 컬럼을 제어 
                            FROM
                            WHERE 함수|컬럼
                            GROUP BY 함수|컬럼
                            HAVING 함수|컬럼
                            ORDER BY 함수|컬럼
           = 숫자 함수 
                *****1) 반올림 : ROUND()
                *****2) 버림 : TRUNC()
                *****3) 올림 : CEIL()
                *****4) 나머지 : MOD()
           = 날짜 함수 
                *****1) SYSDATE : 시스템의 날짜 , 저장 
                ***2) MONTHS_BETWEEN : 총날짜를 개월수로 출력 (퇴직금...)
                ***3) ADD_MONTHS() : 적금 , 보험 ... 
                4) LAST_DAY() => 날짜를 입력하면 => 그달의 마지막 날짜를 가지고 온다 
                                          22/01/05 ==> 22/01/31
                5) NEXT_DAY() => 날짜를 입력하면 , 요일 ==> 다음에 들어오는 요일 
           = 변환 함수 
                *****1) TO_CHAR  => 숫자,날짜를 문자열로 변환 
                2) TO_NUMBER => 문자열을 숫자형으로 변경
                3) TO_DATE => 문자열을 날짜형으로 변경 
           = 기타 함수 
               ************1) NVL :NULL을 다시값으로 변경해서 사용 
               ***2) DECODE : switch~case 
               3) CASE : 다중 if  ===> PL/SQL (함수=>변수,제어문,연산자) => 반복 
*/
-- 변환 (대문자 , 소문자 , 이니셜) => UPPER , LOWER , INITCAP 
-- emp에 있는 사원의 이름을 대문자 , 소문자 , 이니셜로 출력 
SELECT ename , UPPER(ename) "대문자" , LOWER(ename) "소문자", INITCAP(ename) "이니셜" 
FROM emp;
-- 사용자의 입력값을 받은 경우에 대소문자 상관없이 처리 
SELECT ename , job, hiredate 
FROM emp
WHERE ename=UPPER('king');

SELECT ename , job, hiredate 
FROM emp
WHERE LOWER(ename)='king';

-- CONCAT : 문자열 결합 => 연습용 테이블(DUAL) => 숫자 연산 , 함수의 결과값만 확인 
SELECT CONCAT('Hello',' Oracle!!') FROM DUAL;
SELECT 'Hello'||' Oracle!!' FROM DUAL;
SELECT CONCAT('Hello',' Oracle!!') FROM emp;
-- TRIM => 공백문자를 제거 (사용자 입력 => space문자) => 자바 : trim():공백문자 제거 
-- LTRIM => 왼쪽에 있는 문자를 제거 => 결과값 : BCDEFGAAA
SELECT LTRIM('AAABCDEFGAAA','A') FROM DUAL;
-- RTRIM => 오른쪽에 있는 문자를 제거 => AAABCDEFG
SELECT RTRIM('AAABCDEFGAAA','A') FROM DUAL;
-- TRIM => 좌우에 있는 문자를 제거 => 결과값 : BCDEFG
SELECT TRIM('A' FROM 'AAABCDEFGAAA') FROM DUAL;
-- LPAD 
-- 글자수가 지정된 크기보다 작으면 빈 공백에 *을 출력한다(왼쪽)
SELECT LPAD('Oracle',10,'*') FROM DUAL;
-- RPAD
-- 글자수가 지정된 크기보다 작으면 빈 공백에 *을 출력한다(오른쪽)
SELECT RPAD('Oracle',10,'*') FROM DUAL;
-- emp에 있는 사원의 이름을 두글자만 출력 나머지는 *을 사용해서 출력 (아이디찾기)
SELECT ename, RPAD(SUBSTR(ename,1,2),LENGTH(ename),'*') "RPAD" FROM emp;
-- REPLACE => 문자를 변경 
SELECT REPLACE('Hello Oracle!!', 'l','K') FROM DUAL;
SELECT REPLACE('Hello Oracle!!', 'Hello','Hi') FROM DUAL;
-- & || => 오라클에서 사용하는 기호를 변경해서 저장 ...
-- LENGTH => 문자 갯수 
SELECT LENGTH('Hello'),LENGTH('홍길동') FROM DUAL;
SELECT LENGTHB('Hello'),LENGTHB('홍길동') FROM DUAL;
--주로 사용 (문자의 갯수를 지정) => 테이블을 생성 => 문자 갯수 설정 
-- emp에서 이름의 갯수가 5개인 사원의 이름을 출력 
SELECT ename 
FROM emp
WHERE ename LIKE '_____';

SELECT ename
FROM emp
WHERE LENGTH(ename)=5;

-- SUBSTR => 문자열 자르는 경우 (원하는 부분만 추출)  => 자바 substring()
-- SUBSTR(문자열, 시작위치 , 자를문자의 갯수) 
SELECT SUBSTR('Hello Oracle',3,3) FROM DUAL; 
-- emp에서 연도 , 일사 월 , 입사일  => 81/12/03
SELECT CONCAT('19',SUBSTR(hiredate,1,2)) "Year",
           SUBSTR(hiredate,4,2) "Month",SUBSTR(hiredate,7,2) "Day"
FROM emp;

-- emp에서 12월 입사한 사원의 이름 , 입사일 , 직위를 출력 
SELECT  ename,hiredate,job
FROM emp
WHERE SUBSTR(hiredate,4,2)=12;
-- (int)'D'
SELECT 'D' , ASCII('D') FROM DUAL;

-- INSTR() => 문자의 위치번호  => (자바: +:indexOf , -:lastIndexOf)
-- INSTR(문자열, 찾는 문자(열) , 몇번째부터 (시작위치) , 번째)
-- 예) 'Hello Oracle'  ==> l  => 1, 3
SELECT INSTR('Hello Oracle','l',1,1) FROM DUAL;
SELECT INSTR('Hello Oracle','l',1,2) FROM DUAL;
SELECT INSTR('Hello Oracle','l',1,3) FROM DUAL;

-- emp에서 2번째 문자가 A인 사원 이름,직위,입사일만 출력 
SELECT ename,job,hiredate
FROM emp
WHERE ename LIKE '_A%';

-- INSTR로 변경해서 찾기 
SELECT ename,job,hiredate 
FROM emp
WHERE INSTR(ename,'A',1,1)=2;








