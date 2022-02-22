-- 2022-01-11 데이터조작어 (INSERT,UPDATE,DELETE) 
-- 조건 ==> 저장공간이 만들어져 있어야 한다 (테이블)
/*
     SAWON 
    =======
      1. 사번(sabun) => 중복없는 데이터 추가 => 중복시에 오류 발생 
         => 오류 확인 
      2. 이름(name) => 반드시 데이터가 추가 (NOT NULL)
      3. 부서명 (dept) => CHECK 이용 (지정된 부서만 입력)
      4. 근무지(loc) => CHECK
      5. 직위 (job) => CHECK 
      6. 입사일 (hiredate) => 날짜 => YY/MM/DD => format
                                                    01/02/10 => ''
      7. 급여 (pay) 
      8. 성과급 (comm) => NULL허용 
      -------------------------------------------------------------------------
      NULL 값 ==> NULL , ''
                  ==> ' ' NULL이 아니라 공백   => ''(NULL) , ' '(데이터첨부)
      SABUN                                     NOT NULL NUMBER(4)
      NAME                                      NOT NULL VARCHAR2(34)
      DEPT                                               VARCHAR2(9)
      LOC                                                VARCHAR2(2)
      JOB                                                VARCHAR2(6)
      HIREDATE                                           DATE
      PAY                                                NUMBER
      COMM                                               NUMBER
     ================ 1. 순서 , 2. 데이터형 , 3. 제약조건 
      1) INSERT 
          = 전체 데이터 추가 
             INSERT INTO table_name VALUES(값....)
                                                             ------- 컬럼 갯수와 일치 
             -------- DEFAULT가 적용되지 않는다 
          = 원하는 컬럼만 추가 (지정되지 않은 컬럼은 NULL)
            INSERT INTO table_name(컬럼1,컬럼2...) VALUES(값,값..)
                                                -----------------             --------
                                                        일치가 되어야 한다 
             -------- DEFAULT가 적용이 된다 
           *** 순서
          = INSERT ALL
             테이블을 나눠서 저장 

         CREATE TABLE emp10
         AS
          SELECT * FROM emp
          WHERE 1=2; -- false  ==> 테이블 형식만 복사 (데이터값이 없이)

         *** 문자 , 날짜는 반드시 ''을 사용해서 데이터를 첨부 
         *** 회원가입 , 장바구니 , 글쓰기 , 댓글쓰기 , 예매 : INSERT 
         *** 회원수정 , 장바구니 수정 ,글쓰기 , 예매날짜 변경 : UPDATE
         *** 회원탈퇴 , 장바구니 취소 , 예매 취소 : DELETE
         *** 나머지 : 추천 , 상세보기 ,찾기 ,목록 : SELECT 

*/
-- 테이블 복사 
/*
CREATE TABLE emp10
AS
 SELECT empno,ename,job,hiredate,sal FROM emp
 WHERE 1=2;

CREATE TABLE emp20
AS
 SELECT empno,ename,job,hiredate,sal FROM emp
 WHERE 1=2;

CREATE TABLE emp30
AS
 SELECT empno,ename,job,hiredate,sal FROM emp
 WHERE 1=2;
*/
-- 데이터 추가 (데이터를 분리해서 해당 테이블에 첨부) => 10000개레시피 (17만)
INSERT ALL
  WHEN deptno=10 THEN 
    INTO emp10(empno,ename,job,hiredate,sal) VALUES(empno,ename,job,hiredate,sal)
  WHEN deptno=20 THEN 
    INTO emp20(empno,ename,job,hiredate,sal) VALUES(empno,ename,job,hiredate,sal)
 WHEN deptno=30 THEN 
    INTO emp30(empno,ename,job,hiredate,sal) VALUES(empno,ename,job,hiredate,sal)
SELECT * FROM emp;





