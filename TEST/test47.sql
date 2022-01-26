-- 2022-01-18 JDBC 
/*
     DDL => 오라클 자체에서 제작 (테이블 , 뷰 , 시퀀스 , PL/SQL) 
                --------------
     DML => 프로그램 언어를 이용해서 접근 (데이터를 조작) 
                 ------------------------------------ (JDBC)
                 오라클 단점 : 사용자로부터 데이터를 받지 못한다 
                 -------------- 단점을 보완하기 위해 프로그램언어 
                 자바 : SELECT (데이터 추출,검색)
                             => 메인화면 , 목록 , 상세보기 , 찾기  => 70%
                             => 프로젝트 (1차 : 화면 UI) => 이력서 캡쳐 (GIT 주소) 
                                                   => DB 
                                                2차(스프링 => Back-End)
                                                3차(자바스크립트(React,Vue) => Front-End)
                                                ---------------- Full Stack ----------------------
                          INSERT (데이터 추가)
                             => 회원가입 , 게시판 글쓰기 , 장바구니 , 예매 ...
                          UPDATE (데이터 수정)
                             => 회원 수정 , 비밀번호 변경 , 게시판 수정 , 장바구니 , 예매수정 ....
                          DELETE (데이터 삭제)
                             => 회원 탈퇴 , 게시판 삭제 , 장바구니 취소 , 예매취소 ...
                1. DML의 형식 
                    = INSERT (대입값의 갯수)
                        1) 모든 컬럼에 값을 대입 
                               *** 테이블 생성시 순서로 값을 대입 
                            INSERT INTO table_name VALUES(값....)
                            => 테이블 생성시 컬럼의 갯수와 동일 
                            => NULL , default를 적용하지 않는다 
                            => 문자,문자열,날짜 => ''을 사용한다
                                                             ---
                            => 문자,숫자,날짜(YY/MM/DD)  22/01/18(예매일) , 생년월일 
                                 -----        ----- 
                        2) 필요한 컬럼에 값을 대입 : NULL이거나 DEFAULT => 미첨부 
                            => NULL허용 , DEFAULT설정시 
                            INSERT INTO table_name(컬럼명1,컬럼명2...)
                                                                -------------------- 순서가 없다 
                           VALUES(값1,값2...)
                            *** PRIMARY KEY => 서브쿼리 , 시퀀스를 이용한다 
                                                           (자동 증가 번호를 만든다)
                            => 값은 사용자가 보내준 값을 첨부 
                            => DEFAULT : 등록일 , 조회수 ...
                    = UPDATE
                       형식)
                                  UPDATE table_name SET
                                  컬럼=값 , 컬럼=값 , 컬럼=값 ....
                                  [WHERE 조건] => 원하는 부분만 수정 
                                                           ----------------------- 중복없는 데이터 
                                                            이상현상 (수정, 삭제)
                    = DELETE 
                                DELETE FROM table_name
                                [WHERE 조건] => 원하는 부분만 삭제 
                    *** SELECT는 데이터가 변경되는 상태가 아니다 (다시 저장할 필요가 없다)
                    *** DELETE,INSERT,UPDATE=> 데이터가 변경이 된다 
                         ---------------------------- 다시 저장한다 (COMMIT)
                         ---------------------------- ROLLBACK 
                         *** 프로그램에서 위험한 내용 (자바:AutoCommit)
                              => 트랜잭션 (일괄 처리) : 스프링에서는 핵심 
*/
-- DML연습 => 테이블 제작 
DROP TABLE student;
CREATE TABLE student(
     hakbun NUMBER,
     name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
     kor NUMBER(3),
     eng NUMBER(3),
     math NUMBER(3),
     CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun)
);






