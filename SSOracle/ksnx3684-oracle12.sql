
CREATE TABLE NOTICEREPLY (
    REPLYNUM NUMBER CONSTRAINT NR_RN_PK PRIMARY KEY,
    NUM NUMBER CONSTRAINT NR_NUM_FK REFERENCES NOTICE (NUM),
    WRITER VARCHAR2(100),
    CONTENTS VARCHAR2(600),
    REGDATE DATE
);

SELECT * FROM NOTICEREPLY;
DROP TABLE NOTICEREPLY;
COMMIT;


INSERT INTO FAQ 
VALUES (FAQ_SEQ.nextval, 'id1', 'title1', 'contents1');
SELECT * FROM FAQ;
COMMIT;


SELECT * FROM QNAFILE;
UPDATE QNAFILE SET FILENAME='', ORINAME='' WHERE FILENUM=;

select * from notice;
SELECT * FROM SEQ;

SELECT * FROM
		(SELECT ROWNUM R, N.* FROM
			(SELECT * FROM NOTICE ORDER BY NUM DESC) N
		)
		WHERE R BETWEEN 1 AND 10;
