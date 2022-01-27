-----DDL-----
-----제약 조건-----

SELECT * FROM TAB;

CREATE TABLE TEST (
     COL1 VARCHAR2(30),
     COL2 NUMBER(2),
     COL3 DATE
);

SELECT * FROM TEST;

INSERT INTO TEST (COL1, COL2, COL3) VALUES ('HI', 10, '22-01-26');
INSERT INTO TEST VALUES ('MY NAME IS', 20, '22-01-26');
INSERT INTO TEST VALUES ('LBH', 30, '22-01-26');
INSERT INTO TEST VALUES ('NICE TO MEET YOU', 100, '22-01-26');
INSERT INTO TEST VALUES ('GOOD LUCK TO YOUR LIFE', -99, '22-01-26');

DROP TABLE TEST;



-- 테이블 명은 POINT
-- 번호NUM 이름NAME 국어KOR, 영어ENG, 수학MATH, 총점TOTAL, 평균MEAN
-- 테이블 생성하고 INSERT 3개
CREATE TABLE POINT (
    NUM NUMBER,
    NAME VARCHAR2(10),
    KOR NUMBER(3),
    ENG NUMBER(3),
    MATH NUMBER(3),
    TOTAL NUMBER(3),
    MEAN NUMBER(5, 2)
);
SELECT * FROM POINT;
INSERT INTO POINT VALUES(1, 'LBH', 90, 80, 70, 250, 83);
INSERT INTO POINT VALUES(2, 'KBH', 100, 50, 50, 200, 67);
--INSERT INTO POINT VALUES(3, 100, 100, 100, (SELECT SUM(KOR,ENG,MATH) FROM POINT), (SELECT AVG(KOR,ENG,MATH) FROM POINT));
DROP TABLE POINT;



-- STUDENT
-- 학번, 이름, 전화번호, 이메일
CREATE TABLE STUDENT (
    NUM NUMBER PRIMARY KEY,
    NAME VARCHAR(10),
    PHONE VARCHAR(20),
    EMAIL VARCHAR(30)
);
SELECT * FROM STUDENT;
INSERT INTO STUDENT VALUES(1, 'LBH', '010-1234-5678', 'KSNX3684@NAVER.COM');
INSERT INTO STUDENT VALUES(2, 'KBH', '010-1234-5678', 'KSNX3684@NAVER.COM');

DELETE STUDENT WHERE NUM = 201401060;

DESC STUDENT;
DROP TABLE STUDENT;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'STUDENT';

------------ 컬럼레벨 방식 ------------
CREATE TABLE STUDENT (
    NUM NUMBER CONSTRAINT ST_NUM_PK PRIMARY KEY,
    -- NAME VARCHAR(10) CONSTRAINT ST_NAME_NN NOT NULL,
    -- NOT NULL은 제약조건이름을 명시해도 나오지 않으니 그냥 선언만 하자
    NAME VARCHAR(10) NOT NULL,
    PHONE VARCHAR(20) CONSTRAINT ST_PHONE_U UNIQUE,
    EMAIL VARCHAR(30) CONSTRAINT ST_EMAIL_U UNIQUE
);
SELECT * FROM STUDENT;
INSERT INTO STUDENT VALUES(1, 'LBH', '010-1234-5678', 'KSNX3684@NAVER.COM');
INSERT INTO STUDENT VALUES(2, 'KBH', '010-1234-5678', 'KSNX3684@NAVER.COM');
INSERT INTO STUDENT VALUES(3, 'PBH', NULL, NULL);

------------ 테이블레벨 방식 (NOT NULL, DEFAULT를 적용하기위해 혼용 사용 가능) ------------
CREATE TABLE POINT (
    NUM NUMBER, -- NUMBER TYPE은 소괄호로 범위를 정하지 않으면 최댓값이 적용
    NAME VARCHAR2(10) CONSTRAINT PT_NAME_NN NOT NULL, -- VARCHAR TYPE은 소괄호로 정하지 않으면 에러 발생
    KOR NUMBER(3),
    ENG NUMBER(3) CONSTRAINT PT_ENG_C CHECK (ENG BETWEEN 0 AND 100),
    MATH NUMBER(3) CONSTRAINT PT_MATH_C CHECK (MATH BETWEEN 0 AND 100),
    TOTAL NUMBER(3) CONSTRAINT PT_TOTAL_C CHECK (TOTAL BETWEEN 0 AND 300),
    MEAN NUMBER(5, 2) DEFAULT 0.00,
    CONSTRAINT PT_NUM_PK PRIMARY KEY (NUM),
    CONSTRAINT PT_KOR_C CHECK (KOR >= 0 AND KOR <= 100)
    -- CONSTRAINT PT_KOR_C CHECK (KOR BETWEEN 0 AND 100)
);
SELECT * FROM POINT;
INSERT INTO POINT VALUES(1, 'LBH', 90, 80, 70, 250, 83);
INSERT INTO POINT VALUES(2, 'KBH', 100, 50, 50, 200, 67);
INSERT INTO POINT VALUES(3, 'PBK', 50, 50, 50, 150, NULL); -- NULL값을 넣어도 들어간다
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'POINT';
DROP TABLE POINT;


------------------------------------------------------------------------------
CREATE TABLE STUDENT_POINT (
    NUM NUMBER CONSTRAINT ST_NUM_PK PRIMARY KEY,
    NAME VARCHAR(10) NOT NULL,
    PHONE VARCHAR(20) CONSTRAINT ST_PHONE_U UNIQUE,
    EMAIL VARCHAR(30) CONSTRAINT ST_EMAIL_U UNIQUE,
    KOR NUMBER(3),
    ENG NUMBER(3) CONSTRAINT PT_ENG_C CHECK (ENG BETWEEN 0 AND 100),
    MATH NUMBER(3),
    TOTAL NUMBER(3),
    MEAN NUMBER(5, 2) DEFAULT 0.00
);
SELECT * FROM STUDENT_POINT;

INSERT INTO STUDENT_POINT
VALUES (1, 'LBH', '010-1234-5678', 'LBH@NAVER.COM', 10, 20, 30, 60, 20);
INSERT INTO STUDENT_POINT
VALUES (1, 'KBH', '010-2222-2222', 'KBH@GMAIL.COM', 20, 20, 20, 60, 20);

DROP TABLE STUDENT_POINT;



-----------------------------------------------
CREATE TABLE STUDENT (
    NUM NUMBER PRIMARY KEY,
    NAME VARCHAR(10),
    PHONE VARCHAR(20),
    EMAIL VARCHAR(30)
);
SELECT * FROM STUDENT;
INSERT INTO STUDENT VALUES(10, 'LBH', '010-1234-5678', 'KSNX3684@NAVER.COM');
INSERT INTO STUDENT VALUES(20, 'KBH', '010-1234-5678', 'KSNX3684@NAVER.COM');
DROP TABLE STUDENT;

CREATE TABLE POINT (
    NO NUMBER CONSTRAINT POINT_NO_PK PRIMARY KEY,
    NUM NUMBER CONSTRAINT POINT_NUM_FK REFERENCES STUDENT(NUM),
    KOR NUMBER(3),
    ENG NUMBER(3) CONSTRAINT PT_ENG_C CHECK (ENG BETWEEN 0 AND 100),
    MATH NUMBER(3),
    TOTAL NUMBER(3),
    MEAN NUMBER(5, 2) DEFAULT 0.00
    --CONSTRAINT POINT_NUM_FK FOREIGN KEY (NUM) REFERENCES STUDENT(NUM)
    -- 테이블 방식은 컬럼 방식에 비해 어느 컬럼에 적용할 것인지 정해져 있지 않기 때문에 FOREIGN KEY (NUM) 구문을 추가해서 작성해야한다.
);
SELECT * FROM POINT;
INSERT INTO POINT VALUES(1, 10, 90, 80, 70, 250, 83);
INSERT INTO POINT VALUES(2, 20, 100, 50, 50, 200, 67);
DROP TABLE POINT;

-- 학생 이름이 LBH인 학생의 점수를 조회
SELECT * FROM POINT WHERE NUM =
(
    SELECT NUM FROM STUDENT WHERE NAME = 'LBH'
);
-- 학생 번호가 20번인 학생의 이름, 이메일, 총점, 평균 출력
SELECT S.NAME, S.EMAIL, P.TOTAL, P.MEAN
FROM STUDENT S
    NATURAL JOIN
    POINT P
WHERE NUM = 20;

INSERT INTO POINT VALUES(3, 40, 60, 70, 80, 210, 70);


------------------------------------------------------------ 중고나라 DB 실습
CREATE TABLE SELLFRONT (
    NO NUMBER PRIMARY KEY,
    NAME VARCHAR2(20),
    TITLE VARCHAR2(100),
    TIME DATE
);
SELECT * FROM SELLFRONT;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='SELLFRONT'; 
DROP TABLE SELLFRONT;

CREATE TABLE SELLBACK (
    NO NUMBER CONSTRAINT SB_NO_FK REFERENCES SELLFRONT(NO) CONSTRAINT SB_NO_PK PRIMARY KEY, -- 참조와 동시에 PRIMARY KEY 지정도 가능하다
    PRICE NUMBER(7) CONSTRAINT SB_PRICE_C CHECK(PRICE BETWEEN 1 AND 9999999),
    CONTENTS VARCHAR(2000)
);
SELECT * FROM SELLBACK;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'SELLBACK';
DROP TABLE SELLBACK;

INSERT INTO SELLFRONT VALUES(1, '양심판매자', '중고 아이패드 프로 4세대 팝니다', '2022-01-26');
INSERT INTO SELLBACK VALUES(1, 600000, '사용한지 1년 된 상품입니다');
INSERT INTO SELLFRONT VALUES(2, '사기꾼', '아이패드 프로 6세대 팝니다 (미개봉)', '2023-01-26');
INSERT INTO SELLBACK VALUES(2, 2000000, '미개봉이고요 제가 팀쿡인데 미리 몇개 빼놨습니다.');
INSERT INTO SELLBACK VALUES(3, 1000000, 'TEST');

-- 판매자 이름이 양심판매자인 사람의 게시글의 내용 출력
SELECT CONTENTS FROM SELLBACK WHERE NO =
(
    SELECT NO FROM SELLFRONT WHERE NAME = '양심판매자'
);
-- 판매자 이름이 사기꾼인 사람의 게시글의 상품 가격과 날짜, 내용 출력
SELECT SB.PRICE, SF.TIME, SB.CONTENTS
FROM SELLFRONT SF
    INNER JOIN
    SELLBACK SB
    USING(NO)
WHERE NAME = '사기꾼';



ROLLBACK;

