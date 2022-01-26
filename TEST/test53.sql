-- 2022-01-19 (FUNCTION,PROCEDURE)
/*
     FUNCTION : 이미 만들어진 함수 
                       ----------------------
                        단일행 함수(LENGHT,SUBSTR...) , 집계함수(SUM,MAX,COUNT...)
                       사용자 정의 함수 (없는 경우에 만들어서 사용) => PL/SQL
    1) 형식 
          RETURN 데이터형 
              문자열 : RETURN VARCHAR2 
              숫자 : RETURN NUMBER
          CREATE [OR REPLACE] FUNCTION func_name(매개변수....) RETURN 데이터형
                      ----------------- 삭제없이 수정이 가능 
          IS
            -- 지역변수 
          BEGIN
            -- 요청데이터 추출 
            RETURN 값;
          END;
           /

        => 사용법 (실무 => 회사마다 만들어진 함수) => 메뉴얼 
             SELECT func_name(값) 
	***단점
	1.분석하기가 어려움(SQL문장을 볼 수 없다.)
	2.리턴값이 한개 => 컬럼 여러개를 가지고 올때 함수를 여러개 제작
	***장점
	1.보안 좋다
	2.복잡한 SQL문장을 간결하게 만들 수 있다.
	***주로 사용처(ERP) => ERP(어드민 계정으로 프로그램 만듬=>관리프로그램: 물류,인사,급여 만들때)
	***=사용자용(주로 보여주는 역할 ...예매, 추천, 회원가입)
	=관리자용(공지사항, 영화...)
    2) 삭제 
         DROP FUNCTION func_name;
    *** FUNCTION : 실행후에 결과값을 가지고 있다 => SELECT ~ , FROM뒤에서 주로 사용
         -------------- 1. 조인 , 2. 가로 계산 
    *** (핵심)PROCEDURE: 결과값이 없는 함수 => 기능 처리 (데이터 추가,데이터 여러개 인출..)
*/
-- JOIN => 인출 
-- emp에서 부서명 
CREATE OR REPLACE FUNCTION getDname(vdeptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
   vdname dept.dname%TYPE;
BEGIN
   SELECT dname INTO vdname
   FROM dept
   WHERE deptno=vdeptno;
   RETURN vdname;
END;
/
-- emp에서 근무지 
CREATE OR REPLACE FUNCTION getLoc(vdeptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
   vloc dept.loc%TYPE;
BEGIN
   SELECT loc INTO vloc
   FROM dept
   WHERE deptno=vdeptno;
   RETURN vloc;
END;
/
-- JOIN시 
SELECT empno,ename,job,dname,loc
FROM emp , dept
WHERE emp.deptno=dept.deptno;
-- SUBQUERY시
SELECT empno,ename,job,
           (SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
           (SELECT loc FROM dept WHERE deptno=emp.deptno) loc
FROM emp;
           
-- 함수제작시 처리 
SELECT empno,ename,job,getDname(deptno) dname,getLoc(deptno) loc
FROM emp;
/*
INSERT INTO student VALUES(1,'홍길동',89,80,78);
INSERT INTO student VALUES(2,'박문수',80,81,75);
INSERT INTO student VALUES(3,'이순신',80,90,67);
INSERT INTO student VALUES(4,'김두한',67,80,72);
INSERT INTO student VALUES(5,'심청이',85,89,90);
INSERT INTO student VALUES(6,'춘향이',68,90,68);
INSERT INTO student VALUES(7,'소서노',90,95,90);
INSERT INTO student VALUES(8,'강감찬',95,86,66);
COMMIT;
*/
-- 성적 통계 => 총점 , 평균 
CREATE OR REPLACE FUNCTION stdSum(vhakbun student.hakbun%TYPE)
RETURN NUMBER
IS
  --지역변수 => 국어,영어,수학 => 합을 구행서 저장하는 변수 
  total NUMBER(3);
BEGIN
  SELECT kor+eng+math INTO total
  FROM student 
  WHERE hakbun=vhakbun;
  RETURN total;
END;
/

-- 평균 
CREATE OR REPLACE FUNCTION stdAvg(vhakbun student.hakbun%TYPE)
RETURN NUMBER
IS
  avg2 NUMBER;
BEGIN
  SELECT ROUND((kor+eng+math)/3,2) INTO avg2
  FROM student
  WHERE hakbun=vhakbun;
  RETURN avg2;
END;
/
SELECT hakbun,name,kor,eng,math,stdSum(hakbun) total,stdAvg(hakbun) avg
FROM student;







