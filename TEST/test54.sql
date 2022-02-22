-- 2022-01-19 (프로시저:리턴형이 없는 함수) = VB,자바스크립트 
/*
      프로시저는 기능을 가지고 있는 함수 
      => SELECT , INSERT , UPDATE , DELETE 사용이 가능 
      => 댓글 (원하는 곳에 사용이 가능하게 만든다) 
      => 사용처 : 반복적인 내용이 많은 경우 (카페 , 블로그, ~VO를 제작
                       자음으로 찾기, 페이지 나누기)
      => 형식 
           CREATE [OR REPLACE] PROCEDURE pro_name(매개변수....)
           IS
              지역변수 
           BEGIN
               요청처리 => SQL제어 
                            => 찾기 : SELECT
                            ---------------------------
                            => 추가 : INSERT
                            => 수정 , 삭제  
                            --------------------------- COMMIT
           END;
             /
      => 에러발생시 => 확인 (show error)
            : 컴파일 에러과 함께 프로시저가 생성되었습니다.. 
      => 삭제
           DROP PROCEDURE pro_name
      => 매개변수의 종류 
           IN : 값을 첨부 (INSERT , UPDATE , DELETE) 
           OUT : 실행 결과값을 읽어 온다 (SELECT) 
      => 리턴형은 존재하지 않는다 => 실행 결과값을 받을 수 있다 (매개변수)
                                                    ---------- C/C++(포인터)
                                                    ---------- Call By Reference (배열,클래스)
                                                    ---------- 오라클에서는 모든 변수가 가능
      => Call By Value : 일반변수 (IN) => no IN NUMBER : IN는 생략이 가능
                                                         no NUMBER
      => Call By Reference : 포인터 (OUT) => 변수를 매개변수로 설정 => 값을 받을 수 있다
                                                         name OUT VARCHAR2
      예)
             void display(int* p)
             {
                    *p=100;
             }
            
             void main()
             {
                 int a=10;
                 int* p=&a;
                 display(p); ==> a=100
             }
             => 변수의 메모리 주소를 넘겨주고 값을 채워주는 방식 => OUT
             => 자바에서도 포인터가 등장 => 람다식(함수포인터)
                  ()->System.out.println("aaa");
*/
-- student에 값을 저장 (INSERT) => IN 
CREATE OR REPLACE PROCEDURE studentInsert(
    vname student.name%TYPE,
    vkor student.kor%TYPE,
    veng student.eng%TYPE,
    vmath student.math%TYPE
)
IS
  -- 지역변수 
BEGIN 
  -- 구현부 
  INSERT INTO student VALUES(
     (SELECT NVL(MAX(hakbun)+1,1) FROM student),
     vname,vkor,veng,vmath
  );
 COMMIT;
END;
/
-- student에 값을 수정 (UPDATE) => IN
CREATE OR REPLACE PROCEDURE studentUpdate(
    vhakbun student.hakbun%TYPE,
    vname student.name%TYPE,
    vkor student.kor%TYPE,
    veng student.eng%TYPE,
    vmath student.math%TYPE
)
IS
  -- 지역변수 : 먼저 필요한 변수를 선언한다 
BEGIN
  -- 구현 => 지역변수의 값을 채운다 
  UPDATE student SET 
  name=vname,kor=vkor,eng=veng,math=vmath
  WHERE hakbun=vhakbun;
  COMMIT;
END;
/
-- student에 값을 삭제(DELETE) => IN
-- EXECUTE studentDelete(1);
-- 자바에서 호출 => {CALL studentDelete(?)} => 프로시저 호출
-- CallableStatement  
CREATE OR REPLACE PROCEDURE studentDelete(
   vhakbun student.hakbun%TYPE 
)
IS
BEGIN
   DELETE FROM student 
   WHERE hakbun=vhakbun;
   COMMIT;
END;
/
/*
      자바 / 오라클 => 활용 (출력) => 화면 UI
      ---------------
      HTML/CSS , JavaScript (Jquery => AJAX)
      JSP
      ----------------------------------------------------
      Spring 
      MyBatis , VUE , REACT => ChatBot (형태소) 
      ----------------------------------------------------
*/
-- student에 값을 읽기(SELECT) => IN(값을 대입할 목적),OUT(값을 받아볼 목적)
-- 프로시저는 리턴형을 가지고 있지 않는다 => 값을 받는 경우 매개변수를 이용 
--  OUT => 값을 받아 볼 수 있다 
CREATE OR REPLACE PROCEDURE studentDetail(
    vhakbun IN student.hakbun%TYPE,
    vname OUT student.name%TYPE,
    vkor OUT student.kor%TYPE,
    veng OUT student.eng%TYPE,
    vmath OUT student.math%TYPE
)
IS
BEGIN
  -- 값을 채워준다 
  SELECT name,kor,eng,math INTO vname,vkor,veng,vmath
  FROM student 
  WHERE hakbun=vhakbun;
END;
/





