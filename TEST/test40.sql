-- 2022-01-13 (오라클 => 뷰 , 시퀀스)
/*
     DML (SELECT , INSERT , UPDATE , DELETE) => 필수
             ---------- 연산자 , 내장함수 , JOIN , SubQuery
     DDL (CREATE , ALTER , DROP , TRUNCATE , RENAME)
             ---------- 오라클 데이터형 , 제약조건 
     TCL  (COMMIT , ROLLBACK) => DML을 실행시에만 적용 
     ------------------------------------------------------------------ SQL
     DCL (GRANT : 권한 부여 , REVOKE : 권한 해제) => DBA
     => VIEW , INDEX , PL/SQL (사용자 계정 : hr) => 권한이 없다 
     => SYSTEM / SYSDAB => 자동 생성
     => 고급 과정 : 뷰 (가상테이블 => 기존의 데이터를 참조 사용)
                          시퀀스 (자동 증가번호) => PRIMARY KEY가 숫자형으로 설정
                          INDEX (찾기가 빠르게 만들어 준다 , ORDER BY 대신)
                          오라클 프로그램 : PL/SQL
                          *** 자바 연동 프로그램 : JDBC 
    브라우저(HTML/CSS)  ========== 자바  ============ 오라클 
            |                                                     JDBC (SQL)       데이터가 저장 
       자바와 연결 (JSP) => JSP(HTML+JAVA) => HTML / JAVA => MVC (Spring)
                                                                                              -----------------
            | 속도가 늦다 ( Front-End , Back-End => Full Stack )
                                                                     ------------- 자바스크립트 (Jquery,Ajax,React,Vue)
                                                                     ------------- React->Redux , Vue->Vuex 
   => 235page 뷰 (읽기전용 => 보안 , SQL문장을 간단하게 만들 목적)
                                             SQL문장을 저장하고 있다가 필요시마다 재사용 
                                             ---------
        뷰의 종류  => empDept_view  
        -----------
          ------------------------------------------------
          1. 단순뷰 : 테이블를 한개를 연결해서 제어 
          2. 복합뷰 : 데이블 2개 이상 연결해서 제어
          ------------------------------------------------ 재사용 
          3. 인라인뷰 : 테이블대신 SELECT문장을 이용해서 처리하는 방식
             -------- 재사용을 하지 않는다 (저장이 되는 상태가 아니다)
          *** 자주 사용되는 SQL => SQL문장 길다(저장) => View를 생성 
               => 페이지 나누기 
          *** 한두번 사용 => 인라인뷰를 이용해서 처리 

          

          => 테이블 구조 확인  => DESC table_name
               SELECT * FROM user_tables
               WHERE table_name=''
          => 제약조건 확인 
                SELECT * FROM user_constraints
                WHERE table_name=''
          => 뷰 확인 
               SELECT text 
               FROM user_views
               WHERE view_name='EMPDEPT_VIEW';

         뷰의 형식 
           = 단순뷰 (테이블에서 필요한 데이터 추출) , 복합뷰(JOIN,SubQuery)
              CREATE [OR REPLACE] VIEW view_name
              AS
                SELECT ~~
           
           = 인라인뷰 (페이지나누기 , 인기순위 몇개 (Top-N))
               SELECT ~ 
               FROM (SELECT ~~) 

        뷰 수정 (239page) => 수정이 빈번한 경우 (유지 보수)
        CREATE OR REPLACE VIEW view
        AS
         SELECT~~

        뷰 삭제 (240page) 
        DROP VIEW view_name 

*/
-- SELECT * FROM empDept_view;
-- View안에 어떤 내용이 첨부되어 있는지 확인 
/*
      Table : user_tables 
      Constraint : user_constraints
      View : user_views
      ***** View , Table , Constraint => 오라클에서 저장시에 => 대문자로 저장 
*/
/*
SELECT text 
FROM user_views
WHERE view_name='EMPDEPT_VIEW';
*/

-- 단순뷰 (테이블 1개 연결) ==> 사용시 단점(DML) 
/*
     DML(INSERT,UPDATE,DELETE)사용이 가능=>실제로는 테이블에 사용
     => DML을 사용할 수 없게 옵션 제공 (읽기 전용)
     => WITH READ ONLY : 읽기전용
     => WITH CHECK OPTION : DML사용이 가능 
     
*/
CREATE OR REPLACE VIEW emp_view
AS
 SELECT empno,ename,job,hiredate,sal 
 FROM emp
 WITH READ ONLY;

-- 실행 (View (가상테이블 , 테이블의 일종 : JOIN,SubQuery) => 일반 테이블처럼 사용이 가능)
SELECT * FROM emp_view;
-- View에 저장된 데이터 확인
SELECT text 
FROM user_views
WHERE view_name='EMP_VIEW';

-- 복합뷰 (조인,서브쿼리) 
/*
      조인 : 여러개의 테이블에서 출력에 필요한 데이터를 모아서 읽어 오기 
               => 테이블이 정규화 => 데이터가 분산 
        INNER JOIN (EQUI_JOIN) => 연산자 (=) => NULL일 경우에 처리 불가능 
        OUTER JOIN => INNER JOIN + 알파 (NULL일경우에 처리)
              LEFT OUTER JOIN , RIGTH OUTER JOIN
      서브쿼리 : SQL문장을 여러개 합쳐서 한개의 SQL문장으로 제작 
                     (네트워크 => 전송하는 갯수를 줄여준다) 
               => WHERE절
                        => WHERE 컬럼명 연산자 (SELECT ~ ) 
                                                             -------------- 결과값 1개
                                                                    단일행 서브쿼리 
                                                                    연산자(비교연산자)
                                                             -------------- 결과값 여러개 
                                                                    다중행 서브쿼리 
                                                                    연산자(IN , NOT IN,
                                                                              ANY,ALL,SOME)
                                                                              ---------- MAX,MIN
                                                                              ---------- 비교연산자
                       => MAIN Query  <===== SubQuery
                            서브쿼리의 실행 결과값을 받아서 Main Query 실행하는 방식 
                            *** 서브쿼리가 먼저 실행이 되어야 한다 ( )를 이용한다 
                            *** ( )는 최우선 순위 연산자 
               => FROM절 : 테이블  대신 사용 => 인라인뷰 
               => SELECT절 : 컬럼 대신 사용 => 스칼라 서브쿼리 (조인 대신 사용이 가능)
               *** 연결시에 테이블이 다를 수 있다.
*/
-- JOIN을 이용하는 뷰 
CREATE OR REPLACE VIEW emp_dept_join
AS
  SELECT empno,ename,job,hiredate,sal,dname,loc 
  FROM emp,dept
  WHERE emp.deptno=dept.deptno;
-- 서브쿼리를 이용하는 뷰 
CREATE OR REPLACE VIEW emp_dept_subquery
AS 
  SELECT empno,ename,job,hiredate,sal,
             (SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
             (SELECT loc FROM dept WHERE deptno=emp.deptno) loc
  FROM emp;

-- 확인 
SELECT * FROM emp_dept_join;
SELECT * FROM emp_dept_subquery;
SELECT text 
FROM user_views
WHERE view_name='EMP_DEPT_JOIN';
SELECT text 
FROM user_views
WHERE view_name='EMP_DEPT_SUBQUERY';

-- 인라인뷰 (재사용 목적이 아니다) 
SELECT empno,ename,hiredate,sal,rownum
FROM emp
ORDER BY sal DESC;

-- rownum의 순서를 변경 => 인라인뷰 (페이지, Top-N)
SELECT empno,ename,hiredate,sal,rownum
FROM (SELECT empno,ename,hiredate,sal
           FROM emp
           ORDER BY sal DESC);













