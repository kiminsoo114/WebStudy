-- 2022-01-05 오라클 문제 풀이 
/*
SELECT => 데이터 추출 (오라클) => 구분 (컬럼)
DESC table 
        ------ 데이터가 저장 (컬럼으로 데이터 구분)
                파일 => 구분문자를 이용해서 저장 (제어가 어렵다) 
문제 1)
사원번호, 이름, 월급을 출력하시오.
SELECT empno,ename,sal 
FROM emp
________________________________________
문제 2)
이름 월급 직업 입사일을 출력하시오.
SELECT ename,sal,job,hiredate 
FROM emp
________________________________________
※ NVL 함수
값 대신에 다른 값을 출력하고 싶을때 사용하는 함수
________________________________________
문제 3)
이름, 월급, 커미션, 월급 + 커미션을 출력하시오.
NULL 값이 있는 경우에 연산처리가 안된다 (연산하기 위해서는 NULL을 대체)
SELECT ename,sal,comm,sal+NVL(comm,0) => comm이 NULL일경우에 0으로 대체
                                   ============ 
FROM emp
________________________________________
※ AS 별칭
as는 별칭을 쓸때 사용하며 생략 가능하다.
별칭을 소문자로 써도 대문자로 인식하는데, " "를 해주면 대소문자를 구분한다.
________________________________________
※더블쿼테이션 마크를 사용하는 경우
1. 컬럼 별칭에 대소문자를 구분하고자 할때
2. 컬럼 별칭에 특수문자를 넣고자 할때
________________________________________
문제 4)
사원이름과 월급을 출력하는데, 이름의 컬럼명을 employee라고 하고 월급의 컬럼명을 salary라고 하시오.
SELECT ename "employee",sal "salary"
FROM emp 

SELECT ename as employee ,sal as salary
FROM emp 
_______________________________
문제 5)
사원이름과 입사일을 출력하는데 사원이름의 컬럼명이 employee name으로 출력되게 하시오. 

SELECT ename "employee name",hiredate
FROM emp

______________________________________
문제 6)
직업을 출력하시오.
- 설명 
distinct : 중복제거 키워드
=> 
     SELECT [DISTINCT|ALL(*)]|column_list....
SELECT DISTINCT job => 단일행 사용할 수 없다(다른 컬럼을 사용하면)
FROM emp
 ________________________________________
문제 7)
부서번호를 출력하는데 중복제거해서 출력하시오.
SELECT DISTINCT deptno
FROM emp
_____________________________

문제 8)
사원번호가 7788번인 사원의 사원번호와 이름을 출력하시오.
SELECT
FROM
WHERE 컬럼명|함수 연산자 값

SELECT empno,ename
FROM emp
WHERE empno=7788; 
___________________________________
문제 9)
월급이 3000인 사원들의 이름과 월급을 출력하시오.

SELECT ename,sal
FROM emp
WHERE sal=3000
________________________________________
※ 문자 및 날자형 데이터
숫자형 데이터는 관계없지만, 
문자와 날자형 데이터는 양쪽에 싱클쿼테이션 마크를 사용해야한다.
________________________________________
 
 
※ 연산자의 종류
1. 산술 연산자 : * / + -
2. 비교 연산자 :>, <, <=, >=, =, !=, <>, ^= (같지 않음 연산자는 뒤에서부터 3개의 표현이 존재)
                                            -------------
3. 논리 연산자 : and, or, not
 
 
________________________________________
문제 10)
이름이 scott인 사원의 이름과 직업을 출력하시오. (=)
SELECT ename,job
FROM emp
WHERE ename='scott' => 출력이 안됨 

SELECT ename,job
FROM emp
WHERE ename='SCOTT'

SELECT ename,job
FROM emp
WHERE LOWER(ename)='scott'

SELECT ename,job
FROM emp
WHERE ename=UPPRE('scott')
________________________________________
문제 11)
월급이 3000 이상인 사원들의 이름과 월급을 출력하시오.

SELECT ename,sal
FROM emp
WHERE sal>=3000;
 ________________________________________
문제 12)
직업이 SALESMAN이 아닌사원들의 이름과 직업을 출력하시오.
SELECT ename,job
FROM emp
WHERE job<>'SALESMAN'

SELECT ename,job
FROM emp
WHERE job!='SALESMAN'

SELECT ename,job
FROM emp
WHERE job^='SALESMAN'

SELECT ename,job
FROM emp
WHERE NOT (job='SALESMAN')
________________________________________
문제 13)
월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하는데, 컬럼명을 Employee, Salary로 출력하시오.
SELECT ename "Employee",sal "Salary"
FROM emp
WHERE  sal BETWEEN 1000 AND 3000
-- WHERE sal>=1000 AND sal<=3000
- 설명
between A and B : A이상 B이하 사이의 데이터
 ________________________________________
 
※ order by 절
쿼리의 결과를 정렬하는 절로써 가장 마지막 순서에 위치한다.
ascending, descending (asc=오름차순, desc=내림차순)
 
________________________________________
문제 14)
사원이름과 월급을 출력하는데 월급이 낮은 사원부터 높은 사원순으로 출력하시오.
SELECT ename,sal
FROM emp
ORDER BY sal; => ASC는 생략이 가능 

SELECT ename,sal
FROM emp
ORDER BY sal ASC;

SELECT ename,sal
FROM emp
ORDER BY 2;

SELECT ename,sal
FROM emp
ORDER BY 2(컬럼의 위치 : 오라클 => 1번부터 시작) ASC;
________________________________________
문제 15)
이름과 입사일을 출력하는데 가장 최근에 입사한 사원부터 출력하시오.
SELECT ename,hiredate
FROM emp
ORDER BY hiredate DESC; 내림차순 
________________________________________
 문제 16)
직업이 SALESMAN인 사원들의 이름과 월급과 직업을 출력하는데, 
월급이 높은 사원부터 출력하시오.
SELECT ename,sal,job
FROM emp
WHERE job='SALESMAN'
ORDER BY sal DESC;
-- 낮은 순 , 오래된 순 => ASC
-- 높은 순 , 최신순 => DESC 
________________________________________
 문제 17)
월급이 1000 이상인 사원들의 이름과 월급을 출력하는데 
월급이 낮은 사원부터 높은 사원순으로 출력하시오.
SELECT ename,sal 
FROM emp
WHERE sal>=1000
ORDER BY sal ASC;    => ORDER BY 2 ASC  => ORDER BY 2
________________________________________
 
※ SQL의 내부적 실행 순서
from -> where -> select -> order by 순서로 실행된다.
order by절에서 별칭 사용 가능, where 절에서 별칭 사용 불가능
 
________________________________________
문제 18)
연봉(셀러리*12)이 36000 이상인 사원들의 이름과 연봉을 출력하고 
컬럼명의 별칭은 "연봉"으로 하시오.
SELECT ename , sal*12 "연봉"
FROM emp
WHERE sal*12>=36000

________________________________________
 


※ 기타 비교 연산자
1. between ..and
2. like
3. in
4. is null
 
________________________________________
문제 19)
월급이 1000에서 3000사이가 아닌 사원들의 이름과 월급을 출력하시오.
                                       ====
SELECT ename,sal
FROM emp
WHERE sal NOT BETWEEN 1000 AND 3000
               ====
________________________________________
 
※ 와일드 카드
%(퍼센트)는 wild card : 해당하는 자리에 무엇이 와도 관계없다는 의미.
_(언더바)는 자릿수를 의미 함 : 해당하는 자리에 무엇이 와도 관계없다는 의미.(자릿수는 언더바의갯수에 관계)
 
________________________________________
문제 20)
이름의 첫 글자가 s로 시작하는 사원들의 이름을 출력하시오.
SELECT ename
FROM emp
WHERE ename LIKE 'S%';

SELECT ename
FROM emp
WHERE SUBSTR(ename,1,1)='S';

SELECT ename
FROM emp
WHERE INSTR(ename,'S',1,1)=1;
________________________________________
문제 21)
이름의 끝 글자가 T로 끝나는 사원들의 이름을 출력하시오.
SELECT ename
FROM emp
WHERE ename LIKE '%T';
________________________________________
문제 22)
이름의 두번째 철자가 m인 사원들의 이름을 출력하시오.
 
SELECT ename
FROM emp
WHERE ename LIKE '_M%';

SELECT ename
FROM emp
WHERE SUBSTR(ename,2,1)='M';
__________________________________
문제 23)
이름의 세번째 철자가 L인 사원의 이름을 출력하시오.
SELECT ename
FROM emp
WHERE ename LIKE '__L%';
________________________________________
 
문제 26)
이름의 첫번째 철자가 S 가 아닌 사원들의 이름을 출력하시오.
SELECT ename
FROM emp
WHERE ename NOT LIKE 'S%'; 
________________________________________
문제 27)
사원 번호가 7788, 7902, 7369번인 사원들의 사원번호와 이름을 출력하시오.
SELECT empno,ename
FROM emp
WHERE empno IN(7788,7902,7369)
________________________________________
문제 28)
직업이 SALESMAN ANALYST가 아닌 사원들의 이름과 직업을 출력하시오.
SELECT ename , job
FROM emp
WHERE job NOT IN('SALESMAN','ANALYST');
________________________________________
문제 29)
커미션이 null인 사원들의 이름과 커미션을 출력하시오.
SELECT ename,comm
FROM emp
WHERE comm IS NULL;  -- comm=null (X)
________________________________________
문제 30)
커미션이 null이 아닌 사원들의 이름과 커미션을 출력하시오.
SELECT ename,comm
FROM emp
WHERE comm IS NOT NULL;

- 문제 031
월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하는데 
월급이 높은  사원부터 출력하시오
SELECT ename,sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000
ORDER BY sal DESC;
________________________________________
 
 
※ 데이터베이스 Tools
오라클 DB에 접속해서 편하게 데이터를 검색 조작하는 TOOLS : orange, toad, SQLGATE
 
 
________________________________________
 
 
- 문제 032
1981년 11월 17일에 입사한 사원들의 이름과 입사일을 출력하시오.

SELECT ename,hiredate
FROM emp
WHERE hiredate='81/11/17';

SELECT ename,hiredate
FROM emp
WHERE TO_CHAR(hiredate,'YYYY"년" MM"월" DD"일"')='1981년 11월 17일';
 
 
________________________________________
 
- 문제 033
1981년 12월 11일에 입사한 사원들의 이름과 입사일을 출력하시오.
SELECT ename,hiredate
FROM emp
WHERE TO_CHAR(hiredate,'YYYY"년" MM"월" DD"일"')='1981년 12월 11일';
 
 
 
________________________________________
- 문제 034
1981년도에 입사한 사원들의 이름과 입사일을 출력하시오.
 
SELECT ename,hiredate
FROM emp
WHERE TO_CHAR(hiredate,'YYYY')=1981;
________________________________________
 
- 문제 035
연결연산자를 이용해서 이름과 월급을 연결해서 출력하시오.
 
SELECT ename||'님의 급여는 '||sal||'입니다'
FROM emp;
________________________________________
 
 
- 문제 036
쿼리를 사용해 "SCOTT의 직업은 ANALYST 입니다."와 같은 결과를 출력하시오.
 
 SELECT ename||'님의 직업은 '||job||'입니다'
FROM emp;
________________________________________
 
 
- 문제 037
아래의 쿼리 결과를 출력하시오.
 

SELECT ename,job,sal
FROM emp
ORDER BY job ASC;
 
________________________________________
 
 
- 문제 038
직업이 SALESMAN인 사원들의 이름과 연봉을 출력하는데 연봉이 
높은 사원부터 출력하고 아래과 같이 결과를 출력하시오.
"ALLEN 의 연봉은 36000 입니다."
 
SELECT ename||'의 연봉은 '||sal*12||' 입니다'
FROM emp
WHERE job='SALESMAN'
ORDER BY sal*12 DESC;
________________________________________
 

- 문제 039
이름은 대문자로 직업은 소문자로, 이름의 첫글자를 대문자
 나머지는 소문자로 출력하시오.

SELECT UPPER(ename),LOWER(job), INITCAP(ename)
FROM emp;
 
________________________________________
 

- 문제 040
*** 오라클 명령문은 대소문자를 구분하지 않는다 
*** 오라클에 저장된 데이터들은 대소문자 구분 ...
이름이 scott인 사원의 이름과 월급을 출력하는데 where절에 
scott의 소문자로 검색해서 출력하시오.
 
SELECT ename,sal
FROM emp
WHERE ename=UPPER('scott');

SELECT ename,sal
FROM emp
WHERE LOWER(ename)='scott';

SELECT ename,sal
FROM emp
WHERE ename='scott';

*/