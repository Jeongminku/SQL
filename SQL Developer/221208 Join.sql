CREATE TABLE ACADEMY_A ( --A학원에 등록한 학생.
    STUDENT_NO NUMBER PRIMARY KEY,
    STUDENT_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO ACADEMY_A VALUES (1001, '유비');
INSERT INTO ACADEMY_A VALUES (1002, '관우');
INSERT INTO ACADEMY_A VALUES (1003, '장비');
INSERT INTO ACADEMY_A VALUES (1004, '자룡');

CREATE TABLE ACADEMY_B ( --A학원에 등록한 학생.
    STUDENT_NO NUMBER PRIMARY KEY,
    STUDENT_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO ACADEMY_B VALUES (1005, '조조');
INSERT INTO ACADEMY_B VALUES (1006, '순욱');
INSERT INTO ACADEMY_B VALUES (1003, '장비');
INSERT INTO ACADEMY_B VALUES (1004, '자룡');

---교집합----- EQUI JOIN  ---------EQUAL(=)의 조건으로 가장 흔히 볼수 있는 JOIN 방식 ---
--SELECT * FROM 테이블이름 별칭(T1), 테이블이름 별칭(T2) WHERE 별명.~~~~~ = 별명.~~~~~~~;
SELECT *
    FROM ACADEMY_A T1, ACADEMY_B T2 
    WHERE T1.STUDENT_NO = T2.STUDENT_NO;

SELECT t1.student_name
    FROM ACADEMY_A T1, ACADEMY_B T2 
    WHERE T1.STUDENT_NO = T2.STUDENT_NO;

SELECT t2.student_name
    FROM ACADEMY_A T1, ACADEMY_B T2 
    WHERE T1.STUDENT_NO = T2.STUDENT_NO;


--     NON-EQUI JOIN -----EQUUAL조건이 아닌 다른 조건으로 조인 (BETWEEN, >, >=, <, <=)


SELECT *
    FROM ACADEMY_A T1, ACADEMY_B
    WHERE T1.STUDENT_NO >= 1003;



SELECT *
    FROM academy_a T1, ACADEMY_B T2
    WHERE T1.STUDENT_NO >= T2.STUDENT_NO;
    
-- 교집합 -------- INNER JOIN ---------------------------------------------------
SELECT *
    FROM ACADEMY_A T1
    INNER JOIN ACADEMY_B T2 --INNER는 생략이 가능.
    ON (T1.STUDENT_NO = T2.STUDENT_NO); --ON 에는 연결 조건을 쓴다.  ( ) 빠져도 되긴함.
    



--- ----LEFT JOIN-------왼쪽테이블의 모든 레코드를 B테이블과 결합한다-------------------
SELECT * 
    FROM ACADEMY_A T1 --from이 메인이다.
    LEFT JOIN ACADEMY_B T2
    ON T1.STUDENT_NO = t2.STUDENT_NO
    ORDER BY T1.STUDENT_NO ASC;


--------RIGHT JOIN ------------------------------------------------------
SELECT * 
    FROM ACADEMY_A T1 --from이 메인이다.
    RIGHT JOIN ACADEMY_B T2
    ON T1.STUDENT_NO = t2.STUDENT_NO
    ORDER BY T1.STUDENT_NO ASC;

-------FULL OUTER JOIN  ------- 다가져옴. 합집합----------------------------------
SELECT * 
    FROM ACADEMY_A T1 --from이 메인이다.
    FULL OUTER JOIN ACADEMY_B T2
    ON T1.STUDENT_NO = t2.STUDENT_NO
    ORDER BY T1.STUDENT_NO ASC;
    
SELECT T1.STUDENT_NO, T1.STUDENT_NAME, T2.STUDENT_NO, T2.STUDENT_NAME
    FROM ACADEMY_A T1
    FULL OUTER JOIN ACADEMY_B T2
    ON(T1.STUDENT_NO = T2.STUDENT_NO)
    ORDER BY T1.STUDENT_NO;
    
    
---------NATURAL JOIN ---왼쪽, 오른쪽 테이블에서 같은 이름을 가진 컬럼들이 모두 동일한 데이터를 가지고 있을 경우만 출력---
SELECT *
    FROM ACADEMY_A T1
    NATURAL JOIN ACADEMY_B T2;

------------------------------------ 퀴즈 전 데이터 초기화----------------------

DROP TABLE EMP;
DROP TABLE DEPT;
CREATE TABLE DEPT (
    DEPT_NO NUMBER PRIMARY KEY,
    DEPT_NAME VARCHAR2(20) NOT NULL
);
CREATE TABLE EMP (
    EMP_NO NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(20) NOT NULL,
    DEPT_NO NUMBER NOT NULL,
    CONSTRAINT FK_DEPT_NO FOREIGN KEY(DEPT_NO) REFERENCES DEPT (DEPT_NO)
);

INSERT INTO DEPT VALUES(1,'인사부');
INSERT INTO DEPT VALUES(2,'연구부');
INSERT INTO DEPT VALUES(3,'홍보부');
INSERT INTO EMP VALUES(1001,'정소화',3);
INSERT INTO EMP VALUES(1002,'김용욱',1);
INSERT INTO EMP VALUES(1003,'고명석',2);

---------------------3장 26페이지 테이블 JOIN 퀴즈-----------------------
--퀴즈1. 부서 테이블과 직원 테이블을 조인하여 아래와 같은 결과를 출력하시오
SELECT A.DEPT_NAME, B.EMP_NAME
    FROM DEPT A
    INNER JOIN EMP B
    ON A.DEPT_NO = B.DEPT_NO;
    
--퀴즈2. 학생/수업/수강 테이블을 조인하여 아래와 같은 결과를 출력하시오 
SELECT cs.student_no, s.student_name, c.class_name
    FROM CLASS_STUDENT CS
    LEFT JOIN CLASS C
    ON cs.class_no = C.class_no
    LEFT JOIN STUDENT S
    ON cs.student_no = s.student_no
    order by cs.student_no asc;
    
    
--번외

CREATE TABLE ACADEMY_C (
    STUDENT_NO NUMBER PRIMARY KEY,
    STUDENT_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO ACADEMY_C VALUES (1004, '자룡');
INSERT INTO ACADEMY_C VALUES (1006, '순욱');
INSERT INTO ACADEMY_C VALUES (1001, '유비');
INSERT INTO ACADEMY_C VALUES (1007, '동탁');

SELECT *                              --B : 1003,1004,1005,1006
    FROM ACADEMY_A A 
    LEFT JOIN ACADEMY_B B 
    ON A.STUDENT_NO = B.STUDENT_NO          --A: 1001,1002,1003,1004   B: 1003,1004
                                                
    RIGHT JOIN ACADEMY_C C                 
    ON A.STUDENT_NO = C.STUDENT_NO 
    
    LEFT JOIN academy_B B
    ON c.student_no = b.student_no;
             --C : 1001,1004,1006,1007
             
ALTER TABLE ACADEMY_A RENAME COLUMN STUDENT_NAME TO STU_A;
ALTER TABLE ACADEMY_B RENAME COLUMN STUDENT_NAME TO STU_B;
ALTER TABLE ACADEMY_C RENAME COLUMN STUDENT_NAME TO STU_C;

ALTER TABLE ACADEMY_A RENAME COLUMN STU_A TO STUDENT_NAME;
ALTER TABLE ACADEMY_B RENAME COLUMN STU_B TO STUDENT_NAME;
ALTER TABLE ACADEMY_C RENAME COLUMN STU_C TO STUDENT_NAME;
----------------------------------------------------------------
--------집합 연산자----------------------------------------------
/*
테이블 구조가 일치해야한다. 컬럼의 개수 등

UNION문 - 테이블 구조가 일치하는 테이블들을 병합하여 조회한다. -> Data Merge 
        UNION ALL: 중복 데이터를 포함하여 그대로 출력한다.
        UNION : 중복데이터는 하나로 처리한다.
문법(UNION ALL)
SELECT *
    FROM 테이블 1
    UNION ALL
    SELECT *
    FROM 테이블 2;
    
문법(UNION)
SELECT *
    FROM 테이블 1
    UNION
    SELECT *
    FROM 테이블 2;

*/
--UNION ALL
SELECT *
    FROM ACADEMY_A
    UNION ALL
    SELECT *
    FROM ACADEMY_B;
--UNION
SELECT *
    FROM ACADEMY_A
    UNION
    SELECT *
    FROM ACADEMY_B;
    
    
--INTERSECT
SELECT * --INTERSECT: 공통된 부분만 중복을 제거하여 조회.
    FROM ACADEMY_A
    INTERSECT
    SELECT *
    FROM ACADEMY_B;
    
    
--MINUS
SELECT * -- A테이블에서 B테이블과 중복되는 데이터를 제거하고 조회.
    FROM ACADEMY_A
    MINUS
    SELECT *
    FROM ACADEMY_B;
    
    
--서브 쿼리
SELECT T1.STUDENT_NO,
    (SELECT T2.STUDENT_NAME
    FROM ACADEMY_B T2
    WHERE T2.STUDENT_NO = T1.STUDENT_NO) AS NAME
FROM ACADEMY_A T1;

    
    
    


