DROP TABLE Category;
CREATE TABLE Category(
    cno NUMBER,
    title VARCHAR2(200) CONSTRAINT cate_title_nn NOT NULL,
    subject VARCHAR2(200) CONSTRAINT cate_subject_nn NOT NULL,
    poster VARCHAR2(200) CONSTRAINT cate_poster_nn NOT NULL,
    link VARCHAR2(200) CONSTRAINT cate_link_nn NOT NULL,
    CONSTRAINT cate_cno_pk PRIMARY KEY(cno)
);

DROP SEQUENCE cate_cno_seq;
CREATE SEQUENCE cate_cno_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;