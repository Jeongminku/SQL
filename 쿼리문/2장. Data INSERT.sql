-- 초기화
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
DROP TABLE CUSTOMER;
DROP TABLE ORDERS;
DROP TABLE EMP;
CREATE TABLE CUSTOMER (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(100)
);
CREATE TABLE ORDERS (
    ORDER_ID    NUMBER PRIMARY KEY,
    SALESMAN_ID NUMBER,
    ORDER_DATE  DATE NOT NULL
);
CREATE TABLE EMP (
    NO   NUMBER,
    NAME VARCHAR2(20),
    AGE  NUMBER
);
-- 초기화 끝 ----------------------------------------------------------------------------------------------------------------------------------------

-- 예제1. CUSTOMER 테이블에 데이터 추가
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(1, '둘리', '인천');
INSERT INTO CUSTOMER VALUES(2, '둘리', '인천');

-- 예제2. 불완전한 데이터 추가
INSERT INTO CUSTOMER(ID, NAME) VALUES(3, '또치');
INSERT INTO CUSTOMER VALUES(4, '둘리', '');
INSERT INTO CUSTOMER VALUES(5, '홍길동', NULL);

-- 예제3. 키값이 중복되는 데이터 추가하기
INSERT INTO CUSTOMER(ID, NAME) VALUES(3, '홀길동'); -- 에러

-- 예제4. not null 컬럼에 빈값으로 데이터 추가하기
INSERT INTO CUSTOMER(ID) VALUES(6); -- 에러

-- 예제5. 날짜 데이터 추가
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1001, 2002, SYSDATE); --현재시간
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1002, 2002, '2022-08-27'); --특정시간

-- 예제6. 특정포맷으로 날짜 데이터 추가
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1003, 2002, TO_DATE('2022-08-27', 'YYYY-MM-DD')); --특정시간
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1004, 2002, TO_DATE('2022-08-27 10:10:10', 'YYYY-MM-DD HH24:MI:SS')); --특정시간

-- 퀴즈1. BOOK 테이블 생성
CREATE TABLE BOOK (
    BOOK_NO NUMBER PRIMARY KEY, --도서번호
    TITLE VARCHAR2(100) NOT NULL, --제목
    PUBLISHER VARCHAR2(100), --출판사
    PRICE NUMBER --가격
);

-- 퀴즈2. BOOK 테이블에 데이터 추가
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (1, '역사1', '상상마당', 10000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (2, '역사2', '상상마당', 11000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (3, '스프링웹프로젝트', '한빛미디어', 50000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER) VALUES (4, '자바프로그래밍', '생능출판');

-- 퀴즈3. EMP 테이블에 데이터 추가
INSERT INTO EMP VALUES (NULL,NULL,NULL);
INSERT INTO EMP (NO) VALUES (1);
INSERT INTO EMP (NAME, AGE) VALUES ('둘리', 10);
INSERT INTO EMP (NO, TITLE, AGE) VALUES (1, '둘리', 10);
INSERT INTO EMP (NO, TITLE, AGE) VALUES (1, '둘리', 10);

-- 퀴즈4. 연락처 테이블 만들고 데이터 추가하기
 CREATE TABLE CONTACTS 
  (
    CONTACT_NO NUMBER PRIMARY KEY,
    FIRST_NAME  VARCHAR2( 255 ) NOT NULL,
    LAST_NAME   VARCHAR2( 255 ) NOT NULL,
    EMAIL       VARCHAR2( 255 ) NOT NULL,
    PHONE       VARCHAR2( 20 )         
  );
INSERT INTO CONTACTS VALUES (1,'이','서연','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACTS VALUES (2,'이','시우','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACTS VALUES (3,'김','지호','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACTS VALUES (4,'김','윤서','jeni.levy@gmail.com','010-8121-2341');
INSERT INTO CONTACTS VALUES (5,'최','수아','fern.head@gmail.com', NULL);

-- 퀴즈5. 달력 테이블 만들고 데이터 추가하기
CREATE TABLE cal (
    MONTH   VARCHAR2(10), 
    Day_week     VARCHAR2(10),
    DAY    VARCHAR2(10)
);
insert into cal values ('1','일','1');
insert into cal values ('1','월','2');
insert into cal values ('1','화','3');
insert into cal values ('1','수','4');
insert into cal values ('1','목','5');
insert into cal values ('1','금','6');
insert into cal values ('1','토','7');

-- 퀴즈6. 선물세트 테이블 만들고 데이터 추가하기
CREATE TABLE gift (
    no    NUMBER,
    name  VARCHAR2(20),
    price NUMBER
);
insert into gift values(1,'참치세트',100000);
insert into gift values(2,'샴푸세트',200000);
insert into gift values(3,'세차용품세트',300000);
insert into gift values(4,'주방용품세트',400000);
insert into gift values(5,'산악용자전거',500000);
insert into gift values(6,'LCD모니터',600000);
insert into gift values(7,'노트북',700000);
insert into gift values(8,'벽걸이TV',800000);
insert into gift values(9,'드럼세탁기',900000);
insert into gift values(10,'양쪽문냉장고',1000000);




