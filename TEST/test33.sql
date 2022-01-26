-- 2022-01-11 DML 정리 
/*
     DML (웹 프로그래머의 중심 명령어)
       SELECT : 데이터 출력 (검색) 
                   1. 목록 => 페이징 (인라인뷰) 
                                  SELECT ~
                                  FROM (SELECT ~ )
                       => 정렬 (ORDER BY , INSEX_ASC,INDEX_DESC)
                   2. 상세보기 => WHERE no=?(Primary Key)
                   3. 찾기 => LIKE,REGEXP_LIKE 
                       => 정렬 (ORDER BY , INSEX_ASC,INDEX_DESC)
              형식)  => 사이트의 70~80%
                       SELECT [DISTINCT] * | column1,column2...
                       FROM table_name|view_name|SELECT~
                       [
                            WHERE 조건문 (연산자)
                            GROUP BY 컬럼:함수 ==> 그룹별로 나눠서 그룹별 처리 
                            HAVING 그룹함수:조건문 
                                         ----------
                            ORDER BY 컬럼명|위치번호 ASC|DESC => ASC는 생략이 가능
                            *** ORDER BY 컬럼명 ASC , 컬럼명 DESC
                                                 --------         ------- 위에서 같은 값이 있는 경우에 처리 
                                 ==> 댓글의 댓글 , 답변형 게시판(묻고 답하기)
                       ]
                       = 연산자 , 단일행 , 집계함수
              INSERT : 데이터 추가 
                           글쓰기 , 댓글쓰기 ,회원가입 , 장바구니 , 예매 , 예약
                           형식)
                                   전체 ROW추가 
                                   INSERT INTO table_name VALUES(값...) => 컬럼 갯수와 값이 동일
                                   원하는 컬럼만 추가 (NULL허용 , DEFAULT가 있는 컬럼만 제외)
                                   INSERT INTO table_name(컬럼1,컬럼2...) VALUES(값,값...)
                                                                      -------------------          ----------
                                  => 문자,날짜 데이터 반드시 => ''
              UPDATE : 데이터 수정 
                             회원수정 ..   
                           형식) 
                                   UPDATE table_name SET
                                   컬럼=값,컬럼=값....
                                   [WHERE 조건]
             DELETE : 데이터 삭제 
                          형식)
                                   DELETE FROM table_name
                                   [WHERE 조건] 
*/



