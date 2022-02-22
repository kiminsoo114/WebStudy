-- 2022-01-11 DDL(테이블 수정,삭제,추가) => ALTER (179~192페이지)
-- DML (INSERT , UPDATE , DELETE) 
/*
        테이블 : Sawon
       ------------------------------------
        sabun : 사번 => 중복없는 데이터 (숫자)
        name : 이름 => NULL을 허용하지 않는다 
        dept : 부서명 => 개발부 , 자재부 , 기획부 ,영업부 , 총무부 
        loc : 근무지   => 서울 , 부산 ,경기 
        job : 직위    => 사원 , 대리, 과장 ,부장,사장
        hiredate : 입사일 
        pay : 연봉 
        comm : 성과급 ==> NULL허용 
*/

CREATE TABLE sawon(
    sabun NUMBER(4), 
    name VARCHAR2(34) CONSTRAINT sawon_name_nn NOT NULL,
    dept VARCHAR2(9),
    loc VARCHAR2(2),
    job VARCHAR2(6),
    hiredate DATE DEFAULT SYSDATE,
    pay NUMBER,
    comm NUMBER,
    CONSTRAINT sawon_sabun_pk PRIMARY KEY(sabun),
    CONSTRAINT sawon_dept_ck CHECK(dept IN('개발부' , '자재부' , '기획부' ,'영업부' , '총무부')),
    CONSTRAINT sawon_loc_ck CHECK(loc IN('서울' , '부산' ,'경기')),
    CONSTRAINT sawon_job_ck CHECK(job IN('사원' , '대리', '과장' ,'부장','사장'))
);

-- comm을 추가  (ALTER)  =>184 ~ 185 
-- CONSTRAINT : 추가 , 삭제 , 수정 
/*
     테이블 수정 
     -------------
     1) 컬럼 추가  => ADD  ===> comm
         형식)
                 ALTER TABLE table_name ADD 컬럼명 데이터형 [제약조건]
     2) 컬럼 수정  => MODIFY===> loc (글자수 증가)
                 ALTER TABLE table_name MODIFY 컬럼명 데이터형 [제약조건]
     3) 컬럼 삭제  => DROP ===> 추가 email (UNIQUE) ==> 삭제 
                ALTER TABLE table_name DROP COLUMN 컬럼명
*/

-- comm추가 
-- ALTER TABLE sawon ADD comm NUMBER;
-- email 추가 
--ALTER TABLE sawon ADD email VARCHAR2(100) CONSTRAINT sawon_email_uk UNIQUE; 
-- loc 수정 
--ALTER TABLE sawon MODIFY loc VARCHAR2(6);
-- email 삭제 
-- ALTER TABLE sawon DROP COLUMN email;

-- 테이블 전체 삭제 (186)
-- 형식) DROP TABLE table_name;
-- DROP TABLE sawon;
-- ALTER , CREATE , DROP => 복구하지 못한다 (admin)







