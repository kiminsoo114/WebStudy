-- 2022-01-05 오라클 (ORDER BY) => 155page
/*
     SELECT 
     1) 형식 
     2) 연산자 (조건에 맞는 데이터만 추출)
     3) 내장 함수 (4장)
     4) GROUP BY 
     5) 집계 함수
     6) JOIN 
     7) SubQuery 
     INSERT , UPDATE , DELETE  ==> DML 
     ========================== 간단한 테이블 제작 
     DDL : 데이터베이스 저장 장소 제작 (Table,View,Index,Sequence)
     => 데이터베이스 프로그램 (PL/SQL)
     데이터베이스 설계 : 요구사항분석 
     1. 형식 => SELECT의 키워드 순서 
         =============== 필수 
          SELECT  => 추출한 컬럼명 , ALL(*)
          FROM   => 데이터가 저장의 위치 (테이블,뷰)
         =============== 옵션
          WHERE  => 필요한 데이터를 추출 => 조건 (조건문:IF)
                            *** 연산자 
          GROUP BY => 그룹별로 묶어서 그룹별 처리 
                               예) 부서별로 통계, 인원수, 평균 .... (집계 함수)
                                    count() , max() , min() , avg() , sum()
                                                ===== 자동 증가번호 
                                    ===== 로그인 , 아이디 중복체크 , 검색 , 페이지
                                    cube() , rollup()
          HAVING => GROUP BY에서 사용이 가능 (그룹에 대한 조건)
          ORDER BY => 오라클이 정렬이 된 상태가 아니다 
                               필요하면 정렬해서 데이터 읽기 
         ===============

         정리)
                  오라클에서 사용하는 연산자 => 용도 
                  산술연산자 ( + , - , * , / ) => 평균,총점 ... : SELECT 컬럼형식
                      =>  1+2 = 3   , '1'+'2' =3 (숫자형 문자열 => 자동형변환)
                             +문자열 결합을 하지 않고 실제 산술 처리만 
                      => / => 정수/정수=실수 , 0으로 나눌 수 없다 
                      => 조건으로 사용하지 않는다 (조건 : true/false)
                  ========================================
                    WHERE 문장에서 사용 (조건문 : 결과값 => true/false)
                    비교연산자 : = , <>(!=) , < , > , <= , >=
                                     *** 숫자만 비교하는 것이 아니고 
                                          문자열 , 날짜까지 비교가 가능하다 
                                          =========
                                              반드시 '' 
                    논리연산자 : AND(직렬:조건 두개가 true일때 true) , 
                                     OR(병렬: 조건 한개이상이 true일때 true) 
                                     *** && => 입력할때 사용하는 방식 
                                     *** || => 문자열 결합 
                                     *** 데이터 수집 => 이미지를 읽어올때
                                          =======
                    https://mp-seoul-image-production-s3.mangoplate.com
                     /33537_1539250987808772.jpg?fit=around|512:512
                     ^crop=512:512;*,*
                     ^output-format=jpg
                     ^output-quality=80
                     => 자바에서 저장 => replace('&',"^") => 
                    오라클에서 제공하는 연산자 
                     => NULL => NULL은 실제 데이터가 존재하지 않는 값 
                                   => NULL은 연산할 경우 결과값은 NULL
                                   => NULL일 경우 처리 ( IS NULL )
                                   => NULL이 아닐 경우 처리 ( IS NOT NULL )
                     ***=> NOT  => 부정 
                                       NOT LIKE , NOT IN , NOT BETWEEN
                     ***=> BETWEEN 1 AND 10 => 1에서 10까지(10을 포함) 
                          기간 , 범위 =>  페이지 나누기 (웹 절반이상 페이지)
                          *** 기술면접 : 게시판 , 페이지기법 
                          *** 페이지 나누는 목적 (사람 한눈에 볼수 있는 이미지 
                                                          15~20)
                     ***=> LIKE => % (문자갯수를 알 수 없는 경우), _ (한글)
                                      시작  : A% ===> 검색기 만든 경우 
                                      끝  : %A
                                      포함 : %A% ===> ****
                                      글자 갯수를 아는 상태 _____A
                     ***=> IN => OR가 많은 경우에 대체 

       정렬 => 올림차순 / 내림차순 
                   (ASC)       (DESC)
       사용 => 게시판 , 댓글 , 최신 등록된 레시피 
                   ====================== 가장 최신것을 보여준다 
                   DESC (내림차순으로 출력)
                   SELECT 추출할 컬러명
                   FROM  저장된 위치(테이블) 
                   ORDER BY 컬럼명 ASC|DESC => ASC는 생략이 가능 
                   => ORDER BY 컬럼명   = ORDER BY 컬럼명 ASC
                                1           2          3
                   SELECT ename , deptno , empno 
                   FROM emp
                   ORDER BY 1 (ename)
                                   2 (deptno)
                                   3 (empno)
                   => ORDER BY 1 
*/
-- emp => 급여(sal)가 높은 순서로 정렬 해서 이름 , 급여 , 입사일 출력
SELECT ename,sal,hiredate 
FROM emp
ORDER BY sal DESC; 








