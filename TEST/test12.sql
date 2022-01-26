-- 2022-01-06 오라클 함수 (단일행 함수 , 집합함수)
-- 집합함수 , GROUP BY , HAVING , JOIN , SUBQUERY 
/*
             결과값을 브라우저로 전송  실행 결과 전송 
     브라우저 ======== 자바  ========= 오라클 
                     요청                  SQL문장 전송  
     ================================> 통합 (스프링)
     = 오라클 => 데이터형 (문자 (CHAR,VARCHAR2,CLOB), 숫자 (NUMBER) ,
                       날짜 (DATE))
     단일행 함수 
       문자 관련 함수
          = 문자의 갯수 : LENGTH(문자|컬럼)  => 화면 출력 (HTML) 
          = 문자를 제어(자르기) : SUBSTR(문자열,시작위치(숫자),갯수) 
                                          INSTR(문자열 , 찾는 문자 , 시작위치 , 몇번째 위치)
          INSTR('Hello Oracle','l' ,1 , 3) => 3번째에 있는 l을 찾는다 
          = RPAD : ID찾기 , 비밀번호 찾기 (이메일 => 자바(JavaMail))
                        ===== ho** (보안)
          = 오라클에서 처리 , 자바에서 처리 
             => 사용자 ==> 요청 ==> 자바 == SQL문장을 만들어서 오라클로 전송 
                                               =====                               =====
                                               웹프로그래머 => 자바에서 처리 
                                               DBA => 오라클에서 처리 
       숫자 관련 함수
          = ROUND() 반올림 => 통계 , 추천 (평점)
          = TRUNC() 버림 
          = CEIL() => 총페이지 구하기 
       날짜 관련 함수 
          = SYSDATE : 시스템의 시간,날짜 => 사용자가 입력하지 않고 자체 처리
                            사용자가 날짜 선택 (호텔 예약, 영화 예매...)
          = MONTHS_BETWEEN : 이전 ~ 지금까지의 개월수를 계산 
                                           호봉 , 년차 , 퇴직금 
                                           => 실무는 관리프로그램 (추천)
       변환 관련 함수 
         = TO_CHAR : 날짜나 숫자를 문자열로 변환 ==> 자바에서는 String
                            => 패턴 
                                 날짜 패턴 
                                    YYYY(RRRR) : 년도  => 2자리 (YY,RR)
                                    MM : 월 
                                    DD  : 일 
                                    DY  :  요일 
                                    HH/HH24 : 시간 (공지사항 , 댓글,블로그)
                                    MI : 분 
                                    SS : 초
                                 숫자 패턴 
                                    999,999 => ,출력 
                                    L999,999
                                    $999,999

       기타 함수 : 
           = NVL : NULL인 경우에 다른 값으로 대체해서 사용 (많이 등장)
     집합함수(집계함수) : 단일행 함수,컬럼명을 동시에 사용이 불가능 
           SELECT SUM(sal) ,ename  ==> 사용 ==> GROUP BY 
           FROM emp; (X)
           ==> 테이블 전체를 대상으로 계산 (집계)
           = COUNT : 갯수 출력 (인원수 , 예매인원...)
                           로그인 , 아이디중복체크 , 검색 결과 확인 
                           목록 출력 (갯수=> 페이지)
               = COUNT(컬럼명) => 컬럼값중에 NULL이 있는 경우는 제외 
               = ***COUNT(*) => NULL을 포함해서 결과값
           = MAX : 최대값 (emp에 등록된 사원의 가장 많이 받는 급여) 
                        => 자동증가번호 (MAX+1) => ROW마다 구분 
           = MIN : 최소값 
           = SUM : 합(총합) ==> 구매 (총금액)
           = AVG : 평균 
            
     사용자 정의 함수 (직접 제작 => PL/SQL) , JDBC (자바연동) => 5장 
           ***SELECT *  | column1,column2...
           ***FROM table_name
           [
                ***WHERE 조건문 : 연산자 
                =============================
                GROUP BY  그룹별로 나눠서 처리 (분기...)
                HAVING 그룹별 조건 
                =============================
                ***ORDER BY : 정렬해서 출력 
           ] 
*/
-- 14
SELECT COUNT(*) FROM emp;
-- 13
SELECT COUNT(mgr) FROM emp;
-- 4
SELECT COUNT(comm) FROM emp;
/*
     JOIN: 테이블 여러개를 합쳐서 화면에 출력할 데이터 추출 
     SubQuery : SQL문장 여러개를 합쳐서 한번에 가능 
     157page => 집계함수 , GROUP BY 
                      =======
                         ***1. COUNT 
                         2. ***MAX,MIN 
                         3. SUM,AVG 
                         ***4. RANK   ==> ROLLUP , CUBE
     = DDL (테이블 생성 => 제약조건) 
     = DML (INSERT , UPDATE, DELETE) 
     = 테이블이 여러개 일때 => 연관관계 (데이터베이스 모델링) => 프로젝트
     ====================== 웹 사이트 개발 ==============
     HTML / CSS / JavaScript  ==> JSP (HTML+Java) ==> MVC ==> Spring 
                                               ============================
                                                       자바 + 오라클 응용 
     JavaScript : Jquery,Ajax ,VueJs , ReactJS 
     오라클 연결 : MyBatis (XML) 
     AI : 챗봇 
     =====> 배포 (AWS) (리눅스 기반) => 우분투 (XWindow)

    COUNT(컬럼명)
     예) COUNT(deptno) => 14 (10,20,30)
    COUNT(컬럼명 => 중복이 없는 데이터 갯수)
     예) COUNT(DISTINCT deptno) => 3
    ======== 컬럼명 (NULL을 제외)
    전체 갯수 
    COUNT(*) ==> 등록되어 있는 Row의 갯수 (사원수) 
                          NULL값을 포함해서 가지고 온다 
     
*/
-- emp에 등록된 모든 사원의 수를 출력 
SELECT COUNT(*) "총사원수" 
FROM emp;
-- emp에 등록된 10번 부서에서 근무하는 사원수
SELECT COUNT(*) "10번부서" 
FROM emp
WHERE deptno=10;
-- emp에 등록된 20번 부서에서 근무하는 사원수
SELECT COUNT(*) "20번부서" 
FROM emp
WHERE deptno=20;
-- emp에 등록된 30번 부서에서 근무하는 사원수
SELECT COUNT(*) "30번부서" 
FROM emp
WHERE deptno=30;
-- emp에 등록된 부서는 몇개 있는지 확인 ==> 중복을 제거 
SELECT COUNT(DISTINCT deptno)
FROM emp;
/*
     MAX => 최대값 (급여의 최대값을 받는 사람) , 사원 등록 => 사번이 달라야 하기 때문에
                                                                    MAX(empno)+1 (*******)
     MIN  => 최소값 
*/
SELECT TO_CHAR(MAX(sal),'$999,999') "최대급여" , 
           TO_CHAR(MIN(sal),'$999,999') "최소급여"
FROM emp;

/*
     SUM(컬럼명) : 총합  
     AVG(컬럼명) : 평균 ==> ROUND() 
*/
SELECT SUM(sal) "급여총합", AVG(sal) "급여평균"
FROM emp;
-- 사용자가 보기 편하게 만든다 (모든 프로그램 => 한번도 사용자를 중심으로)
-- 사용법이 쉽게 
SELECT TO_CHAR(SUM(sal),'$999,999') "급여총합", 
           ROUND(AVG(sal),0) "급여평균"
FROM emp;
-- 2073
-- emp사원중에 평균 급여보다 적게 받는 사원의 모든 정보를 출력 
set linesize 300
SELECT *
FROM emp
WHERE sal<2073;
/*
     분석함수 => ROW단위로 처리 => 일반 컬럼과 동시에 사용이 가능 
     RANK() => 순위 출력 
     DENSE_RANK() => 순위 출력

     RANK()
     98  => 1
     95  => 2
     95  => 2
     78  => 4
     60  => 5

     DENSE_RANK()
     98  => 1
     95  => 2
     95  => 2
     78  => 3
     60  => 4

    ==> 형식 (인기 게시물 , 인기 상품 , 인기 영화) ==> hit(사용자 방문)
    RANK() OVER(ORDER BY 컬럼|함수 ASC|DESC)
    DENSE_RANK() OVER(ORDER BY 컬럼|함수 ASC|DESC)                  
*/
-- 급여를 많이 받는 순서로 랭킹을 출력한다  ORDER BY sal DESC
SELECT ename,sal , RANK() OVER(ORDER BY sal DESC) "rank"
FROM emp;

SELECT ename,sal , DENSE_RANK() OVER(ORDER BY sal DESC) "rank"
FROM emp;
-- 159page => 집계함수의 종류 
SELECT COUNT(*) "사원수",
           TO_CHAR(MAX(sal),'$999,999') "최대급여",
           TO_CHAR(MIN(sal),'$999,999') "최소급여",
           TO_CHAR(SUM(sal),'$999,999') "급여총합",
           ROUND(AVG(sal),0) "급여평균"
FROM emp;
-- WHERE ,SELECT => 함수 ==> 실제 필요한 데이터를 추출 (오라클 => SELECT)





