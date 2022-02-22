-- 2022-01-13 (제약조건 ALTER를 이용해서 추가 , 수정)
CREATE TABLE reply(
    no NUMBER,
    bno NUMBER,
    id VARCHAR2(20),
    name VARCHAR2(34),
    msg CLOB,
    regdate DATE
);
-- NOT NULL은 MODIFY , 나머지 제약조건은 ADD

-- FOREIGN KEY 
ALTER TABLE reply
ADD CONSTRAINT reply_bno_fk FOREIGN KEY(bno)
REFERENCES board(no);

ALTER TABLE reply
ADD CONSTRAINT reply_id_fk FOREIGN KEY(id)
REFERENCES member(id);

-- PRIMARY KEY
ALTER TABLE reply
ADD CONSTRAINT reply_no_pk PRIMARY KEY(no);

-- NOT NULL
ALTER TABLE reply
MODIFY msg CONSTRAINT reply_msg_nn NOT NULL;
-- DEFAULT 
ALTER TABLE reply
MODIFY regdate DATE DEFAULT SYSDATE;


/*
    -- NOT NULL 추가
    ALTER TABLE table_name
    MODIFY column_name CONSTRAINT 테이블명_컬럼_nn NOT NULL;

    -- DEFAULT
    ALTER TABLE table_name
    MODIFY column_name 데이터형 DEFAULT 값;

    ALTER TABLE table_name
    ADD CONSTRAINT 테이블명_컬럼_pk PRIMARY KEY(컬럼명);

    ALTER TABLE table_name
    ADD CONSTRAINT 테이블명_컬럼_fk FOREIGN KEY(컬럼명)
    REFERENCES 참조하는 테이블명(참조컬럼);

    --  제약조건 확인 , VIEW확인 , 테이블 확인 => SQL
*/

