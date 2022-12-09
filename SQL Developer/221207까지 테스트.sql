--���̺���� ����: CREATE TABLE ���̺�� (�÷��� �ڷ���);
--NO,NAME,AGE = COLUMN_NAME
--NUMBER, VARCHAR2(20), NUMBER = DATA_TYPE
--���� ���̺��� �����Ϸ��� �ϸ� �̸��� �̹� �ִٰ��ϸ鼭�ȵ˴ϴ�. 
-- �� name is already used by an existing object
--������ ����: ��Ʈ�� + ENTER
CREATE TABLE EMP (
    NO NUMBER,
    NAME VARCHAR2(20),
    AGE NUMBER
);

CREATE TABLE CUSTOMER (
    ID NUMBER PRIMARY KEY, --PRIMARY KEY�� Ư¡: UNIQUE(����), NOT NULL
    --PRIMARY KEY: �ߺ��� �����ʴ´�. NULL�̸� �ȵȴ�(NOT NULL)
    --�� �����͸� �����ϱ� ���� ����ϸ�, �����Ͱ� �ߺ��� �� ����, null�� ���� �� ����.
    NAME VARCHAR2(20) NOT NULL, --NULL�� ���� �ʰڴ�. = NULLABEL No
    ADDRESS VARCHAR(100)
);

CREATE TABLE ORDERS (
    ORDER_ID NUMBER PRIMARY KEY,
    SALESMAN_ID NUMBER,
    ORDER_DATE DATE NOT NULL
);

CREATE TABLE CATEGORIES(
    CATEGORY_ID NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(100) NOT NULL
);

CREATE TABLE LOCATION (
    LOCATION_ID NUMBER PRIMARY KEY,
    ADDRESS VARCHAR2(255) NOT NULL,
    POSTAL_CODE VARCHAR2(20),
    CITY VARCHAR2(50)
);




--������ �ֱ�   INSERT��
--���1. INSERT INTO ���̺��(���� �κ�, �κ�, ...) VALUES (..., ..., ...);
--���1�� ������ ���� ( ) �ȿ� ���� �÷� ���� VALUE���� �־��ݴϴ�.

--���2. INSERT INTO ���̺�� VALUES (... ... ...);
--���2�� ���̺��ִ� ��� �÷��� VALUES ���� �־��ݴϴ�. ������ �÷���������Դϴ�.
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES (1, '�浿', '��õ');--�Ϻ� �÷��� ����� ���.
INSERT INTO CUSTOMER VALUES (2, '�ƽ�', '����');--��ü �÷��� �� ����� ���.



INSERT INTO CUSTOMER(ID, NAME) VALUES (3, '������');
--����1: INSERT INTO CUSTOMER(ADDRESS) VALUES ('����������');
--cannot insert NULL into ("TEST"."CUSTOMER"."ID")
--����2: INSERT INTO CUSTOMER(ID, ADDRESS) VALUES ('4','����������');
--cannot insert NULL into ("TEST"."CUSTOMER"."NAME")
--���� 1 2 =====> NULLABLE�� NO�� ��쿡�� INSERT INTO �Ҷ� �ݵ�� �����͸� �־��־�� �մϴ�.

INSERT INTO CUSTOMER VALUES(4, '����', ''); --�ּҿ� ������ �־ ���
--���鵵 NULL������ ó���˴ϴ�.

INSERT INTO CUSTOMER VALUES(5, '����', NULL); --���� NULL�� �Է��� �� ���.
--NULL�� ��� ������ �÷��� ��� ���� NULL���� �� �� �ִ�.

INSERT INTO CUSTOMER(ID, NAME) VALUES(3, '����'); --�ߺ��� ID���� �־��� ���
--unique constraint (TEST.SYS_C006998) violated ���� �߻� (�������� ����)
--ID������ PRIMARY KEY(��Ī: PK)��� ���������� �ɾ�ξ���.(�ߺ��ɼ� ������, NOT NULL�̴�)


--INSERT INTO CUSTOMER(ID) VALUES(6);--NAME���� �����������Ƿ� NAME���� NULL�� ���µ� NAME�� NOT NULL�̹Ƿ� ������ �߻��Ѵ�.
--�����߻�: cannot insert NULL into ("TEST"."CUSTOMER"."NAME")


INSERT INTO CUSTOMER VALUES(6, '������ȣ����',NULL);

--NUMBER(p,s)  p: �ִ� ��ȿ �ڸ���, s: �Ҽ� �ڸ���(���: �Ҽ��� ����, ����: �Ҽ��� �̻� �ڸ��� ���)
--NUMBER(5,2)  ��ü 5�ڸ� Ȯ��(���� 3�ڸ�,�Ҽ�2�ڸ�)   �Ҽ��� ���� 3�ڸ����� �ݿø��ؼ� 2�ڸ����� ǥ��   123.56
--NUMBER(5,-1) -> ��ü 5�ڸ� Ȯ��(���� 3�ڸ�, �Ҽ��� ����(����4)���� ù�ڸ��� �ݿø��� ��.  1234.1 �� Ȯ���ϸ� ���̺� 1230�� ����.


CREATE TABLE EMP2
( 
    EMPNO NUMBER(5) NOT NULL, --5�ڸ��� ������ ���� �� �ֽ��ϴ�.
    NUM1 NUMBER(5), --5�ڸ��� ����
    NUM2 NUMBER(5,2), --5�ڸ��� ��   (���� 3�ڸ�����, �Ҽ������� 2�ڸ����� ǥ��. -> ��, �Ҽ��� ���� 3��° �ڸ����� �ݿø�.)
    NUM3 NUMBER(5,-1) --5�ڸ��� ����, BUT �Ҽ������� ����1��° �ڸ����� �ݿø�.
);

INSERT INTO EMP2 VALUES(12345, 12345, 123.123, 12345.123); --12345, 12345, 123.12, 1230


------------ALTER��
ALTER TABLE CUSTOMER ADD GENDER VARCHAR2(9); --CUSTOMER�� GENDER��� �̸��� �÷��� �߰�. VARCHAR2(9)�� ����., DATA_DEFAULT������ 'NONE'�� ������ NOT NULL �� ����.
ALTER TABLE CUSTOMER RENAME COLUMN GENDER TO GEN; --RENAME COLUMN�� �̿��Ͽ� �÷��� �̸��� ����. A�� TO B B�� �ٲ۴�.
ALTER TABLE CUSTOMER RENAME COLUMN GEN TO GENDER; --�ٽ� ���󺹱�
ALTER TABLE CUSTOMER MODIFY GENDER VARCHAR2(100); --GENDER�� ���̺� ũ�⸦ 9���� 100����. ���̺� ũ�� ����.
ALTER TABLE CUSTOMER MODIFY GENDER VARCHAR2(100) DEFAULT 'NONE' NOT NULL; --���̺� ũ��, DATA_DEFAULT��, NULLABLE ���� �ٲ�.
ALTER TABLE CUSTOMER MODIFY GENDER NUMBER;--GENDER�� Ÿ��(�ڷ���)�� NUMBER�� �ٲߴϴ�
ALTER TABLE CUSTOMER MODIFY GENDER NOT NULL;--GENDER�� ���������� �߰��մϴ�.
COMMENT ON COLUMN CUSTOMER.GENDER IS '����: �ڸ�Ʈ �� �÷� Ŀ���͸�.���� ����';

ALTER TABLE CUSTOMER DROP COLUMN GENDER; --DROP COLUMN���� �÷� ����.


-----------------------------2022.12.07-----------------------------


-------------------------2�� SQL �⺻ 20��°ȭ��
ALTER TABLE EMP ADD SALARY NUMBER; --2�� ����1. EMP ���̺� NUMBER �ڷ����� ���� SALARY �÷��� �߰��Ͻÿ� 
ALTER TABLE EMP MODIFY SALARY NOT NULL; --2�� ����2. EMP ���̺��� SALARY �÷��� NOT NULL ���������� �����Ͻÿ�
COMMENT ON COLUMN EMP.NO IS '����'; --2�� ����3. EMP ���̺��� ��� �÷��� �ڸ�Ʈ�� �ۼ��Ͻÿ�
COMMENT ON COLUMN EMP.NAME IS '�̸�';
COMMENT ON COLUMN EMP.AGE IS '����';
COMMENT ON COLUMN EMP.SALARY IS '����';
ALTER TABLE ORDERS ADD CUSTOMER_NAME VARCHAR2(50) NOT NULL;--����4. ORDERS ���̺� VARCHAR(50) �ڷ����̰� NOT NULL��������� ���� CUSTOMER_NAME �÷��� �߰��Ͻÿ�
ALTER TABLE ORDERS MODIFY SALESMAN_ID VARCHAR2(50); -- ����5. ORDERS ���̺��� SALESMAN_ID�� �ڷ����� VARCHAR(50)�� �����Ͻÿ�
ALTER TABLE ORDERS RENAME COLUMN SALESMAN_ID  TO SALESMAN_NAME; --����6. ORDERS ���̺��� SALESMAN_ID �÷��� �̸��� SALESMAN_NAME���� �����Ͻÿ�
ALTER TABLE ORDERS MODIFY ORDER_DATE NULL; --����7. ORDERS ���̺��� ORDER_DATE �÷��� NULL ���������� �����Ͻÿ�
COMMENT ON COLUMN ORDERS.ORDER_ID IS '�ֹ�ID'; --����8. ORDERS ���̺��� ��� �÷��� �ڸ�Ʈ�� �ۼ��Ͻÿ�
COMMENT ON COLUMN ORDERS.SALESMAN_NAME IS '�Ǹſ�';
COMMENT ON COLUMN ORDERS.ORDER_DATE IS '�ֹ���¥';
COMMENT ON COLUMN ORDERS.CUSTOMER_NAME IS '�ֹ���';

---------------------------------------------------------------------
--2�� 21. ���̺� ����.
DROP TABLE EMP;
DROP TABLE CATEGORIES;
DROP TABLE CUSTOMER;
DROP TABLE EMP2;
DROP TABLE LOCATION;
DROP TABLE ORDERS;

----------------------------4. ������ �߰�/����/����--------------------------------
--���� 6 Ư�� �������� ��¥ ������ �߰�.
INSERT INTO ORDERS(ORDER_ID,SALESMAN_ID,ORDER_DATE) VALUES(1003, 2002, SYSDATE);--SYSDATE: ���� �ð�.
INSERT INTO ORDERS(ORDER_ID,SALESMAN_ID,ORDER_DATE) VALUES(1004, 2002, '2022-08-27'); --ORDER_ID�� PK�̹Ƿ� ����ũ��.
INSERT INTO ORDERS(ORDER_ID,SALESMAN_ID,ORDER_DATE) VALUES(1005, 1002, TO_DATE('2022-08-27', 'YYYY-MM-DD'));
INSERT INTO ORDERS(ORDER_ID,SALESMAN_ID,ORDER_DATE) VALUES(1006, 1002, TO_DATE('2022-08-27 10:23:53', 'YYYY-MM-DD HH24:MI:SS'));
--TO_DATE('�Է��� ��¥','��������')
-------------------------------2�� 31������ ���۵Ǵ� ���� 1~6-----------------------
--����1. ���� ������ �����ϱ� ���� BOOK ���̺��� �����Ͻÿ�
CREATE TABLE BOOK(
BOOK_NO NUMBER PRIMARY KEY,
TITLE VARCHAR2(50),
PUBLISHER VARCHAR2(100),
PRICE NUMBER
);

--����2. BOOK ���̺� �Ʒ��� ���� ���� �����͸� �߰��Ͻÿ�
INSERT INTO BOOK VALUES(1,'����1','��󸶴�',30000);
INSERT INTO BOOK VALUES(2,'����2','��󸶴�',30000);
INSERT INTO BOOK VALUES(3,'��������������Ʈ','�Ѻ��̵��',50000);
INSERT INTO BOOK VALUES(4,'�ڹٰ��ߵ���','��������',NULL);

--����3. EMP  ���̺� �Ʒ��� ���� �ֹ� �����͸� �߰��Ͻÿ�
INSERT INTO EMP VALUES(NULL,NULL,NULL);
INSERT INTO EMP(NO) VALUES(1);
INSERT INTO EMP(NAME,AGE) VALUES('�Ѹ�',10);
INSERT INTO EMP VALUES(1,'�Ѹ�',10);
INSERT INTO EMP VALUES(1,'�Ѹ�',10);

--����4 . �Ʒ��� ���� ����ó ���̺��� ����� �����͸� �߰��Ͻÿ�
CREATE TABLE CONTACT(
CONTACT_NO NUMBER PRIMARY KEY,
FIRST_NAME VARCHAR2(5),
LAST_NAME VARCHAR2(10),
EMAIL VARCHAR2(100),
PHONE VARCHAR2(500)
);
ALTER TABLE CONTACT MODIFY FIRST_NAME VARCHAR2(50);
ALTER TABLE CONTACT MODIFY LAST_NAME VARCHAR2(50);

INSERT INTO CONTACT VALUES(1,'��','����','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACT VALUES(2,'��','�ÿ�','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACT VALUES(3,'��','��ȣ','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACT VALUES(4,'��','����','jeni.levy@gmail.com','010-3171-2341');
INSERT INTO CONTACT VALUES(5,'��','����','fern.head@gmail.com',null);

--����5. �Ʒ��� ���� Ķ���� ���̺��� ����� �����͸� �߰��Ͻÿ�
CREATE TABLE CALENDA (
MONTH DATE,
DAY_WEEK DATE,
DAY DATE
);

ALTER TABLE CALENDA MODIFY MONTH VARCHAR2(10);
ALTER TABLE CALENDA MODIFY DAY VARCHAR2(10);
ALTER TABLE CALENDA MODIFY DAY_WEEK VARCHAR2(10);

INSERT INTO CALENDA VALUES('1', '��', '1');
INSERT INTO CALENDA VALUES('1', '��', '2');
INSERT INTO CALENDA VALUES('1', 'ȭ', '3');
INSERT INTO CALENDA VALUES('1', '��', '4');
INSERT INTO CALENDA VALUES('1', '��', '5');
INSERT INTO CALENDA VALUES('1', '��', '6');
INSERT INTO CALENDA VALUES('1', '��', '7');


--����6. ������Ʈ ���̺��� ����� �����͸� �߰��Ͻÿ�.
CREATE TABLE PRESENTSET (
NO NUMBER PRIMARY KEY,
NAME VARCHAR2(50),
PRICE NUMBER
);
INSERT INTO PRESENTSET VALUES(1, '��ġ��Ʈ', 100000);
INSERT INTO PRESENTSET VALUES(2, '��Ǫ��Ʈ', 200000);
INSERT INTO PRESENTSET VALUES(3, '������ǰ��Ʈ', 300000);
INSERT INTO PRESENTSET VALUES(4, '�ֹ��ǰ��Ʈ', 400000);
INSERT INTO PRESENTSET VALUES(5, '��ǿ�������', 500000);
INSERT INTO PRESENTSET VALUES(6, 'LDC�����', 600000);
INSERT INTO PRESENTSET VALUES(7, '��Ʈ��', 700000);
INSERT INTO PRESENTSET VALUES(8, '������TV', 800000);
INSERT INTO PRESENTSET VALUES(9, '�巳��Ź��', 900000);
INSERT INTO PRESENTSET VALUES(10,'���ʹ������', 1000000);

-------------------------------------------------------------------------------
---------------������ ���� UPDATE �� --------------------------------------------
--����:  UPDATE ���̺��̸� SET �÷� = ������ �� WHERE �÷� = Ư����;
--������ ǥ�� : UPDATE ���̺��̸� SET ( �÷��̸� = ������ �� ), ... WHERE �÷��� = Ư�� ��;
UPDATE CUSTOMER SET ADDRESS = '����'; --WHERE�� ������ ���� �ʴ´ٸ�, 5���� �� ��ü�� '����' �� �ٲ��.
--WHERE �� ������.  � �������� ADDRESS�� �ٲܰ��ΰ�? �� ���� �� ������.
UPDATE CUSTOMER SET ADDRESS = '����' WHERE ID = 2;--CUSTOMER�� ADDRESS�� '����'�� �ٲܰǵ� ID���� 2�ΰ��� ADDRESS�� �ٲ�޶�.
UPDATE CUSTOMER SET NAME = '����',address='�︪��' WHERE ID = 3;

UPDATE ORDERS SET ORDER_DATE = SYSDATE WHERE ORDER_ID = 1004;

---------------������ ���� DELETE �� --------------------------------------------
--����1: DELETE FROM ���̺��̸� WHERE �÷� = Ư����;      <- Ư�� ���ڵ� ����.(���ڵ� = ��)
--����2: DELETE FROM ���̺��̸�;                        <- ��ü ���ڵ� ����.(���ڵ� = ��)
DELETE FROM CUSTOMER WHERE ID = 4; --CUSTOMER�� ID���� 4�� ���ڵ带 �����մϴ�.
DELETE FROM CUSTOMER WHERE NAME = '�Ѹ�'; --CUSTOMER���� NAME�� '�Ѹ�'�� ���� ���ڵ带 �����մϴ�.
DELETE FROM CUSTOMER; --CUSTOMER ��ü ���ڵ带 �����մϴ�.

--����3: DELETE FROM ���̺��̸� WHERE �÷� = Ư���� AND �÷� = Ư����;
--������ ����: DELETE FROM ���̺��̸� WHERE [(�÷� = Ư����) AND (�÷� = Ư����)];
DELETE FROM ORDERS WHERE ORDER_ID = 1004 AND SALESMAN_ID = 2002; --ORDER_ID�� 1004�鼭 SALESMAN_ID�� 2002�� �༮�� �����մϴ�.


----------------------2�� 37 ����(UPDATE) ---------------------------------------
UPDATE BOOK SET PRICE = 10000 WHERE BOOK_NO = 1; --���� ���߷��� �ʱ�ȭ �Ѱ���
UPDATE BOOK SET PRICE = 11000 WHERE BOOK_NO = 2; --���� ���߷��� �ʱ�ȭ �Ѱ���
--����1. BOOK ���̺��� ������ȣ�� 4�� ������ ������ �ڹٰ��ߵ����� �����Ͻÿ�
UPDATE BOOK SET TITLE = '�ڹٰ��ߵ���' WHERE BOOK_NO = 4;
--����2. BOOK ���̺��� ���ǻ簡 '��󸶴�'�� ������ ������ ��� 30000������ �����Ͻÿ�
UPDATE BOOK SET PRICE = 30000 WHERE PUBLISHER = '��󸶴�';

--CUSTOMER�ʱ�ȭ
INSERT INTO CUSTOMER VALUES (1,'�Ѹ�','��õ');
INSERT INTO CUSTOMER VALUES (2,'�Ѹ�','');
INSERT INTO CUSTOMER VALUES (3,'ȫ�浿','');
INSERT INTO CUSTOMER VALUES (4,'��ġ','');

--����3. CUSTOMER ���̺��� ��� ���� �̸��� �Ѹ�, �ּҸ� ��õ���� �����Ͻÿ� 
UPDATE CUSTOMER SET NAME = '�Ѹ�',ADDRESS = '��õ';

----------------------2�� 42 ����(DELETE) ---------------------------------------
--BOOK �ʱ�ȭ
UPDATE BOOK SET PRICE = 10000 WHERE BOOK_NO = 1; --���� ���߷��� �ʱ�ȭ �Ѱ���
UPDATE BOOK SET PRICE = 11000 WHERE BOOK_NO = 2; --���� ���߷��� �ʱ�ȭ �Ѱ���
--����1. BOOK ���̺��� ������ ����2�̰� ���ǻ簡 ��󸶴��� ������ �����Ͻÿ�
DELETE FROM BOOK WHERE TITLE = '����1' AND PUBLISHER = '��󸶴�';

--����2. BOOK���̺��� ������ȣ�� 3�� ������ �����Ͻÿ�.
DELETE FROM BOOK WHERE BOOK_NO = 3;

--����3. BOOK���̺��� ������ ���� ������ �����Ͻÿ�   NULL���� �����Ҷ��� IS NULL Ȱ��.
DELETE FROM BOOK WHERE PRICE IS NULL;

--����4. BOOK ���̺��� ��� ������ �����Ͻÿ�
DELETE FROM BOOK;

-------------------------------------------------------------------------------
-----------------------������ ��ȸ SELECT��---------------------------------------
--����1: SELECT*FROM ���̺��̸�;   * = ��� ������
--����2: SELECT �÷�1, �÷�2 ... FROM ���̺� �̸�;
SELECT*FROM CUSTOMER;
SELECT ID, NAME FROM CUSTOMER;
SELECT NAME AS as�º�Ī FROM CUSTOMER; --AS ��Ī��

--SELECT��
select * from customer;
SELECT ID, NAME FROM CUSTOMER; --������������
SELECT NAME, ID FROM CUSTOMER; --������������


-------��ȸSELECT + ���� ORDER BY--------------------------------------
--����1: SELECT*FROM ���̺��̸� ORDER BY �÷� ASC; ��������
--����2: SELECT*FROM ���̺��̸� ORDER BY �÷� DESC; ��������

SELECT * FROM CUSTOMER ORDER BY ID ASC; --��������
SELECT * FROM CUSTOMER ORDER BY ID DESC; --��������
SELECT * FROM CUSTOMER ORDER BY ADDRESS ASC; --��������

--------��ȸ SELECT + �׷�ȭ GROUP BY ----------------------------------
--����: SELECT*FROM ���̺� �̸� GROUP BY �÷�;
SELECT * FROM GIFT; --����Ʈ ��ü�� ������.
SELECT TYPE FROM GIFT; -- Ÿ���� �׳� �̾ƿ�.
--�׷����� ���ؼ� ��ġ�°� �ϳ��� ���ĺ��ô�.
SELECT TYPE FROM GIFT GROUP BY TYPE; --��ġ�� ��Ҹ� �ϳ��� ��ħ. TYPE �÷����� �׷�ȭ(�ߺ��� �����͸� �׷����Ѵ�)
SELECT * FROM GIFT GROUP BY TYPE; --����, �׷����� �ϱ⿡�� ������ �ʴ� �༮���� �����Ѵ�.

SELECT TYPE, SUM(PRICE)AS SUM FROM GIFT GROUP BY TYPE;--TYPE���� �׷����� �ϴµ� ��ǰ(1)��Ȱ��ǰ(3��)����(1)����(5)�� pirce�� sum�ϰ� �װ� ���.
SELECT TYPE, COUNT(NAME)AS namecount FROM GIFT GROUP BY TYPE;


------------------------���ǰ˻�(WHERE) ------------------------------------
/*
�� ������ : = , != , > , < , >= , <= 
�� ������ : AND, OR, NOT
��� ������ : ()�켱���� ����   , * �� , / , + , - 
�ռ� ������ : ||   ���ڿ� ���ڸ� �����Ҷ� ����Ѵ�.
SELECT '�̸�:' || NAME || '�Դϴ�.'AS INTRO FROM CUSTOMER;

���� ������ 
BETWEEN �� ���� ������ �ش��ϸ� �˻�    SELECT * FROM CUSTOMER WHERE ID BETWEEN 2 AND 4;  2�ϰ� 4 ���̿� �ִ°�.
NOT BETWEEN �� ���� ������ �����ϰ� �˻� SELECT * FROM CUSTOMER WHERE ID NOT BETWEEN 2 AND 4; 2�ϰ� 4 ���̿� ���°͵�.
IN ��ȣ �ȿ� ���� ��ġ�ϸ� �˻� SELECT * FROM CUSTOMER WHERE ID IN(1,2,3);  ID�� 1,2,3�� ���ڵ带 ������.
NOT IN ��ȣ�ȿ� ���� ��ġ���� ������ �˻�. SELECT * FROM CUSTOMER WHERE ID NOT IN (1,2,3); ID�� 1,2,3�� �ƴѾֵ��� ������.

���� ������
LIKE : �ش� ���ڿ��� �����ϸ� �˻��Ѵ�.
    SELECT * FROM CUSTOMER WHERE NAME LIKE '��%' ��~ �� �����ϴ°�
    SELECT * FROM CUSTOMER WHERE NAME LIKE '%��%' ~��~ �ȿ� �� �� �� ��
    SELECT * FROM CUSTOMER WHERE NAME LIKE '%ġ' ~ġ �� ������ ��.

�� üũ ������
IS NULL : NULL ��
    SELECT * FROM CUSTOMER WHERE ADDRESS IS NULL; �ּҰ� NULL���ΰ� ������.

IS NOT NULL : NULL���� �ƴ�
    SELECT * FROM CUSTOMER WHERE ADDRESS IS NOT NULL; �ּҰ� NULL���� �ƴѰ� ������.
*/

-- �� ������ (����) -----------------------
SELECT * FROM CUSTOMER WHERE ID=1;
SELECT * FROM CUSTOMER WHERE ID>1; --1���� ū
SELECT * FROM CUSTOMER WHERE ID<4; --4���� ����
SELECT * FROM CUSTOMER WHERE ID>=1; --1���� ũ�ų� ����
SELECT * FROM CUSTOMER WHERE ID<=4; --4���� �۰ų� ����
SELECT * FROM CUSTOMER WHERE ID!=2; --���̵� 2�� �ƴ�
-- �� ������ (����) ------------------------
SELECT * FROM CUSTOMER WHERE NAME = '�Ѹ�'; --NAME�� '�Ѹ�' ã����
SELECT * FROM CUSTOMER WHERE NAME != '�Ѹ�'; --NAME�� '�Ѹ�' �ƴѳ��� ã����
SELECT * FROM CUSTOMER WHERE NAME > '�Ѹ�'; --NAME�� '�Ѹ�'���� �ʴ³�(�����ټ�)
SELECT * FROM CUSTOMER WHERE NAME < '�Ѹ�'; --NAME�� '�Ѹ�'���� ������(�����ټ�)
SELECT * FROM ORDERS WHERE ORDER_DATE > ('2022-01-03');  --1�� 3�Ϻ��� ����
SELECT * FROM ORDERS WHERE ORDER_DATE <= ('2022-01-03');  --1�� 3�ϱ��� (��������)
-- �� ������  ------------------------
SELECT * FROM CUSTOMER WHERE NAME = '�Ѹ�' AND ADDRESS = '����'; -- NAME�� �Ѹ� �̸鼭 ADDRESS�� ������
SELECT * FROM CUSTOMER WHERE ADDRESS = '����' OR ADDRESS = '��õ'; -- ADDRESS�� ���� OR ��õ ��
SELECT * FROM CUSTOMER WHERE NOT ADDRESS = '����'; --ADDRESS�� ������ �ƴ�, �׷��� NULL�� �ҷ���������.

-- ��� ������
SELECT * FROM ORDERS;
SELECT ORDER_ID + SALESMAN_ID AS PLUS FROM ORDERS;
SELECT ORDER_ID + SALESMAN_ID * ORDER_ID AS �ڰ��մ� FROM ORDERS;
SELECT (ORDER_ID + SALESMAN_ID) * ORDER_ID AS �մ������ڰ� FROM ORDERS;

--���ڿ� ����
SELECT NAME AS INTRO FROM CUSTOMER;
SELECT '�̸�:'||NAME ||'�Դϴ�.' AS INTRO FROM CUSTOMER;


----------------------2�� 52������ ���� -----------------------------------------
--����1. BOOK ���̺��� ������ 11000��, 25000�� ������ ���� ã���ÿ�
SELECT TITLE, PRICE FROM BOOK WHERE PRICE = 10000 OR PRICE = 25000;
--����2. BOOK ���̺��� 30000�� ���� ��� ������ ã���ÿ�
SELECT TITLE, PRICE FROM BOOK WHERE PRICE > 30000;
--����3. BOOK ���̺��� 10000�̻� 30000������ ������ ������ ã���ÿ�
SELECT TITLE, PRICE FROM BOOK WHERE PRICE >= 10000 AND PRICE <=30000;
--����4. BOOK ���̺��� ���ǻ簡 �Ѻ��̵�� �Ǵ� ���������� ������ ã���ÿ�
SELECT TITLE, PUBLISHER FROM BOOK WHERE PUBLISHER = '�Ѻ��̵��' OR PUBLISHER='��������';
--����5. ORDERS ���̺��� 2020�� 1�� 2�� ���Ŀ� ���� �ֹ��� ã���ÿ�
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE ORDER_DATE > ('2022-01-02');
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE order_date > TO_DATE('2022-01-02', 'YYYY-MM-DD');--TO_DATE: ���ڿ��� ��¥ �������� �ٲ���.


--����6. ORDERS ���̺��� 2020�� 1�� 1�Ͽ� ���� �ֹ��� ã���ÿ�
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE ORDER_DATE = ('2022-01-02');
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE order_date = TO_DATE('2022-01-02', 'YYYY-MM-DD');

--������
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE order_date < SYSDATE; --���� ��¥���� ����.


---BETWEEN------NOT BETWEEN------���� ������ --------IN-------NOT IN------------
SELECT * FROM CUSTOMER WHERE ID BETWEEN 2 AND 4; --2~4���̿� �ִ� �ֵ� SELECT
SELECT * FROM CUSTOMER WHERE ID NOT BETWEEN 2 AND 4; --2~4���̰� �ƴѰ�.
SELECT * FROM CUSTOMER WHERE ID IN (1,2,3); --ID���� 1,2,3�� ��.
SELECT * FROM CUSTOMER WHERE ID NOT IN (1,2); --ID���� 1,2�� �ƴ� ��.

-----��%-------%��%------%ġ------���� ������ LIKE---------------------------------
SELECT * FROM CUSTOMER WHERE NAME LIKE '��%'; --�� �� �����ϴ� ���ڿ�
SELECT * FROM CUSTOMER WHERE NAME LIKE '%��%'; --~~��~~�� ���� ���ڿ�
SELECT * FROM CUSTOMER WHERE NAME LIKE '%ġ'; -- ~ġ �� ������ ���ڿ� 


---------IS NULL---------------�� üũ ������ -----------IS NOT NULL-------------
SELECT * FROM CUSTOMER WHERE ADDRESS IS NULL; --ADDRESS�� NULL���ΰ� ������.

SELECT * FROM CUSTOMER WHERE ADDRESS IS NOT NULL; --ADDRESS�� NULL���� �ƴѰ� ������.


------------------------2�� 54������ ����------------------------------------
--����1. BOOK ���̺��� 10000�̻� 30000������ ������ ������ ã���ÿ�
SELECT * FROM BOOK WHERE PRICE BETWEEN 10000 AND 30000;

--����2. CONTACTS ���̺��� �达�� �־� ���� ���� ����� ã���ÿ�
SELECT * FROM CONTACTS WHERE FIRST_NAME IN('��','��');

--����3. GIFT ���̺��� ��Ʈ��, ������TV, ���ʹ������ ã���ÿ�
SELECT * FROM GIFT WHERE NAME IN('��Ʈ��', '������TV', '���ʹ������');

--����4. GIFT ���̺��� ��Ȱ��ǰ�̰ų� ������ ������ ã���ÿ�
SELECT * FROM GIFT WHERE TYPE IN('��Ȱ��ǰ', '����');

--����5. GIFT ���̺��� ������ 300000���� 600000�� ������ ������ ã���ÿ�
SELECT * FROM GIFT WHERE PRICE BETWEEN 300000 AND 6000000;


------------------------2�� 56������ ����------------------------------------
--����1. CONTACTS ���̺��� ��ȭ��ȣ�� 2341�� ������ ����� ã���ÿ�
SELECT * FROM CONTACTS WHERE PHONE LIKE '%2341';
--����2. CONTACTS ���̺��� ��ȭ��ȣ�� 3171�� �����ϴ� ����� ã���ÿ�
SELECT * FROM CONTACTS WHERE PHONE LIKE('%3171%');
--SELECT * FROM CONTACTS WHERE PHONE IN('3171');
--����3. CONTACTS ���̺��� �̸����� ���̹��� ����ϸ鼭 ��ȭ��ȣ�� ���� ����� ã���ÿ�
SELECT * FROM CONTACTS WHERE EMAIL LIKE ('%naver%') AND PHONE IS NULL;
--����4. GIFT ���̺��� �̸��� ��ǰ�� ���Ե� ������ ã���ÿ�
SELECT * FROM GIFT WHERE TYPE LIKE '%��ǰ%';
--����5. GIFT ���̺��� �̸��� ��Ʈ�� �����鼭 300000�������� ������ ã���ÿ�
SELECT * FROM GIFT WHERE TYPE LIKE '%��ǰ' AND PRICE < 300000;

------------------------------------------------------------------------------
---�Լ�---------------------------

SELECT CHR(65) FROM DUAL; --�ƽ�Ű�ڵ� A

SELECT LOWER('JENNIE') FROM DUAL; --�ҹ��ڷ� �����帳�ϴ�
SELECT UPPER(EMAIL) FROM CONTACTS; --�빮�ڷ� �����帳�ϴ�.

SELECT LTRIM('                       JENNIE') FROM DUAL; --���ʿ������� ���� ����
SELECT LTRIM('����ũ', '��') FROM DUAL; --���ʿ������� ���� ����, ��ġ�ϴ� �ܾ �ִٸ� �´� ����

SELECT RTRIM('JENNIE                     ') FROM DUAL; --�����ʿ������� ���� ����
SELECT RTRIM('����ũ', '��ũ') FROM DUAL; --�����ʿ������� ���� ����, ��ġ�ϴ� �ܾ �ִٸ� �´� ����

SELECT TRIM('             JEN   NIE                  ') FROM DUAL; --���ʿ� �ִ� ���� ����.
SELECT TRIM(LEADING '��' FROM '����ũ') FROM DUAL; --���ʿ������� �� �дµ� '��'�̶�� ���ڰ� �ش�Ǹ� ���ְڴ�.
SELECT TRIM(TRAILING 'ũ' FROM '����ũ') FROM DUAL; --���ʿ������� �� �дµ� 'ũ'�̶�� ���ڰ� �ش�Ǹ�  ���ְڴ�.
SELECT TRIM(BOTH '��' FROM '����ũ') FROM DUAL; --���ڿ� ���ʿ��� �дµ� �ش��ϴ� ���ڰ� ������ ���ְڴ�.

SELECT SUBSTR('����ũ����', 3, 2)FROM DUAL; --���ڿ��� 3��°���� 2�ڸ� �аڴ�.
SELECT LENGTH('����ũ') FROM DUAL; --���ڿ��� ���̸� ��ȯ�Ѵ�.
SELECT REPLACE('����ũ����','����','����') FROM DUAL; --REPLACE('���ڿ�','�ٲ� ���ڿ� ����', '���� �Է��� ���ڿ�') 
SELECT REPLACE(LAST_NAME,'��','��') FROM CONTACTS;


--------------------------------------------------------------------------------
--221208


--�μ� ���̺� �����.

CREATE TABLE DEPT ( 
    DEPT_NO NUMBER PRIMARY KEY, --�μ���ȣ
    DEPT_NAME VARCHAR2(20) NOT NULL, -- �μ���
    DEPT_ADDRESS VARCHAR2(100) -- �μ��ּ�
);

INSERT INTO DEPT VALUES(1, '�λ��','');
INSERT INTO DEPT VALUES(2, '������','');
INSERT INTO DEPT VALUES(3, 'ȫ����','');
INSERT INTO DEPT VALUES(4, '������','');

SELECT * FROM DEPT;

--��� ���̺� �����.
DROP TABLE SAWON;
CREATE TABLE SAWON (
    SAWON_NO NUMBER PRIMARY KEY, --��� ��ȣ
    SAWON_NAME VARCHAR2(20) NOT NULL, --��� ��
    DEPT_NO NUMBER NOT NULL, --�μ���ȣ
    --CONSTRAINT: ����
    --�ܷ�Ű ������
    --CONSTRAINT [FK��] FOREIGN KEY([FK�� �� �÷� ��]) REFERENCES [PK�� ��ġ�ϴ� ���̺�] ([PK�� �÷� ��])
    CONSTRAINT FK_DEPT_NO FOREIGN KEY(DEPT_NO) REFERENCES DEPT (DEPT_NO)--�ܷ�Ű ����
    --�÷����� �ܷ�Ű�� �������� �⺻Ű�� �÷���� �����ص� �ȴ�.
    --FK���� �ٸ� ���̺�� �ߺ��� �Ǿ�� �ȵȴ�.
);

INSERT INTO SAWON VALUES(1001, '����', 3);
INSERT INTO SAWON VALUES(1002, '����', 1);
INSERT INTO SAWON VALUES(1003, '���', 2);
INSERT INTO SAWON VALUES(1005, '����', 5); --3��° DEPT_NO���� 5�� �� �� ���� FK�� �Ѱ��� ������ PK�� �ִ� �� �鸸 ����� �� �ִ�.
INSERT INTO SAWON VALUES(1004, '����', 4); --4������������ �����»�Ȳ�̾����� ���̺� �߰��Ͽ� 4���� ������ָ� ��� ����.

UPDATE SAWON SET dept_no = 10 WHERE sawon_name = '����'; --�̸��� ���� �� ����� �μ���ȣ�� 10���� �ٲٰ�ʹ�
--������ �߻�. DEPT_NO�� 10���� FK�� ������ PK�� �����Ƿ� ����� �Ұ����ϴ�.

DELETE FROM DEPT WHERE DEPT_NO = 1; --DEPT���̺��� DEPT_NO���� 1�� �༮�� �����ͽ��ϴ�.
--������ �߻�. ������ FK�� �����ǰ� �ֱ� ����.(SAWON���̺��� DEPT_NO)���� FK�� �������̴�.
--�ذ��� : 1���� ���� ���� �༮(����) �����ָ� ��������.
DELETE FROM SAWON WHERE DEPT_NO = 1; --�̰� �����ϰ� DELETE FROM DEPT WHERE DEPT_NO = 1; ���ָ� ���� ����



SELECT * FROM SAWON;
DELETE FROM SAWON WHERE SAWON_NO IN (1002,1003,1001);
DROP TABLE DEPT; --�θ� ���̺��� ���� ������� �ϸ� ������ �߻�. �ٸ����� �������̱⶧��.
DROP TABLE SAWON; --������̺��� ���� ����� ���� �θ� ���̺��� ����� ���������� ��������.

DROP TABLE DEPT CASCADE CONSTRAINTS; --���������� �����ϰ� ������ ����.




CREATE TABLE CLASS (
CLASS_NO NUMBER PRIMARY KEY,
CLASS_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO CLASS VALUES(1001,'����');
INSERT INTO CLASS VALUES(1002,'����');

SELECT * FROM CLASS;

CREATE TABLE STUDENT (
STUDENT_NO NUMBER PRIMARY KEY,
STUDENT_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO STUDENT VALUES(2001, '����');
INSERT INTO STUDENT VALUES(2002, '����');
INSERT INTO STUDENT VALUES(2003, '���');

SELECT * FROM STUDENT;

CREATE TABLE CLASS_STUDENT(
CS_NO NUMBER PRIMARY KEY,
CLASS_NO NUMBER not null,
STUDENT_NO NUMBER not null,
CONSTRAINT FK_CLASS_NO FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO),
CONSTRAINT FK_STUDENT_NO FOREIGN KEY (STUDENT_NO) references student (student_no)
 --CONSTRAINT [FK��] FOREIGN KEY([FK�� �� �÷� ��]) REFERENCES [PK�� ��ġ�ϴ� ���̺�] ([PK�� �÷� ��])
);

INSERT INTO CLASS_STUDENT VALUES (1, 1001, 2001);
INSERT INTO CLASS_STUDENT VALUES (2, 1002, 2001);
INSERT INTO CLASS_STUDENT VALUES (3, 1001, 2002);
INSERT INTO CLASS_STUDENT VALUES (4, 1002, 2002);
INSERT INTO CLASS_STUDENT VALUES (5, 1002, 2003);
SELECT * FROM CLASS_STUDENT;




