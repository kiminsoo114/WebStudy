-- 2022-01-03 => SQL (***********)
/*
    142page
    오라클에서 사용되는 명령문 
     SQL
       = DML(데이터 조작언어)
          = SELECT (데이터 검색) => 명령문 순서 , JOIN , SubQuery 
                                                ======== 내장 함수 , 연산자 확인 
          = INSERT (데이터 추가)
          = UPDATE (데이터 수정)
          = DELETE (데이터 삭제)
       = DDL(데이터 정의언어) ==> 제약조건 (원하는 데이터만 저장이 가능)
                                                기본키 , 참조키 ,대체키 
          = CREATE : 생성 (테이블,뷰,시퀀스...)
          = DROP : 삭제
          = ALTER : 수정 ( 컬럼 추가,수정,삭제) => ADD , MODIFY , DROP
          = TRUNCATE : 데이터 잘라내기
          = RENAME : 테이블명,컬럼명 변경
       = DCL (권한 부여) ==> View ,Trigger , Tablespace(저장공간 크기) , 파티션테이블 
          ==> system , sys , sysdba => 권한 부여 
          ==> 일반 사용자 , 프로그래머 => 사용자 사용 (hr...)
          = GRANT : 권한부여
          = REVOKE : 권한 해제
       = TCL ==> 반드시 (INSERT,UPDATE,DELETE => COMMIT을 전송해야 정상 저장)
                       자바 => AutoCommit()
          = COMMIT : 정상 수행 => 저장 
          = ROLLBACK : 비정상 수행 => 명령어 취소 

      *** 오라클은 대소문자 구분을 하지 않는다 (SELECT , Select,select)
           => 대소문자 구분을 한는 것이 한가지 있다 (저장된 데이터)
           => 오라클 개발자의 약속 : 키워드는 대문자를 사용한다 
           => 자바에서 오라클 연결 => 문자열을 사용하기 때문에 컴파일상의 에러는 
                 거의 없다 .. 오라클에서 실행하는 과정에서 에러가 많이 발생 
                 자바        =================  오라클 
                  int no=10;
                  String name=""
                  String sex=""
                  String addr=""
                  String tel=""
                  int age=20;
                  String sql="INSERT INTO member VALUES("+no+",'"+name
                                   +"','"+sex+"','"+addr+"','"+tel+"',"+age+")";

                  사용자 : 사용만 한다 
                     |
                  웹프로그래머 : 사용자 요청(검색) => 해당되는 SQL
                    |
                  데이터베이스 관리자 : 테이블 생성 => 데이터 수집 
      1) SELECT : 데이터 검색 
          = 형식)
                     = 주로 사용처 : 테이블 대신 사용 (인라인뷰 : 페이징기법)
                                          컬럼명 대신 사용 (스칼라 서브쿼리)
                     = 검색된 데이터 가지고 올때 
                        전체 (ROW)  ========>  SELECT *
                        원하는 컬럼만 읽는 경우 ==> SELECT name,sex,age...
                     ***1. SELECT * | column1,column2...
                     ***2. FROM 테이블명|View명|(SELECT ~~)  ==> 필수
                     [
                          *** 3. WHERE 조건절 (연산자) => 필요한 데이터만 읽어 오는 경우
                           4. GROUP BY 그룹컬럼명 (부서, 입사연도별 , 직위...)
                           5. HAVING 조건절 (무조건 GROUP BY가 있는 경우에만 사용 가능)
                           ====== 그룹 조건 
                          *** 6. ORDER BY 정렬할 컬럼명 (정렬) =>  ASC(올림차순)|DESC(내림차순)
                     ] ==> 145page

                    1, 2 필수
                    3,6(Index를 배우면 사라진다) 

                    emp / dept 
                    emp 테이블  => 사원 정보
                       column명 (한명에 대한 정보)
                          empno : 사번 (중복이 없는 데이터)
                          ename : 사원이름 
                          job : 직위 
                          mgr : 사수번호 
                          hiredate  : 입사일 
                          sal  : 급여 
                          comm : 성과급
                          deptno : 부서번호
                      => 총 인원수 : 14명  
                    dept 테이블  => 부서 정보    
*/
-- 144page
-- 1. 확인 : 테이블 (컬럼명 확인, 데이터형) => DESC emp;
-- emp에 저장되는 모든 사원 정보를 출력한다(전체 사원 검색) => 셀렉션 
-- SELECT * FROM emp;
-- emp에서 사원의 이름만 출력한다 => 프로젝션 
-- SELECT ename FROM emp;
-- DESC emp;
-- emp에서 사원이름,입사일 , 급여,성과급을 출력 한다 
-- SELECT ename,hiredate,sal,comm 
-- FROM emp;
/*
     SELECT를 사용시의 옵션 
       = DISTINCT => 중복을 제거한 데이터 출력 (장르,직위,부서) 
       = AS => 별칭  
                   empno as 사번 , ename as 이름 , hiredate as 입사일  => 컬럼명 변경
                   empno "사번" , ename "이름" , hiredate "입사일"
       = ||  => 문자열 결합 (자바 : +) ==> 연산자 (|| => OR)
       = & => Scanner (입력을 받는 경우에 사용)

       문법 사항 
       SELECT hiredate
       FROM emp (O)

       SELECT hiredate 
       FROM em
       p(X)  

       문장이 종료시에는 반드시 ;을 사용한다 

       SELECT hiredate ==> 출력할 컬럼 나열 
       FROM emp;       ==> 어디에 저장된 데이터(테이블)인지 확인 
       WHERE 조건      ==> 지정된 조건문 수행 (if)
       ORDER BY 컬럼명 ==> 정렬(ASC) (ASC생략이 가능,DESC는 생략리 불가능)
*/
/*
-- 사원의 직위만를 출력(직위의 종류)
-- 145page 
SELECT job
FROM emp; 
-- 직위의 중복을 제거한후 데이터 출력 
SELECT DISTINCT job
FROM emp;
-- 부서(deptno)가 몇개 있는지 확인 
SELECT deptno as 부서번호
FROM emp;
-- 별칭 사용
SELECT DISTINCT deptno as 부서번호 
FROM emp;
-- 별칭 사용
SELECT DISTINCT deptno "부서번호" 
FROM emp;
-- 문자열 결합 ||
SELECT ename||'님의 직위는 '||job||'입니다'
FROM emp;
-- DISTINCT 는 한개를 출력할 경우에만 사용 (컬럼)
SELECT empno "사번" , ename "사원명" , job "직책" , mgr "사수번호",
           hiredate "입사일" , sal "급여" , comm "성과급",deptno "부서번호"
FROM emp;
*/
-- 원하는 데이터(조건에 맞는)만 추출 => WHERE => 자바(if)
-- WHERE 컬럼명 연산자 값 => true 출력 , false면 출력을 안한다 
/*
     SELECT * | 컬럼명1....
     FROM 테이블명 
     WHERE 조건 

    조건이 true일경우에만 데이터를 출력을 한다 
    149page ~ 156page 
    1. 오라클에서 지원하는 연산자 
        = 산술연산자 ( + , - , * , / ) ==> select뒤에 출력 
                           /는 0으로 나눌 수 없다 
                          /는 정수/정수=실수  ==> 5/2 (자바:2,오라클:2.5)
                          정수,실수를 나눠서 처리 => 숫자로 표시 
                          +는 순수하게 산술로만 사용한다 (자바 : + 문자열)
        = 비교연산자 ( = , !=(<>,^=) , < , > , <= ,>=) 
                            === 같다  

        = 논리연산자 ( AND , OR , NOT )
                             && , || , ! (자바용)
                             ----  ---
                              입력을 받는 경우 , 문자열 결합 (이미 사용중이 기호)

        = 대입연산자 (=)
          *** =를 WHERE문장 뒤에서 사용 = 같다
               WHERE외에 사용하면 = 대입 (UPDATE)
               UPDATE table명 SET
               name='홍길동'
                     ==== 대입
               WHERE id='hong'
                           ==== 같다(비교)
         = 오라클에서 사용하는 연산자 
            1. IN ==> OR를 대체하는 연산자 
               예) 부서번호가 10 이거나 20 이거나 30인 부서에서 근무하는
                    ================================= 조건 
                    모든 사원의 모든 정보를 출력 
                    ======    ====== *

                    SELECT *
                    FROM emp
                    WHERE deptno=10 OR deptno=20 OR deptno=30;

                    SELECT *
                    FROM emp
                    WHERE deptno IN(10,20,30);
            2. NULL(연산처리가 안된다)  
                값이 NULL일경우 : IS NULL
                값이 NULL이 아닐 경우 : IS NOT NULL
                예) 성과급이 없는 사원의 모든 정보 
                SELECT *
                FROM emp
                WHERE comm IS NULL
               
                SELECT *
                FROM emp
                WHERE comm IS NOT NULL
            3. LIKE : 유사문자열 (포함,시작,끝) ==> 검색
                                      contains , startsWith , endsWith 
                시작문자열 : A로 시작하는 데이터를 가지고 온다
                                 'A%'  (""인용부호로 사용)
                WHERE ename LIKE 'A%'
                끝 문자열 : A로 끝나는 데이터를 가지고 온다
                                 '%A'
                WHERE ename LIKE '%A'
                *** % (문자열 글자와는 상관없다)
                     _  (문자 1개)    LIKE '__A__'   => 5글자 A가 3번위치 
                포함 문자열 : A를 포함하고 있는 데이터를 가지고 온다 
                                 '%A%'
                WHERE ename LIKE '%A%'
                _ ==> 총 이름의 갯수 => 5개인데 4번 위치에 T를 가지고 있는 사원의 정보
                WHERE ename LIKE '___T_'

               *****문법 사항****************************************************
                  오라클에서 사용한 데이터 
                  1. 숫자 ==> 그냥 사용  100 , 10.5
                  2. 문자/문자열 ==> '문자/문자열' (자바:문자=>'',문자열=>"")
                  3. 날짜 ==> '' ==> format형식 : YY/MM/DD 
                                             '22/01/03'
                  *******
                      WHERE ename='KING'  => 모든 비교연산자 사용이 가능 
                      WHERE ename<'KING'  
                      WHERE hiredate < '21/08/01'  => ~ 21/07/31
               *******************************************************************

            4. BETWEEN ~ AND : 체크인~체크아웃 , 기간,범위 ,페이징 
               ============    (=> AND <=)
               1~10
               WHERE no BETWEEN 1 AND 10 
               WHERE no>=1 AND no<=10   ===> 10을 포함하고 있다 


           *** 산술연산자 ( + , - , * , / ) => SELECT 

          성적 데이터 
          ========
            이름 국어 영어 수학 총점 평균 등수 
            ============  
                                국어+영어+수학 , (국어+영어+수학)/3 , RANK()
            => 가상 컬럼을 이용 , 뷰를 이용한다 

         *** 비교연산자 ( = (같다) , !=(<>) 같지 않다 , < (작다) , > (크다) , 
                               <= (작거나 같다) , >= (크거나 같다)) => true/false
         1==1
*/
/*-- emp(사원의 정보)에 급여와 연봉을 출력 
SELECT sal "급여" , sal*12 "연봉" 
FROM emp;
-- 연산처리 => DUAL테이블을 이용한다 
SELECT 5/2 FROM DUAL; 
*/
SELECT "***** 1<2 조건 ****" FROM DUAL; 
SELECT * 
FROM emp
WHERE 1<2;

SELECT "***** 1<=2 조건 ****" FROM DUAL; 
SELECT * 
FROM emp
WHERE 1<=2;

SELECT "***** 1>2 조건 ****" FROM DUAL; 
SELECT * 
FROM emp
WHERE 1>2;

SELECT "***** 1>=2 조건 ****" FROM DUAL; 
SELECT * 
FROM emp
WHERE 1>=2;

SELECT "***** 1<>2 조건(1과 2는 같지 않다) ****" FROM DUAL; 
SELECT * 
FROM emp
WHERE 1<>2;

SELECT "***** 1!=2 조건(1과 2는 같지 않다) ****" FROM DUAL; 
SELECT * 
FROM emp
WHERE 1!=2;

SELECT "***** 1^=2 조건(1과 2는 같지 않다) ****" FROM DUAL; 
SELECT * 
FROM emp
WHERE 1^=2;

SELECT "***** 1^=2 조건(1과 2는 같지 않다) ****" FROM emp; 

-- 오라클은 비절차적 언어 
/*
    절차적 언어 => 순서되로 출력 => 중간에 에러 발생시 종료
    비절차적 언어 => 순서로 출력 => 중간에 에러 발생시 건너 뛰고 다음 문장 수행

    SQL문장 (O) 입고 
    SQL문장 => 에러 (X) 재고
    SQL문장 (O) 출고
    SQL문장 => 에러 (X) 재고
    SQL문장 (O) 출력 
*/
  















