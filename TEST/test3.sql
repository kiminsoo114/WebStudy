-- 2022-01-04 오라클 2일차 (조건에 맞는 데이터 추출 => WHERE (if))
/*
     SELECT의 형식
 
     SELECT 컬럼명...| *
     FROM 테이블명 (뷰명 , SELECT ~~)  => 뷰 , 인라인뷰 

    1.  WHERE   ===> 조건에 맞는 데이터만 추출 
         => true일때 실행 
         WHERE 조건문 ==> 연산자 
    2.  GROUP BY
    2.  HAVING
    3.  ORDER BY
    ====================================
     두개이상의 테이블에서 원하는 데이터 추출 
     ============ JOIN , SubQuery 
     사용법 : 조건 , 정렬 
     SELECT 
     FROM 
     WHERE 
     ORDER BY

     사용법 : 그룹 , 그룹 조건 
     SELECT
     FROM 
     GROUP BY
     HAVING 

    ==> 3장 ~
    1) WHERE 문장의 형식 
        SELECT
        FROM
        WHERE  컬럼명(함수) 연산자 값
                    =============== true => 실행 , false => 점프
        = 오라클 연산자 (149page) 
        1. 산술연산자 :  +  , -  , *  , /
                              + : 순수하게 산술연산만 가능 (문자열(X) => ||)
                              / : 0으로 나눌 수 없다 , 정수/정수=실수 
                              => 주로 SELECT 컬럼을 연산시에 주로 사용 
                              kor , eng ,math 
                              SELECT kor+eng+math , (kor+eng+math)/3
                               총합 , 평균 , 년차 ....
        ==============================================
                  => 결과값은 true/false => WHERE에서 조건을 설정 주로 사용
                  => 숫자만 비교하는 것이 아니고 문자열 , 날짜까지 연산처리 가능 
                  => name>'King' , day>'22/01/04'
                  => 문자열 , 문자 , 날짜는 반드시 ''을 사용한다 
                  => 현재 설정되어 있는 날짜 형식 => 'YY/MM/DD'
        2. 비교연산자 : = (같다) 
                             != , <> , ^=  (같지 않다)
                             != : 프로그래머 
                             <> : 오라클 개발자 (DBA)
                             ===> 데이터베이스 설계 , PL/SQL
                             < : 작다 
                             > : 크다 
                             <= : 작거나 같다  ==>    < OR =
                             >= : 크거나 같다  ==>    > OR =

        3. 논리연산자 : OR => 범위 밖에 있는 경우 
                             AND => 범위 안에 포함된 경우 
                            (조건) OR|AND (조건)
                            OR ==> 한개이상이 true일때 => true
                            AND => 두개의 조건이 true일때 => true
        4. IN : OR가 많은 경우 주로 사용되는 연산자 
                 WHERE deptno=10 OR deptno=20 OR deptno=30 ....
                 => 권장 
                 WHERE deptno IN(10,20,30) => deptno가 10,20,30 포함하고 있다면 
        5. BETWEEN : 범위,기간을 설정 => 페이징기법 , 체크인 
                            WHERE total>=60 AND total<=100;
                            WHERE total BETWEEN 60 AND 100 
        6. LIKE : 문자열 찾기 
                    % : 문자열 (글자의 갯수를 알 수 없는 경우) 
                          자바% ,  %자바  , %자바% => 자바가 포함된 모든 문자열 
                          ====   =====  ======
                             |           | 자바로 끝나는 모든 문자열 
                          자바로 시작하는 모든 문자열 
                    _ : 한글자 (글자수를 아는 경우)
                        이름중에 4글자인 사원을 출력 : '____'
                        2번째 이름에 I =>   : '_I%' , '_I__'
                    [A-C] : A,B,C가지고 있는 데이터 출력  
                    [^A-C] : 위에와 반대효과 (^:NOT)
                    = 시작문자열   A%
                    = 끝문자열      %A
                    = 문자열 포함  %A%
                    = [0-5] : 0~5로 시작되는 문자열 
                    = [^0-5]  ^(부정)

        7. NOT  : 부정연산자 
                     NOT IN() 
                     NOT BETWEEN ~ AND ==> 예약일이 아닌 날 
                     NOT LIKE 
                     WHERE NOT (total>=60 AND total<=100)
        8. NULL : 
               ** NULL은 어떤 데이터도 없는 상태 => 연산처리를 할 수 없다 
               10+NULL => NULL
               NULL인 경우  ============> 
                  WHERE comm=null (X) 
                  WHERE comm IS NULL
               NULL이 아닌 경우
                  WHERE comm!=null (X)
                  WHERE comm IS NOT NULL

               IS NULL => 데이터값이 NULL인 경우 처리
               IS NOT NULL => 데이터값이 NULL이 아닌 경우 처리 
        ===============================================
*/
-- 산술연산자 ==> (자바: + ,- , * , / , %)  => 오라클에서는 함수로 제공 (MOD)
-- 연산처리 , 함수 => 연습용 테이블 => DUAL (오라클에서 제공하는 연습용)
SELECT 10+20 
FROM DUAL;
-- 연산처리 => 문자열로된 숫자  '100' => 자동 형변환
-- 강제로 변환 => TO_NUMBER('100') => Integer.parseInt("100") 
SELECT '10'+'20'
FROM DUAL;
-- 정수/정수 = 실수  => 소수점이하 2자리 (반올림 : round(), 버림:trunc() , 올림:ceil())
SELECT 10/3
FROM DUAL;
-- 0으로 나눌 경우에는 오류 발생
SELECT 10/0
FROM DUAL;

SELECT 10-5
FROM DUAL;
-- 자동 형변환 => 숫자형으로 변경 
SELECT '10'-'5'
FROM DUAL;

SELECT 10*5
FROM DUAL;
-- 자동 형변환 => 숫자형으로 변경 
SELECT '10'*'5'
FROM DUAL;

-- 성적 데이터 저장소 : 테이블 
/*
CREATE TABLE student(
    name VARCHAR2(20),
    kor NUMBER(3),
    eng NUMBER(3),
    math NUMBER(3)
);
-- 데이터 추가
INSERT INTO student VALUES('홍길동',90,89,78);
INSERT INTO student VALUES('심청이',67,78,89);
INSERT INTO student VALUES('박문수',56,67,88);
INSERT INTO student VALUES('이순신',89,67,90);
INSERT INTO student VALUES('강감찬',97,95,56);
COMMIT;
*/
-- 전체 데이터를 출력한다 
/*
SELECT * 
FROM student;
-- 전체 데이터 + 총점 , 평균 => 산술연산자는 통계,평균 => 주로 SELECT 컬럼처럼 사용
SELECT name,kor,eng,math,(kor+eng+math) "total",(kor+eng+math)/3 "avg"
FROM student;
-- 전체 데이터 + 총점 , 평균 , 등수
SELECT name,kor,eng,math,(kor+eng+math) "total",(kor+eng+math)/3 "avg",
          RANK() OVER(ORDER BY (kor+eng+math) DESC) "rank"
FROM student;
*/
-- 비교연산자 (149page)
-- (=) => 찾기/상세보기  ==> 저장되어 있는 실제데이터는 대소문자를 구분 
-- <> , != 
-- emp에 있는 모든 데이터 출력 
SELECT *
FROM emp;
-- emp(사원정보) => SCOTT사원(7788)의 정보만 알고 싶다 
-- 1. 사번으로 찾는 방법(주로 사용) => 중복없는 데이터로 찾기 
SELECT *
FROM emp
WHERE empno=7788;
-- 2. 이름으로 찾기 
SELECT *
FROM emp
WHERE ename='SCOTT';
-- 영문일 경우에는 대소문자를 구분한다 
-- WHERE 컬럼명 연산자 값
--            ename    =  'SCOTT'
SELECT *
FROM emp
WHERE ename='scott';

-- (=) 같다 
-- 같지 않다 (!=,<>)
-- emp(사원정보) 사원중에 급여 3000이 아닌 사원의 모든 정보(*) 출력 
SELECT *
FROM emp
WHERE sal!=3000;

SELECT *
FROM emp
WHERE sal<>3000;

-- emp(사원정보) 사원중에 급여 3000이 아닌 사원의 이름,급여 출력 (ename,sal)
SELECT ename,sal
FROM emp
WHERE sal<>3000;

-- < (작다)
-- emp에서 사원중에 급여가 1500보다 작은 사원의 이름 , 급여 출력 
SELECT ename,sal
FROM emp
WHERE sal<1500; 
-- > (크다)
-- 사원중에 급여가 2000보다 많이 받는 사원의 이름 ,급여 ,직위 출력 
SELECT ename,sal,job
FROM emp
WHERE sal>2000;
-- <= (작거나 같다)
-- emp에서 사원중에 급여가 1500이하 작은 사원의 이름 , 급여 출력 
SELECT ename,sal
FROM emp
WHERE sal<=1500;
-- >= (크거나 같다)
-- 사원중에 급여가 2000이상 많이 받는 사원의 이름 ,급여 ,직위 출력
SELECT ename,sal,job
FROM emp
WHERE sal>=2000;
-- 논리 연산자 (AND , OR) => && (Scanner) , ||(문자열 결합)

/*
SELECT *
FROM emp
WHERE empno=&no;
*/
TRUNCATE TABLE emp; --데이터를 지운다
INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902,TO_DATE('1980-12-17', 'YYYY-MM-DD'), 800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698,TO_DATE('1981-02-20', 'YYYY-MM-DD'), 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698,TO_DATE('1981-02-22', 'YYYY-MM-DD'), 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839,TO_DATE('1981-04-02', 'YYYY-MM-DD'), 2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698,TO_DATE('1981-09-28', 'YYYY-MM-DD'), 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839,TO_DATE('1981-05-01', 'YYYY-MM-DD'), 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839,TO_DATE('1981-06-09', 'YYYY-MM-DD'), 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566,TO_DATE('1982-12-09', 'YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL,TO_DATE('1981-11-17', 'YYYY-MM-DD'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698,TO_DATE('1981-09-08', 'YYYY-MM-DD'), 1500, 0, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788,TO_DATE('1983-01-12', 'YYYY-MM-DD'), 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698,TO_DATE('1981-12-03', 'YYYY-MM-DD'), 950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566,TO_DATE('1981-12-03', 'YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782,TO_DATE('1982-01-23', 'YYYY-MM-DD'), 1300, NULL, 10);
COMMIT;
SELECT * FROM emp;












