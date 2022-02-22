-- 2022-01-05 오라클 (내장함수) => 오라클에서 지원하는 라이브러리
/*
      라이브러리 => 함수명 (메소드명) => 매개변수(종류) => 결과값
      ======== 필요시마다 사용이 가능하게 만들어져 있다 (암기=> 언제 사용)
      사용자 정의 => 프로그램에서 다 지원하지 않는다 => PL/SQL 

      내장함수 : SELECT => 컬럼을 제어해서 사용 
                    WHERE => 조건에 맞는 데이터 추출 
                    ORDER BY => 정렬 사용시에도 사용이 가능 
                                        함수 
                             -----------------------
                             |                          |
                       단일행 함수           집합 함수(다중행 함수)
                             |                          | GROUP BY => 내일 
                      --------------------------------------------------------
                      |                   |                |              |              |
                 문자열 함수    숫자함수       날짜함수    변환함수   기타함수 
                      |
                  변환,               문자 제어 ,         문자갯수 
                 ====              ======           ======
                   UPPER            CONCAT            ***LENGTH
                   LOWER           ***RPAD/LPAD
                   INITCAP          LTRIM / RTRIM
                   ***REPLACE     ***SUBSTR 
                                        ***INSTR

                 숫자함수 
                 ======
                   **ROUND : 반올림  ==> ROUND(실수,숫자)  
                                              => ROUND(123456.789,2) ==> 123456.79
                                                                             =
                                              급여 / 호봉 ....
                                              
                   **TRUNC : 버림  ==> TRUNC(실수,숫자) 
                                             => TRUNC(123456.789,2) ==> 123456.78
                   ***CEIL : 올림     ==> CEIL(123456.78) ==> 123457
                       ==> 총페이지 구할 경우에 주로 사용 
                   MOD   : 나머지   ==> MOD(숫자,숫자) 
                                                  => MOD(100,2) = 0   ==> 100%2                     
*/
-- MOD : 나머지 
-- emp에서 사번이 짝수인 사원들의 모든 정보를 출력 
SELECT *
FROM emp
WHERE MOD(empno,2)=0;

-- ROUND (반올림)
SELECT ROUND(123456.789,2) FROM DUAL;
-- TRUNC (버림)
SELECT TRUNC(123456.789,2) FROM DUAL;
-- ***CEIL (올림)
SELECT CEIL(117/10.0) FROM DUAL;

SELECT name , kor ,eng , math , (kor+eng+math) "total",
          ROUND((kor+eng+math)/3,2) "avg"
FROM student;
/*
                날짜함수
               =======
               *****1) SYSDATE : 시스템의 날짜 , 시간을 읽어 올때 => 게시판 글쓰기 , 댓글(시간)
               ======= 정수처럼 사용이 가능 
               SYSDATE : 오늘 날짜 ,  어제 => SYSDATE-1
                                               내일 => SYSDATE+1  ==> 음악,영화 => 순위 변경 
               2) LAST_DAY : 입력된 달의 마지막 날짜를 읽어 온다 
                  LAST_DAY(SYSDATE) ==> 22/01/31
                  LAST_DAY('22/02/01') ==> 22/02/28
               3) NEXT_DAY(날짜,'요일')
                   NEXT_DAY(SYSDATE,'수') ==> 22/01/06

               *****4) MONTHS_BETWEEN : 이전~현재까지의 총 개월수 읽어 온다 
                   => 개월+시간 => 소수점까지 나올 수 있다 
               5) ADD_MONTHS : 개월 
                  ADD_MONTHS(SYSDATE,3) => 오늘+3개월후 => 날짜 
                                                    == 개월
                        => 적금 , 보험 
               
*/
SELECT SYSDATE-1 "어제", SYSDATE "오늘", SYSDATE+1 "내일"
FROM DUAL;
SELECT LAST_DAY(SYSDATE), LAST_DAY('22/02/01')
FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'목'),NEXT_DAY(SYSDATE,'수') FROM DUAL;
-- MONTHS_BETWEEN 
-- emp에 있는 모든 사원이 근무 개월 , 근무 년차 출력 
SELECT ename,ROUND(MONTHS_BETWEEN(SYSDATE,hiredate),0) "근무개월수",
           TRUNC(ROUND(MONTHS_BETWEEN(SYSDATE,hiredate),0)/12,0) "근무연차"
FROM emp;

SELECT ADD_MONTHS(SYSDATE,3) FROM DUAL;
/*
      변환함수 (Format)
      ***TO_CHAR : 문자열 변환
          날짜 => 문자열 (SimpleDateFormat)
                      YYYY : 4자리 년도 => RRRR 
                      YY : 2자리 년도     => RR
                      M  : 1~12 
                      MM : 01,02...10,11,12 
                      D : 1~31
                      DD : 01,02....
                      DY : 요일 출력 
                      ============== 날짜
                      HH => 1~12
                      HH24 => 1~24(시간)
                      MI => 0~59(분)
                      SS  => 초 
                     
          숫자 => 문자열 (패턴 99999999)
                      ==> 999,999  => 천단위에 ,을 입력 
                             $999,999
                             L999,999
      TO_DATE : 예약일 => 문자열 => Date형으로 변환 
      TO_NUMBER : 문자열=> 숫자  
*/
-- TO_CHAR  => emp (hiredate) ==> YY/MM/DD => YYYY/MM/DD
SELECT ename , hiredate , TO_CHAR(hiredate,'YYYY-MM-DD'),
           TO_CHAR(hiredate,'RRRR-MM-DD')
FROM emp;
SELECT ename,hiredate,TO_CHAR(hiredate,'DY')
FROM emp;
-- emp 사원중에 목요일에 입사한 사원들의 이름 , 입사일 , 입사요일 
SELECT ename , hiredate, TO_CHAR(hiredate,'DY')
FROM emp
WHERE TO_CHAR(hiredate,'DY')='목';

-- 입사 요일별 , 급여 총합 , 급여 평균 
SELECT TO_CHAR(hiredate,'DY'), sum(sal),avg(sal)
FROM emp
GROUP BY TO_CHAR(hiredate,'DY');

-- 숫자 포맷 
SELECT ename , TO_CHAR(hiredate,'YYYY"년도" MM"월" dd"일"'),
           TO_CHAR(sal,'$999,999')
FROM emp;
SELECT ename , TO_CHAR(hiredate,'YYYY"년도" MM"월" dd"일"'),
           TO_CHAR(sal,'L999,999')
FROM emp;

-- 날짜 변환 
SELECT TO_DATE('22/01/05','YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
-- 숫자변환 
-- 자동 형변환 
SELECT '100'+'200'
FROM DUAL;
-- 강제 형변환 => 속도가 빠르다 
SELECT TO_NUMBER('100')+TO_NUMBER('200')
FROM DUAL; 
/*
                      TO_CHAR  =>            TO_DATE =>
       숫자형    =========   문자형  ========  날짜형
                    <=    TO_NUMBER      <=   TO_CHAR
       댓글 => 시간 출력 , 공지 사항 => 시간 출력 (TO_CHAR)
*/
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

/*
      기타 함수 
       *****1) NVL : 저장된 데이터가 NULL인 경우에 다른 값을 대체해서 사용 
       *****2) ROWNUM : 데이터가 저장이 되면 자동으로 row에 대한 번호
                            데이터를 잘라올때 (인기순위 5개)  => 페이지 나누는 경우
             3) DECODE : switch~case
             4) CASE : 다중 if문                

*/
SELECT ename,sal,hiredate,rownum
FROM emp
WHERE rownum<=5;

-- NVL 
-- 사원들의 급여를 출력 (급여+성과급) => 성과급은 NULL(연산처리가 안된다)
SELECT ename, sal,NVL(comm,0),sal+NVL(comm,0)
FROM emp;

SELECT ename, sal,NVL(comm,0),sal+comm
FROM emp;
-- DECODE : SWITCH ~ CASE
SELECT ename, deptno,DECODE(deptno,10,'영업부',
                                                         20,'개발부',
                                                         30,'총무부',
                                                         40,'신입') dname
FROM emp;
-- CASE : 다중 조건문
SELECT ename, deptno, CASE
                                  WHEN deptno=10 THEN '영업부'
                                  WHEN deptno=20 THEN '개발부'
                                  WHEN deptno=30 THEN '총무부' 
                                  END as dname
FROM emp;

                                     











