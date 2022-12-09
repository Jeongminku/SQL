CREATE TABLE ACADEMY_A ( --A�п��� ����� �л�.
    STUDENT_NO NUMBER PRIMARY KEY,
    STUDENT_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO ACADEMY_A VALUES (1001, '����');
INSERT INTO ACADEMY_A VALUES (1002, '����');
INSERT INTO ACADEMY_A VALUES (1003, '���');
INSERT INTO ACADEMY_A VALUES (1004, '�ڷ�');

CREATE TABLE ACADEMY_B ( --A�п��� ����� �л�.
    STUDENT_NO NUMBER PRIMARY KEY,
    STUDENT_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO ACADEMY_B VALUES (1005, '����');
INSERT INTO ACADEMY_B VALUES (1006, '����');
INSERT INTO ACADEMY_B VALUES (1003, '���');
INSERT INTO ACADEMY_B VALUES (1004, '�ڷ�');

---������----- EQUI JOIN  ---------EQUAL(=)�� �������� ���� ���� ���� �ִ� JOIN ��� ---
--SELECT * FROM ���̺��̸� ��Ī(T1), ���̺��̸� ��Ī(T2) WHERE ����.~~~~~ = ����.~~~~~~~;
SELECT *
    FROM ACADEMY_A T1, ACADEMY_B T2 
    WHERE T1.STUDENT_NO = T2.STUDENT_NO;

SELECT t1.student_name
    FROM ACADEMY_A T1, ACADEMY_B T2 
    WHERE T1.STUDENT_NO = T2.STUDENT_NO;

SELECT t2.student_name
    FROM ACADEMY_A T1, ACADEMY_B T2 
    WHERE T1.STUDENT_NO = T2.STUDENT_NO;


--     NON-EQUI JOIN -----EQUUAL������ �ƴ� �ٸ� �������� ���� (BETWEEN, >, >=, <, <=)


SELECT *
    FROM ACADEMY_A T1, ACADEMY_B
    WHERE T1.STUDENT_NO >= 1003;



SELECT *
    FROM academy_a T1, ACADEMY_B T2
    WHERE T1.STUDENT_NO >= T2.STUDENT_NO;
    
-- ������ -------- INNER JOIN ---------------------------------------------------
SELECT *
    FROM ACADEMY_A T1
    INNER JOIN ACADEMY_B T2 --INNER�� ������ ����.
    ON (T1.STUDENT_NO = T2.STUDENT_NO); --ON ���� ���� ������ ����.  ( ) ������ �Ǳ���.
    



--- ----LEFT JOIN-------�������̺��� ��� ���ڵ带 B���̺�� �����Ѵ�-------------------
SELECT * 
    FROM ACADEMY_A T1 --from�� �����̴�.
    LEFT JOIN ACADEMY_B T2
    ON T1.STUDENT_NO = t2.STUDENT_NO
    ORDER BY T1.STUDENT_NO ASC;


--------RIGHT JOIN ------------------------------------------------------
SELECT * 
    FROM ACADEMY_A T1 --from�� �����̴�.
    RIGHT JOIN ACADEMY_B T2
    ON T1.STUDENT_NO = t2.STUDENT_NO
    ORDER BY T1.STUDENT_NO ASC;

-------FULL OUTER JOIN  ------- �ٰ�����. ������----------------------------------
SELECT * 
    FROM ACADEMY_A T1 --from�� �����̴�.
    FULL OUTER JOIN ACADEMY_B T2
    ON T1.STUDENT_NO = t2.STUDENT_NO
    ORDER BY T1.STUDENT_NO ASC;
    
SELECT T1.STUDENT_NO, T1.STUDENT_NAME, T2.STUDENT_NO, T2.STUDENT_NAME
    FROM ACADEMY_A T1
    FULL OUTER JOIN ACADEMY_B T2
    ON(T1.STUDENT_NO = T2.STUDENT_NO)
    ORDER BY T1.STUDENT_NO;
    
    
---------NATURAL JOIN ---����, ������ ���̺��� ���� �̸��� ���� �÷����� ��� ������ �����͸� ������ ���� ��츸 ���---
SELECT *
    FROM ACADEMY_A T1
    NATURAL JOIN ACADEMY_B T2;

------------------------------------ ���� �� ������ �ʱ�ȭ----------------------

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

INSERT INTO DEPT VALUES(1,'�λ��');
INSERT INTO DEPT VALUES(2,'������');
INSERT INTO DEPT VALUES(3,'ȫ����');
INSERT INTO EMP VALUES(1001,'����ȭ',3);
INSERT INTO EMP VALUES(1002,'����',1);
INSERT INTO EMP VALUES(1003,'���',2);

---------------------3�� 26������ ���̺� JOIN ����-----------------------
--����1. �μ� ���̺�� ���� ���̺��� �����Ͽ� �Ʒ��� ���� ����� ����Ͻÿ�
SELECT A.DEPT_NAME, B.EMP_NAME
    FROM DEPT A
    INNER JOIN EMP B
    ON A.DEPT_NO = B.DEPT_NO;
    
--����2. �л�/����/���� ���̺��� �����Ͽ� �Ʒ��� ���� ����� ����Ͻÿ� 
SELECT cs.student_no, s.student_name, c.class_name
    FROM CLASS_STUDENT CS
    LEFT JOIN CLASS C
    ON cs.class_no = C.class_no
    LEFT JOIN STUDENT S
    ON cs.student_no = s.student_no
    order by cs.student_no asc;
    
    
--����

CREATE TABLE ACADEMY_C (
    STUDENT_NO NUMBER PRIMARY KEY,
    STUDENT_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO ACADEMY_C VALUES (1004, '�ڷ�');
INSERT INTO ACADEMY_C VALUES (1006, '����');
INSERT INTO ACADEMY_C VALUES (1001, '����');
INSERT INTO ACADEMY_C VALUES (1007, '��Ź');

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
--------���� ������----------------------------------------------
/*
���̺� ������ ��ġ�ؾ��Ѵ�. �÷��� ���� ��

UNION�� - ���̺� ������ ��ġ�ϴ� ���̺���� �����Ͽ� ��ȸ�Ѵ�. -> Data Merge 
        UNION ALL: �ߺ� �����͸� �����Ͽ� �״�� ����Ѵ�.
        UNION : �ߺ������ʹ� �ϳ��� ó���Ѵ�.
����(UNION ALL)
SELECT *
    FROM ���̺� 1
    UNION ALL
    SELECT *
    FROM ���̺� 2;
    
����(UNION)
SELECT *
    FROM ���̺� 1
    UNION
    SELECT *
    FROM ���̺� 2;

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
SELECT * --INTERSECT: ����� �κи� �ߺ��� �����Ͽ� ��ȸ.
    FROM ACADEMY_A
    INTERSECT
    SELECT *
    FROM ACADEMY_B;
    
    
--MINUS
SELECT * -- A���̺��� B���̺�� �ߺ��Ǵ� �����͸� �����ϰ� ��ȸ.
    FROM ACADEMY_A
    MINUS
    SELECT *
    FROM ACADEMY_B;
    
    
--���� ����
SELECT T1.STUDENT_NO,
    (SELECT T2.STUDENT_NAME
    FROM ACADEMY_B T2
    WHERE T2.STUDENT_NO = T1.STUDENT_NO) AS NAME
FROM ACADEMY_A T1;

    
    
    


