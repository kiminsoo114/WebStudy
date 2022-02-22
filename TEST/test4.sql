-- 2022-01-04 오라클 연산자 (논리연산자 : OR,AND)
-- 오라클에서 지원하는 연산자 (IN,LIKE,BTEWEEN,NULL,NOT)
/*
      비교연산자 : = (한개의 정보 : 상세보기)
                       = 회원 탈퇴, 회원 수정 
*/
/*
       논리연산자 (AND (직렬), OR(병렬))
       (조건) AND (조건) => 기간이나 범위 포함 
       =================
         true  true   ===> true
       =================
         true  false  ===> false
       =================
         false true   ===> false
       =================
         false false  ===> false
       =================
     
       (조건) OR (조건) => 기간이나 범위 미포함 
       =================
         true  true   ===> true
       =================
         true  false  ===> true
       =================
         false true   ===> true
       =================
         false false  ===> false
       =================
*/

-- AND : 포함 
-- emp에서 사원중에 급여가 1500이상 3000이하인 사원의 모든 정보(*)
SELECT *
FROM emp
WHERE sal>=1500 AND sal<=3000;
-- BETWEEN ~ AND
-- emp에서 사원중에 급여가 1500이하거나 3000이상 사원의 모든 정보(*)
SELECT *
FROM emp
WHERE sal<=1500 OR sal>=3000;
-- IN
-- 사원중에 1982년에 입사한 사원의 모든 정보를 가지고 온다 
SELECT *
FROM emp
WHERE hiredate>='82/01/01' AND hiredate<='82/12/31';
/*
SELECT *
FROM emp
WHERE hiredate LIKE '82%';

SELECT *
FROM emp
WHERE substr(hiredate,1,2)=82;

SELECT *
FROM emp
WHERE hiredate BETWEEN '82/01/01' AND '82/12/31';
*/

-- 사원중에 급여가 3000이고 이름 SCOTT인 사원의 모든 정보 출력 
SELECT *
FROM emp
WHERE sal=3000 AND ename='SCOTT';
-- ID , 오늘 날짜 구매 내용  ==> AND ==> 구매 내역 확인 
-- 쿠키 id , 오늘 날짜 

-- IN 연산자 (포함된 경우)
-- 사용법 : WHERE 컬럼 IN(데이터값...) => 컬럼안에 IN에 설정된 데이터가 있는 경우 출력 
-- OR가 많은 경우에 대체 
-- KING , SCOTT , CLARK => 정보 확인 => OR 
SELECT *
FROM emp
WHERE ename='KING' OR ename='SCOTT' OR ename='CLARK'; 

-- IN연산자 
SELECT *
FROM emp
WHERE ename IN('KING','SCOTT','CLARK');

-- 부서번호가 10,20,30에 있는 모든 사원 정보를 가지고 온다 
SELECT *
FROM emp
WHERE deptno=10 OR deptno=20 OR deptno=30;

SELECT *
FROM emp
WHERE deptno IN(10,20,30);

-- 체크박스 (조건 검색이 많은 경우) => 잡 포털 
-- LIKE => 검색 
/*
      % : 문자 갯수와 상관 없다
      _  : 문자 1개  
           _____
      1. 시작 문자열 ==> AB% => AB로 시작하는 모든 문자열을 읽어 온다 
      2. 끝나는 문자열 ===> %T => T로 끝나는 모든 문자열을 읽어 온다 
      ***3. 포함하는 문자열  ==> %AB% AB가 포함된 모든 문자열을 읽어 온다 
      4. 글자의 갯수 ===> _A___  => 총 글자수가 5글자인데 두번문자가 A인 찾는다
      5. 글자가 5글자인 데이터 읽는다 => '_____' 

      형식)
       WHERE ename(컬럼) LIKE '%T%'  => T가 포함되어 있는 모든 이름을 읽는다 
       ==> 쉽게 찾는 방법 : REGEXP_LIKE()

      SELECT : 데이터 검색 (전체 , 부분, 찾는 부분) => 해당 데이터를 읽어 오는 명령문
      ======
         1. SELECT의 형식 (순서)
         ***2. 조건 처리 => 연산자 
         3. 함수 (원하는 형태로 데이터를 읽기 위해서)
         4. JOIN (여러개의 테이블에서 관련된 데이터를 한번에 읽어 온다)
            => 정규화 
            => 테이블 여러개를 묶어서 사용
         5. SubQuery 
            => SQL문장을 여러개 묶어서 한번에 실행이 가능 
*/

-- LIKE 1. 시작하는 문자열을 가지고 온다 (서제스트:자동 완성기) => 문자%
-- emp 이름중에 A자로 시작하는 모든 사원의 정보를 가지고 온다 
SELECT *
FROM emp
WHERE ename LIKE 'A%';

-- emp 이름중에 SC로 시작하는 모든 사원의 정보를 가지고 온다 
SELECT *
FROM emp
WHERE ename LIKE 'SC%';

-- LIKE 2. 끝나는 문자열을 찾는 역할  => %문자
-- emp 이름중에 T자로 끝나는 사원의 모든 정보를 가지고 온다 
SELECT *
FROM emp
WHERE ename LIKE '%T';
-- ER / N로 끝나는 이름의 사원 정보 가지고 온다 
SELECT *
FROM emp
WHERE ename LIKE '%ER' OR ename LIKE '%N';

-- 가장 많이 사용되는 LIKE ==> 포함 (contains())된 문자열을 읽어 올때 사용 
-- %문자열%
-- emp에서 사원이름중에 A를 포함하고 있는 사원의 모든 정보를 검색한다 
SELECT *
FROM emp
WHERE ename LIKE '%A%';

-- emp에서 사원이름중에 EN , IN이 포함된 이름의 사원 정보를 읽어 온다 
SELECT *
FROM emp
WHERE ename LIKE '%EN%' OR ename LIKE '%IN%';
-- 게시판 찾기 , 이메일 찾기 , 카페 찾기 ,영화 ,음악 ....
-- books에서 사용자가 검색한 단어가 포함된 제목을 가지고 온다 
/*
SELECT title
FROM books 
WHERE title LIKE '%생활%';
*/
-- 글자수를 알고 있는 상태 검색 ==> _
-- emp에서 이름의 글자수가 5개인 사원의 정보를 읽어온다 
SELECT *
FROM emp
WHERE ename LIKE '_____';

-- 글자수가 5글자인데 J로 시작하는 사원의 정보를 읽어 온다 
-- J____  , J%
SELECT *
FROM emp
WHERE ename LIKE 'J____';

-- 글자수는 알수 없고 두번째 문자가 A인 사원의 정보를 가지고 온다 
SELECT *
FROM emp
WHERE ename LIKE '_A%';  
-- 이름중에 A와 K가 포함된 사원이름의 정보 읽기
-- 형태소분석 => 강남에 있는 맛집을 추천해 주세요 => AI
SELECT *
FROM emp
WHERE ename LIKE '%A%K%';
-- %AK%  => 
SELECT *
FROM emp
WHERE ename LIKE '%AK%';
-- IN , LIKE , BETWEEN ~ AND 
-- NOT 연산자 부정 ==> 151page 
-- 직위가 MANAGER , CLERK인 사원의 모든 정보를 출력 
SELECT *
FROM emp
WHERE job IN('MANAGER','CLERK');

-- 직위가 MANAGER , CLERK 아닌  사원의 모든 정보를 출력 
SELECT *
FROM emp
WHERE job NOT IN('MANAGER','CLERK');


SELECT *
FROM emp
WHERE job='MANAGER' OR job='CLERK';

SELECT *
FROM emp
WHERE NOT (job='MANAGER' OR job='CLERK');

-- NOT LIKE 
-- 이름 중에 A를 포함하고 있지 않는 사원의 모든 정보 
SELECT *
FROM emp
WHERE ename NOT LIKE '%A%';
-- NOT BETWEEN AND  ==> 기간 , 범위   =>  >= AND <=
-- 사원중에 급여(sal)가 1500이상이고 3000이하인 사원의 모든 정보 읽기
-- 1. 비교연산자 
SELECT *
FROM emp
WHERE sal>=1500 AND sal<=3000;
-- 2. BETWEEN ~ AND 
SELECT *
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

SELECT *
FROM emp
WHERE sal NOT BETWEEN 1500 AND 3000;

-- 예약 가능한 날 , 체크인 , 페이지나누기 
-- NULL : 값이 존재하지 않는다 (연산처리가 안된다) 
-- IS NULL (NULL값인 경우에 처리), IS NOT NULL(NULL값이 아닌것을 읽기)
-- 사수가 없는 사원의 모든 정보 
SELECT *
FROM emp
WHERE mgr IS NULL;
-- 성과급(comm)이 없는 사원의 모든 출력  comm=null (=> null)
SELECT *
FROM emp
WHERE comm IS NULL OR comm=0;
-- 성과급을 받는 사원의 정보 출력  comm!=null (=> null)
SELECT *
FROM emp
WHERE comm IS NOT NULL AND comm<>0;

-- 사원의 급여계산 => 성과급 포함 => 총급여 
-- sal+comm
SELECT ename , sal , comm, sal+NVL(comm,0) "총급여"
FROM emp;















