-- 2022-01-12
/*
      SELECT 문장 (데이터 출력을 위한 검색) 
        => 목록 , 상세보기 , 찾기 
        => 형식 
                     SELECT [DISTINCT] *|column1,column2...
                     FROM  table_name|view_name|(SELECT ~~)
                                ------------------------------------------
                     WHERE 조건문 (컬럼|함수) 연산자 값
                     ORDER BY  컬럼|함수 ASC|DESC ==> ASC생략이 가능 
        => 실행순서 
                     FROM
                     WHERE
                     SELECT
                     ORDER BY
       => 조건문이 많아 사용 => 연산자 
       => 컬럼을 제어해서 출력 가능 => 내장 함수 
                                                      ------------  ==> 1개의 테이블에서 데이터를 가지고 온다 

       테이블이 두개 이상일 경우에 처리 ==> JOIN (오라클 조인 , 표준(ANSI) 조인)
       ---------------------------------------------------------------------------------------
       INNER JOIN (EQUI_JOIN)

       오라클 조인 
        => SELECT A.col,Bcol
             FROM A,B
             WHERE A.col=B.col   ==> A하고 B의 컬럼이 다를 수도 있다 
             => 같은 값이 저장되어 있으면 조인이 가능 
             => 맛집 ,  명소 , 호텔 , 자연 (address) 
                  -------------
                  -----             ----
                  -----                    ------
       ANSI 조인 (JOIN~ON)
       => SELECT A.col,Bcol
             FROM A (INNER)JOIN B
             ON A.col=B.col
       OUTER JOIN (LEFT|RIGHT)

       => 오라클 조인 
            => LEFT
                 SELECT A.col,B.col   => col명이 틀리면 테이블명을 생략이 가능 
                 FROM A,B
                 WHERE A.col=B.col(+)
            => RIGHT
                SELECT A.col,B.col   => col명이 틀리면 테이블명을 생략이 가능 
                 FROM A,B
                 WHERE A.col(+)=B.col
       => ANSI 조인 
            => LEFT
                 SELECT A.col,B.col   => col명이 틀리면 테이블명을 생략이 가능 
                 FROM A LEFT OUTER JOIN B
                 ON A.col=B.col
            => RIGTH
                 SELECT A.col,B.col   => col명이 틀리면 테이블명을 생략이 가능 
                 FROM A RIGHT OUTER JOIN B
                 ON A.col=B.col
       => SubQuery 
            ========
              SELECT ( ) ==> 스칼라 서브쿼리
              FROM ( )  ==> 인라인 뷰
              WHERE ( )  ==> 단일행,다중행 
      ----------------------------------------------- 사이트의 65~75%
*/







