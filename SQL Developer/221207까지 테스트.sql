--테이블생성 문법: CREATE TABLE 테이블명 (컬럼명 자료형);
--NO,NAME,AGE = COLUMN_NAME
--NUMBER, VARCHAR2(20), NUMBER = DATA_TYPE
--같은 테이블을 생성하려고 하면 이름이 이미 있다고하면서안됩니다. 
-- ㄴ name is already used by an existing object
--쿼리문 실행: 컨트롤 + ENTER
CREATE TABLE EMP (
    NO NUMBER,
    NAME VARCHAR2(20),
    AGE NUMBER
);

CREATE TABLE CUSTOMER (
    ID NUMBER PRIMARY KEY, --PRIMARY KEY의 특징: UNIQUE(유일), NOT NULL
    --PRIMARY KEY: 중복이 되지않는다. NULL이면 안된다(NOT NULL)
    --ㄴ 데이터를 구분하기 위해 사용하며, 데이터가 중복될 수 없고, null을 가질 수 없다.
    NAME VARCHAR2(20) NOT NULL, --NULL을 받지 않겠다. = NULLABEL No
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




--데이터 넣기   INSERT문
--방법1. INSERT INTO 테이블명(넣을 부분, 부분, ...) VALUES (..., ..., ...);
--방법1을 쓸때는 내가 ( ) 안에 넣은 컬럼 에만 VALUE값을 넣어줍니다.

--방법2. INSERT INTO 테이블명 VALUES (... ... ...);
--방법2는 테이블에있는 모든 컬럼에 VALUES 값을 넣어줍니다. 순서는 컬럼순서대로입니다.
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES (1, '길동', '인천');--일부 컬럼만 사용할 경우.
INSERT INTO CUSTOMER VALUES (2, '맥스', '뉴욕');--전체 컬럼을 다 사용할 경우.



INSERT INTO CUSTOMER(ID, NAME) VALUES (3, '쓰리맨');
--오류1: INSERT INTO CUSTOMER(ADDRESS) VALUES ('오스만제국');
--cannot insert NULL into ("TEST"."CUSTOMER"."ID")
--오류2: INSERT INTO CUSTOMER(ID, ADDRESS) VALUES ('4','오스만제국');
--cannot insert NULL into ("TEST"."CUSTOMER"."NAME")
--오류 1 2 =====> NULLABLE이 NO인 경우에는 INSERT INTO 할때 반드시 데이터를 넣어주어야 합니다.

INSERT INTO CUSTOMER VALUES(4, '순신', ''); --주소에 공백을 넣어본 경우
--공백도 NULL값으로 처리됩니다.

INSERT INTO CUSTOMER VALUES(5, '관우', NULL); --직접 NULL을 입력해 본 경우.
--NULL이 허용 가능한 컬럼일 경우 직접 NULL값을 줄 수 있다.

INSERT INTO CUSTOMER(ID, NAME) VALUES(3, '조조'); --중복된 ID값을 넣었을 경우
--unique constraint (TEST.SYS_C006998) violated 오류 발생 (제약조건 위반)
--ID값에는 PRIMARY KEY(약칭: PK)라는 제약조건을 걸어두었다.(중복될수 없으며, NOT NULL이다)


--INSERT INTO CUSTOMER(ID) VALUES(6);--NAME값을 지정안했으므로 NAME에는 NULL이 들어가는데 NAME은 NOT NULL이므로 오류가 발생한다.
--오류발생: cannot insert NULL into ("TEST"."CUSTOMER"."NAME")


INSERT INTO CUSTOMER VALUES(6, '강동의호랑이',NULL);

--NUMBER(p,s)  p: 최대 유효 자리수, s: 소수 자리수(양수: 소수점 이하, 음수: 소수점 이상 자릿수 출력)
--NUMBER(5,2)  전체 5자리 확보(정수 3자리,소수2자리)   소수점 이하 3자리에서 반올림해서 2자리까지 표현   123.56
--NUMBER(5,-1) -> 전체 5자리 확보(정수 3자리, 소수점 왼쪽(숫자4)에서 첫자리가 반올림이 됨.  1234.1 을 확인하면 테이블에 1230이 찍힘.


CREATE TABLE EMP2
( 
    EMPNO NUMBER(5) NOT NULL, --5자리의 정수를 넣을 수 있습니다.
    NUM1 NUMBER(5), --5자리의 정수
    NUM2 NUMBER(5,2), --5자리의 수   (정수 3자리까지, 소수점이하 2자리까지 표현. -> 즉, 소수점 이하 3번째 자리에서 반올림.)
    NUM3 NUMBER(5,-1) --5자리의 숫자, BUT 소수점기준 왼쪽1번째 자리에서 반올림.
);

INSERT INTO EMP2 VALUES(12345, 12345, 123.123, 12345.123); --12345, 12345, 123.12, 1230


------------ALTER문
ALTER TABLE CUSTOMER ADD GENDER VARCHAR2(9); --CUSTOMER에 GENDER라는 이름의 컬럼을 추가. VARCHAR2(9)를 가짐., DATA_DEFAULT값으로 'NONE'을 가지며 NOT NULL 을 가짐.
ALTER TABLE CUSTOMER RENAME COLUMN GENDER TO GEN; --RENAME COLUMN을 이용하여 컬럼의 이름을 변경. A를 TO B B로 바꾼다.
ALTER TABLE CUSTOMER RENAME COLUMN GEN TO GENDER; --다시 원상복구
ALTER TABLE CUSTOMER MODIFY GENDER VARCHAR2(100); --GENDER의 테이블 크기를 9에서 100으로. 테이블 크기 변경.
ALTER TABLE CUSTOMER MODIFY GENDER VARCHAR2(100) DEFAULT 'NONE' NOT NULL; --테이블 크기, DATA_DEFAULT값, NULLABLE 까지 바꿈.
ALTER TABLE CUSTOMER MODIFY GENDER NUMBER;--GENDER의 타입(자료형)을 NUMBER로 바꿉니다
ALTER TABLE CUSTOMER MODIFY GENDER NOT NULL;--GENDER의 제약조건을 추가합니다.
COMMENT ON COLUMN CUSTOMER.GENDER IS '성별: 코멘트 온 컬럼 커스터머.젠더 이즈';

ALTER TABLE CUSTOMER DROP COLUMN GENDER; --DROP COLUMN으로 컬럼 삭제.


-----------------------------2022.12.07-----------------------------


-------------------------2장 SQL 기본 20번째화면
ALTER TABLE EMP ADD SALARY NUMBER; --2장 퀴즈1. EMP 테이블에 NUMBER 자료형을 가진 SALARY 컬럼을 추가하시오 
ALTER TABLE EMP MODIFY SALARY NOT NULL; --2장 퀴즈2. EMP 테이블의 SALARY 컬럼에 NOT NULL 제약조건을 적용하시오
COMMENT ON COLUMN EMP.NO IS '숫자'; --2장 퀴즈3. EMP 테이블의 모든 컬럼의 코멘트를 작성하시오
COMMENT ON COLUMN EMP.NAME IS '이름';
COMMENT ON COLUMN EMP.AGE IS '나이';
COMMENT ON COLUMN EMP.SALARY IS '월급';
ALTER TABLE ORDERS ADD CUSTOMER_NAME VARCHAR2(50) NOT NULL;--퀴즈4. ORDERS 테이블에 VARCHAR(50) 자료형이고 NOT NULL제약사항을 가진 CUSTOMER_NAME 컬럼을 추가하시오
ALTER TABLE ORDERS MODIFY SALESMAN_ID VARCHAR2(50); -- 퀴즈5. ORDERS 테이블의 SALESMAN_ID의 자료형을 VARCHAR(50)로 변경하시오
ALTER TABLE ORDERS RENAME COLUMN SALESMAN_ID  TO SALESMAN_NAME; --퀴즈6. ORDERS 테이블의 SALESMAN_ID 컬럼의 이름을 SALESMAN_NAME으로 변경하시오
ALTER TABLE ORDERS MODIFY ORDER_DATE NULL; --퀴즈7. ORDERS 테이블의 ORDER_DATE 컬럼에 NULL 제약조건을 적용하시오
COMMENT ON COLUMN ORDERS.ORDER_ID IS '주문ID'; --퀴즈8. ORDERS 테이블의 모든 컬럼의 코멘트를 작성하시오
COMMENT ON COLUMN ORDERS.SALESMAN_NAME IS '판매원';
COMMENT ON COLUMN ORDERS.ORDER_DATE IS '주문날짜';
COMMENT ON COLUMN ORDERS.CUSTOMER_NAME IS '주문자';

---------------------------------------------------------------------
--2장 21. 테이블 삭제.
DROP TABLE EMP;
DROP TABLE CATEGORIES;
DROP TABLE CUSTOMER;
DROP TABLE EMP2;
DROP TABLE LOCATION;
DROP TABLE ORDERS;

----------------------------4. 데이터 추가/수정/삭제--------------------------------
--예제 6 특정 포맷으로 날짜 데이터 추가.
INSERT INTO ORDERS(ORDER_ID,SALESMAN_ID,ORDER_DATE) VALUES(1003, 2002, SYSDATE);--SYSDATE: 현재 시간.
INSERT INTO ORDERS(ORDER_ID,SALESMAN_ID,ORDER_DATE) VALUES(1004, 2002, '2022-08-27'); --ORDER_ID가 PK이므로 유니크값.
INSERT INTO ORDERS(ORDER_ID,SALESMAN_ID,ORDER_DATE) VALUES(1005, 1002, TO_DATE('2022-08-27', 'YYYY-MM-DD'));
INSERT INTO ORDERS(ORDER_ID,SALESMAN_ID,ORDER_DATE) VALUES(1006, 1002, TO_DATE('2022-08-27 10:23:53', 'YYYY-MM-DD HH24:MI:SS'));
--TO_DATE('입력할 날짜','포맷형식')
-------------------------------2장 31번부터 시작되는 퀴즈 1~6-----------------------
--퀴즈1. 도서 정보를 저장하기 위해 BOOK 테이블을 생성하시오
CREATE TABLE BOOK(
BOOK_NO NUMBER PRIMARY KEY,
TITLE VARCHAR2(50),
PUBLISHER VARCHAR2(100),
PRICE NUMBER
);

--퀴즈2. BOOK 테이블에 아래와 같이 도서 데이터를 추가하시오
INSERT INTO BOOK VALUES(1,'역사1','상상마당',30000);
INSERT INTO BOOK VALUES(2,'역사2','상상마당',30000);
INSERT INTO BOOK VALUES(3,'스프링웹프로젝트','한빛미디어',50000);
INSERT INTO BOOK VALUES(4,'자바개발도서','생능출판',NULL);

--퀴즈3. EMP  테이블에 아래와 같이 주문 데이터를 추가하시오
INSERT INTO EMP VALUES(NULL,NULL,NULL);
INSERT INTO EMP(NO) VALUES(1);
INSERT INTO EMP(NAME,AGE) VALUES('둘리',10);
INSERT INTO EMP VALUES(1,'둘리',10);
INSERT INTO EMP VALUES(1,'둘리',10);

--퀴즈4 . 아래와 같이 연락처 테이블을 만들고 데이터를 추가하시오
CREATE TABLE CONTACT(
CONTACT_NO NUMBER PRIMARY KEY,
FIRST_NAME VARCHAR2(5),
LAST_NAME VARCHAR2(10),
EMAIL VARCHAR2(100),
PHONE VARCHAR2(500)
);
ALTER TABLE CONTACT MODIFY FIRST_NAME VARCHAR2(50);
ALTER TABLE CONTACT MODIFY LAST_NAME VARCHAR2(50);

INSERT INTO CONTACT VALUES(1,'이','서연','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACT VALUES(2,'이','시우','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACT VALUES(3,'김','지호','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACT VALUES(4,'김','윤서','jeni.levy@gmail.com','010-3171-2341');
INSERT INTO CONTACT VALUES(5,'최','수아','fern.head@gmail.com',null);

--퀴즈5. 아래와 같이 캘린더 테이블을 만들고 데이터를 추가하시오
CREATE TABLE CALENDA (
MONTH DATE,
DAY_WEEK DATE,
DAY DATE
);

ALTER TABLE CALENDA MODIFY MONTH VARCHAR2(10);
ALTER TABLE CALENDA MODIFY DAY VARCHAR2(10);
ALTER TABLE CALENDA MODIFY DAY_WEEK VARCHAR2(10);

INSERT INTO CALENDA VALUES('1', '일', '1');
INSERT INTO CALENDA VALUES('1', '월', '2');
INSERT INTO CALENDA VALUES('1', '화', '3');
INSERT INTO CALENDA VALUES('1', '수', '4');
INSERT INTO CALENDA VALUES('1', '목', '5');
INSERT INTO CALENDA VALUES('1', '금', '6');
INSERT INTO CALENDA VALUES('1', '토', '7');


--퀴즈6. 선물세트 테이블을 만들고 데이터를 추가하시오.
CREATE TABLE PRESENTSET (
NO NUMBER PRIMARY KEY,
NAME VARCHAR2(50),
PRICE NUMBER
);
INSERT INTO PRESENTSET VALUES(1, '참치세트', 100000);
INSERT INTO PRESENTSET VALUES(2, '샴푸세트', 200000);
INSERT INTO PRESENTSET VALUES(3, '세차용품세트', 300000);
INSERT INTO PRESENTSET VALUES(4, '주방용품세트', 400000);
INSERT INTO PRESENTSET VALUES(5, '산악용자전거', 500000);
INSERT INTO PRESENTSET VALUES(6, 'LDC모니터', 600000);
INSERT INTO PRESENTSET VALUES(7, '노트북', 700000);
INSERT INTO PRESENTSET VALUES(8, '벽걸이TV', 800000);
INSERT INTO PRESENTSET VALUES(9, '드럼세탁기', 900000);
INSERT INTO PRESENTSET VALUES(10,'양쪽문냉장고', 1000000);

-------------------------------------------------------------------------------
---------------데이터 수정 UPDATE 문 --------------------------------------------
--문법:  UPDATE 테이블이름 SET 컬럼 = 변경할 값 WHERE 컬럼 = 특정값;
--나만의 표현 : UPDATE 테이블이름 SET ( 컬럼이름 = 변경할 값 ), ... WHERE 컬럼값 = 특정 값;
UPDATE CUSTOMER SET ADDRESS = '서울'; --WHERE로 조건을 걸지 않는다면, 5개의 행 전체가 '서울' 로 바뀐다.
--WHERE 는 조건절.  어떤 데이터의 ADDRESS를 바꿀것인가? 를 물어 볼 수있음.
UPDATE CUSTOMER SET ADDRESS = '서울' WHERE ID = 2;--CUSTOMER의 ADDRESS를 '서울'로 바꿀건데 ID값이 2인곳의 ADDRESS를 바꿔달라.
UPDATE CUSTOMER SET NAME = '훈이',address='울릉도' WHERE ID = 3;

UPDATE ORDERS SET ORDER_DATE = SYSDATE WHERE ORDER_ID = 1004;

---------------데이터 삭제 DELETE 문 --------------------------------------------
--문법1: DELETE FROM 테이블이름 WHERE 컬럼 = 특정값;      <- 특정 레코드 삭제.(레코드 = 행)
--문법2: DELETE FROM 테이블이름;                        <- 전체 레코드 삭제.(레코드 = 행)
DELETE FROM CUSTOMER WHERE ID = 4; --CUSTOMER의 ID값이 4인 레코드를 삭제합니다.
DELETE FROM CUSTOMER WHERE NAME = '둘리'; --CUSTOMER에서 NAME을 '둘리'를 가진 레코드를 삭제합니다.
DELETE FROM CUSTOMER; --CUSTOMER 전체 레코드를 삭제합니다.

--문법3: DELETE FROM 테이블이름 WHERE 컬럼 = 특정값 AND 컬럼 = 특정값;
--나만의 문법: DELETE FROM 테이블이름 WHERE [(컬럼 = 특정값) AND (컬럼 = 특정값)];
DELETE FROM ORDERS WHERE ORDER_ID = 1004 AND SALESMAN_ID = 2002; --ORDER_ID가 1004면서 SALESMAN_ID가 2002인 녀석을 삭제합니다.


----------------------2장 37 퀴즈(UPDATE) ---------------------------------------
UPDATE BOOK SET PRICE = 10000 WHERE BOOK_NO = 1; --조건 맞추려고 초기화 한거임
UPDATE BOOK SET PRICE = 11000 WHERE BOOK_NO = 2; --조건 맞추려고 초기화 한거임
--퀴즈1. BOOK 테이블에서 도서번호가 4인 도서의 제목을 자바개발도서로 수정하시오
UPDATE BOOK SET TITLE = '자바개발도서' WHERE BOOK_NO = 4;
--퀴즈2. BOOK 테이블에서 출판사가 '상상마당'인 도서의 가격을 모두 30000원으로 수정하시오
UPDATE BOOK SET PRICE = 30000 WHERE PUBLISHER = '상상마당';

--CUSTOMER초기화
INSERT INTO CUSTOMER VALUES (1,'둘리','인천');
INSERT INTO CUSTOMER VALUES (2,'둘리','');
INSERT INTO CUSTOMER VALUES (3,'홍길동','');
INSERT INTO CUSTOMER VALUES (4,'또치','');

--퀴즈3. CUSTOMER 테이블에서 모든 고객의 이름을 둘리, 주소를 인천으로 수정하시오 
UPDATE CUSTOMER SET NAME = '둘리',ADDRESS = '인천';

----------------------2장 42 퀴즈(DELETE) ---------------------------------------
--BOOK 초기화
UPDATE BOOK SET PRICE = 10000 WHERE BOOK_NO = 1; --조건 맞추려고 초기화 한거임
UPDATE BOOK SET PRICE = 11000 WHERE BOOK_NO = 2; --조건 맞추려고 초기화 한거임
--퀴즈1. BOOK 테이블에서 제목이 역사2이고 출판사가 상상마당인 도서를 삭제하시오
DELETE FROM BOOK WHERE TITLE = '역사1' AND PUBLISHER = '상상마당';

--퀴즈2. BOOK테이블에서 도서번호가 3인 도서를 삭제하시오.
DELETE FROM BOOK WHERE BOOK_NO = 3;

--퀴즈3. BOOK테이블에서 가격이 없는 도서를 삭제하시오   NULL값을 삭제할때는 IS NULL 활용.
DELETE FROM BOOK WHERE PRICE IS NULL;

--퀴즈4. BOOK 테이블에서 모든 도서를 삭제하시오
DELETE FROM BOOK;

-------------------------------------------------------------------------------
-----------------------데이터 조회 SELECT문---------------------------------------
--문법1: SELECT*FROM 테이블이름;   * = 모든 데이터
--문법2: SELECT 컬럼1, 컬럼2 ... FROM 테이블 이름;
SELECT*FROM CUSTOMER;
SELECT ID, NAME FROM CUSTOMER;
SELECT NAME AS as는별칭 FROM CUSTOMER; --AS 별칭명

--SELECT문
select * from customer;
SELECT ID, NAME FROM CUSTOMER; --순서차이있음
SELECT NAME, ID FROM CUSTOMER; --순서차이있음


-------조회SELECT + 정렬 ORDER BY--------------------------------------
--문법1: SELECT*FROM 테이블이름 ORDER BY 컬럼 ASC; 오름차순
--문법2: SELECT*FROM 테이블이름 ORDER BY 컬럼 DESC; 내림차순

SELECT * FROM CUSTOMER ORDER BY ID ASC; --오름차순
SELECT * FROM CUSTOMER ORDER BY ID DESC; --내림차순
SELECT * FROM CUSTOMER ORDER BY ADDRESS ASC; --오름차순

--------조회 SELECT + 그룹화 GROUP BY ----------------------------------
--문법: SELECT*FROM 테이블 이름 GROUP BY 컬럼;
SELECT * FROM GIFT; --기프트 전체로 가져옴.
SELECT TYPE FROM GIFT; -- 타입을 그냥 뽑아옴.
--그룹핑을 통해서 겹치는걸 하나로 합쳐봅시다.
SELECT TYPE FROM GIFT GROUP BY TYPE; --겹치는 요소를 하나로 뭉침. TYPE 컬럼으로 그룹화(중복된 데이터를 그룹핑한다)
SELECT * FROM GIFT GROUP BY TYPE; --오류, 그룹핑을 하기에는 묶이지 않는 녀석들이 존재한다.

SELECT TYPE, SUM(PRICE)AS SUM FROM GIFT GROUP BY TYPE;--TYPE별로 그룹핑을 하는데 식품(1)생활용품(3개)운동장비(1)가전(5)의 pirce를 sum하고 그걸 출력.
SELECT TYPE, COUNT(NAME)AS namecount FROM GIFT GROUP BY TYPE;


------------------------조건검색(WHERE) ------------------------------------
/*
비교 연산자 : = , != , > , < , >= , <= 
논리 연산자 : AND, OR, NOT
산술 연산자 : ()우선순위 조절   , * 곱 , / , + , - 
합성 연산자 : ||   문자와 문자를 연결할때 사용한다.
SELECT '이름:' || NAME || '입니다.'AS INTRO FROM CUSTOMER;

범위 연산자 
BETWEEN 두 값의 범위에 해당하면 검색    SELECT * FROM CUSTOMER WHERE ID BETWEEN 2 AND 4;  2하고 4 사이에 있는것.
NOT BETWEEN 두 값의 범위를 제외하고 검색 SELECT * FROM CUSTOMER WHERE ID NOT BETWEEN 2 AND 4; 2하고 4 사이에 없는것들.
IN 괄호 안에 값과 일치하면 검색 SELECT * FROM CUSTOMER WHERE ID IN(1,2,3);  ID가 1,2,3인 레코드를 가져옴.
NOT IN 괄호안에 값과 일치하지 않으면 검색. SELECT * FROM CUSTOMER WHERE ID NOT IN (1,2,3); ID가 1,2,3이 아닌애들을 가져옴.

패턴 연산자
LIKE : 해당 문자열을 포함하면 검색한다.
    SELECT * FROM CUSTOMER WHERE NAME LIKE '둘%' 둘~ 로 시작하는것
    SELECT * FROM CUSTOMER WHERE NAME LIKE '%길%' ~길~ 안에 길 이 들어간 것
    SELECT * FROM CUSTOMER WHERE NAME LIKE '%치' ~치 로 끝나는 것.

빈값 체크 연산자
IS NULL : NULL 값
    SELECT * FROM CUSTOMER WHERE ADDRESS IS NULL; 주소가 NULL값인거 가져옴.

IS NOT NULL : NULL값이 아님
    SELECT * FROM CUSTOMER WHERE ADDRESS IS NOT NULL; 주소가 NULL값이 아닌거 가져옴.
*/

-- 비교 연산자 (숫자) -----------------------
SELECT * FROM CUSTOMER WHERE ID=1;
SELECT * FROM CUSTOMER WHERE ID>1; --1보다 큰
SELECT * FROM CUSTOMER WHERE ID<4; --4보다 작은
SELECT * FROM CUSTOMER WHERE ID>=1; --1보다 크거나 같다
SELECT * FROM CUSTOMER WHERE ID<=4; --4보다 작거나 같다
SELECT * FROM CUSTOMER WHERE ID!=2; --아이디가 2가 아닌
-- 비교 연산자 (문자) ------------------------
SELECT * FROM CUSTOMER WHERE NAME = '둘리'; --NAME이 '둘리' 찾아줘
SELECT * FROM CUSTOMER WHERE NAME != '둘리'; --NAME이 '둘리' 아닌놈을 찾아줘
SELECT * FROM CUSTOMER WHERE NAME > '둘리'; --NAME이 '둘리'보다 늦는놈(가나다순)
SELECT * FROM CUSTOMER WHERE NAME < '둘리'; --NAME이 '둘리'보다 빠른놈(가나다순)
SELECT * FROM ORDERS WHERE ORDER_DATE > ('2022-01-03');  --1월 3일보다 이후
SELECT * FROM ORDERS WHERE ORDER_DATE <= ('2022-01-03');  --1월 3일까지 (이전부터)
-- 논리 연산자  ------------------------
SELECT * FROM CUSTOMER WHERE NAME = '둘리' AND ADDRESS = '서울'; -- NAME이 둘리 이면서 ADDRESS가 서울인
SELECT * FROM CUSTOMER WHERE ADDRESS = '서울' OR ADDRESS = '인천'; -- ADDRESS가 서울 OR 인천 인
SELECT * FROM CUSTOMER WHERE NOT ADDRESS = '서울'; --ADDRESS가 서울이 아닌, 그러나 NULL은 불러오지못함.

-- 산술 연산자
SELECT * FROM ORDERS;
SELECT ORDER_ID + SALESMAN_ID AS PLUS FROM ORDERS;
SELECT ORDER_ID + SALESMAN_ID * ORDER_ID AS 뒤곱앞더 FROM ORDERS;
SELECT (ORDER_ID + SALESMAN_ID) * ORDER_ID AS 앞더먼저뒤곱 FROM ORDERS;

--문자열 연결
SELECT NAME AS INTRO FROM CUSTOMER;
SELECT '이름:'||NAME ||'입니다.' AS INTRO FROM CUSTOMER;


----------------------2장 52페이지 문제 -----------------------------------------
--퀴즈1. BOOK 테이블에서 가격이 11000원, 25000원 도서를 각각 찾으시오
SELECT TITLE, PRICE FROM BOOK WHERE PRICE = 10000 OR PRICE = 25000;
--퀴즈2. BOOK 테이블에서 30000원 보다 비싼 도서를 찾으시오
SELECT TITLE, PRICE FROM BOOK WHERE PRICE > 30000;
--퀴즈3. BOOK 테이블에서 10000이상 30000이하인 사이인 도서를 찾으시오
SELECT TITLE, PRICE FROM BOOK WHERE PRICE >= 10000 AND PRICE <=30000;
--퀴즈4. BOOK 테이블에서 출판사가 한빛미디어 또는 생능출판인 도서를 찾으시오
SELECT TITLE, PUBLISHER FROM BOOK WHERE PUBLISHER = '한빛미디어' OR PUBLISHER='생능출판';
--퀴즈5. ORDERS 테이블에서 2020년 1월 2일 이후에 들어온 주문를 찾으시오
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE ORDER_DATE > ('2022-01-02');
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE order_date > TO_DATE('2022-01-02', 'YYYY-MM-DD');--TO_DATE: 문자열을 날짜 형식으로 바꿔줌.


--퀴즈6. ORDERS 테이블에서 2020년 1월 1일에 들어온 주문를 찾으시오
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE ORDER_DATE = ('2022-01-02');
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE order_date = TO_DATE('2022-01-02', 'YYYY-MM-DD');

--번외편
SELECT ORDER_ID, ORDER_DATE FROM ORDERS WHERE order_date < SYSDATE; --오늘 날짜보다 이전.


---BETWEEN------NOT BETWEEN------범위 연산자 --------IN-------NOT IN------------
SELECT * FROM CUSTOMER WHERE ID BETWEEN 2 AND 4; --2~4사이에 있는 애들 SELECT
SELECT * FROM CUSTOMER WHERE ID NOT BETWEEN 2 AND 4; --2~4사이가 아닌것.
SELECT * FROM CUSTOMER WHERE ID IN (1,2,3); --ID값이 1,2,3인 것.
SELECT * FROM CUSTOMER WHERE ID NOT IN (1,2); --ID값이 1,2이 아닌 것.

-----둘%-------%길%------%치------패턴 연산자 LIKE---------------------------------
SELECT * FROM CUSTOMER WHERE NAME LIKE '둘%'; --둘 로 시작하는 문자열
SELECT * FROM CUSTOMER WHERE NAME LIKE '%길%'; --~~길~~을 가진 문자열
SELECT * FROM CUSTOMER WHERE NAME LIKE '%치'; -- ~치 로 끝나는 문자열 


---------IS NULL---------------빈값 체크 연산자 -----------IS NOT NULL-------------
SELECT * FROM CUSTOMER WHERE ADDRESS IS NULL; --ADDRESS가 NULL값인거 가져옴.

SELECT * FROM CUSTOMER WHERE ADDRESS IS NOT NULL; --ADDRESS가 NULL값이 아닌거 가져옴.


------------------------2장 54페이지 문제------------------------------------
--퀴즈1. BOOK 테이블에서 10000이상 30000이하인 사이인 도서를 찾으시오
SELECT * FROM BOOK WHERE PRICE BETWEEN 10000 AND 30000;

--퀴즈2. CONTACTS 테이블에서 김씨나 최씨 성을 가진 사람을 찾으시오
SELECT * FROM CONTACTS WHERE FIRST_NAME IN('김','최');

--퀴즈3. GIFT 테이블에서 노트북, 벽걸이TV, 양쪽문냉장고를 찾으시오
SELECT * FROM GIFT WHERE NAME IN('노트북', '벽걸이TV', '양쪽문냉장고');

--퀴즈4. GIFT 테이블에서 생활용품이거나 운동장비인 선물을 찾으시오
SELECT * FROM GIFT WHERE TYPE IN('생활용품', '운동장비');

--퀴즈5. GIFT 테이블에서 가격이 300000원과 600000원 사이인 선물을 찾으시오
SELECT * FROM GIFT WHERE PRICE BETWEEN 300000 AND 6000000;


------------------------2장 56페이지 문제------------------------------------
--퀴즈1. CONTACTS 테이블에서 전화번호가 2341로 끝나는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE PHONE LIKE '%2341';
--퀴즈2. CONTACTS 테이블에서 전화번호가 3171을 포함하는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE PHONE LIKE('%3171%');
--SELECT * FROM CONTACTS WHERE PHONE IN('3171');
--퀴즈3. CONTACTS 테이블에서 이메일을 네이버를 사용하면서 전화번호가 없는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE EMAIL LIKE ('%naver%') AND PHONE IS NULL;
--퀴즈4. GIFT 테이블에서 이름에 용품이 포함된 선물을 찾으시오
SELECT * FROM GIFT WHERE TYPE LIKE '%용품%';
--퀴즈5. GIFT 테이블에서 이름이 세트로 끝나면서 300000원이하인 선물을 찾으시오
SELECT * FROM GIFT WHERE TYPE LIKE '%용품' AND PRICE < 300000;

------------------------------------------------------------------------------
---함수---------------------------

SELECT CHR(65) FROM DUAL; --아스키코드 A

SELECT LOWER('JENNIE') FROM DUAL; --소문자로 만들어드립니다
SELECT UPPER(EMAIL) FROM CONTACTS; --대문자로 만들어드립니다.

SELECT LTRIM('                       JENNIE') FROM DUAL; --왼쪽에서부터 공백 제거
SELECT LTRIM('블랙핑크', '블랙') FROM DUAL; --왼쪽에서부터 공백 제거, 일치하는 단어가 있다면 걔는 제거

SELECT RTRIM('JENNIE                     ') FROM DUAL; --오른쪽에서부터 공백 제거
SELECT RTRIM('블랙핑크', '핑크') FROM DUAL; --오른쪽에서부터 공백 제거, 일치하는 단어가 있다면 걔는 제거

SELECT TRIM('             JEN   NIE                  ') FROM DUAL; --양쪽에 있는 공백 제거.
SELECT TRIM(LEADING '블' FROM '블랙핑크') FROM DUAL; --앞쪽에서부터 쭉 읽는데 '블'이라는 글자가 해당되면 없애겠다.
SELECT TRIM(TRAILING '크' FROM '블랙핑크') FROM DUAL; --뒤쪽에서부터 쭉 읽는데 '크'이라는 글자가 해당되면  없애겠다.
SELECT TRIM(BOTH '블' FROM '랙핑크') FROM DUAL; --문자열 양쪽에서 읽는데 해당하는 문자가 있으면 없애겠다.

SELECT SUBSTR('블랙핑크제니', 3, 2)FROM DUAL; --문자열을 3번째부터 2자리 읽겠다.
SELECT LENGTH('블랙핑크') FROM DUAL; --문자열의 길이를 반환한다.
SELECT REPLACE('블랙핑크제니','제니','지수') FROM DUAL; --REPLACE('문자열','바꿀 문자열 선택', '새로 입력할 문자열') 
SELECT REPLACE(LAST_NAME,'시','새') FROM CONTACTS;


--------------------------------------------------------------------------------
--221208


--부서 테이블 만들기.

CREATE TABLE DEPT ( 
    DEPT_NO NUMBER PRIMARY KEY, --부서번호
    DEPT_NAME VARCHAR2(20) NOT NULL, -- 부서명
    DEPT_ADDRESS VARCHAR2(100) -- 부서주소
);

INSERT INTO DEPT VALUES(1, '인사부','');
INSERT INTO DEPT VALUES(2, '연구부','');
INSERT INTO DEPT VALUES(3, '홍보부','');
INSERT INTO DEPT VALUES(4, '수뇌부','');

SELECT * FROM DEPT;

--사원 테이블 만들기.
DROP TABLE SAWON;
CREATE TABLE SAWON (
    SAWON_NO NUMBER PRIMARY KEY, --사원 번호
    SAWON_NAME VARCHAR2(20) NOT NULL, --사원 명
    DEPT_NO NUMBER NOT NULL, --부서번호
    --CONSTRAINT: 제약
    --외래키 지정문
    --CONSTRAINT [FK명] FOREIGN KEY([FK가 될 컬럼 명]) REFERENCES [PK가 위치하는 테이블] ([PK의 컬럼 명])
    CONSTRAINT FK_DEPT_NO FOREIGN KEY(DEPT_NO) REFERENCES DEPT (DEPT_NO)--외래키 설정
    --컬럼명은 외래키로 가져오는 기본키의 컬럼명과 동일해도 된다.
    --FK명은 다른 테이블과 중복이 되어서는 안된다.
);

INSERT INTO SAWON VALUES(1001, '유비', 3);
INSERT INTO SAWON VALUES(1002, '관우', 1);
INSERT INTO SAWON VALUES(1003, '장비', 2);
INSERT INTO SAWON VALUES(1005, '조운', 5); --3번째 DEPT_NO값에 5를 쓸 수 없는 FK로 한것은 참조한 PK에 있는 값 들만 사용할 수 있다.
INSERT INTO SAWON VALUES(1004, '공명', 4); --4도마찬가지로 못쓰는상황이었으나 테이블에 추가하여 4번을 만들어주면 사용 가능.

UPDATE SAWON SET dept_no = 10 WHERE sawon_name = '유비'; --이름이 유비 인 사람을 부서번호를 10으로 바꾸고싶다
--오류가 발생. DEPT_NO가 10번이 FK로 참조한 PK에 없으므로 사용이 불가능하다.

DELETE FROM DEPT WHERE DEPT_NO = 1; --DEPT테이블의 DEPT_NO값이 1인 녀석을 지우고싶습니다.
--오류가 발생. 이유는 FK로 참조되고 있기 때문.(SAWON테이블의 DEPT_NO)에서 FK로 참조중이다.
--해결방법 : 1번의 값을 가진 녀석(관우) 지워주면 지워질것.
DELETE FROM SAWON WHERE DEPT_NO = 1; --이걸 먼저하고 DELETE FROM DEPT WHERE DEPT_NO = 1; 해주면 삭제 가능



SELECT * FROM SAWON;
DELETE FROM SAWON WHERE SAWON_NO IN (1002,1003,1001);
DROP TABLE DEPT; --부모 테이블을 먼저 지우려고 하면 오류가 발생. 다른데서 참조중이기때문.
DROP TABLE SAWON; --사원테이블을 먼저 지우고 위의 부모 테이블을 지우면 정상적으로 지워진다.

DROP TABLE DEPT CASCADE CONSTRAINTS; --제약조건을 무시하고 강제로 삭제.




CREATE TABLE CLASS (
CLASS_NO NUMBER PRIMARY KEY,
CLASS_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO CLASS VALUES(1001,'수학');
INSERT INTO CLASS VALUES(1002,'국어');

SELECT * FROM CLASS;

CREATE TABLE STUDENT (
STUDENT_NO NUMBER PRIMARY KEY,
STUDENT_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO STUDENT VALUES(2001, '유비');
INSERT INTO STUDENT VALUES(2002, '관우');
INSERT INTO STUDENT VALUES(2003, '장비');

SELECT * FROM STUDENT;

CREATE TABLE CLASS_STUDENT(
CS_NO NUMBER PRIMARY KEY,
CLASS_NO NUMBER not null,
STUDENT_NO NUMBER not null,
CONSTRAINT FK_CLASS_NO FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO),
CONSTRAINT FK_STUDENT_NO FOREIGN KEY (STUDENT_NO) references student (student_no)
 --CONSTRAINT [FK명] FOREIGN KEY([FK가 될 컬럼 명]) REFERENCES [PK가 위치하는 테이블] ([PK의 컬럼 명])
);

INSERT INTO CLASS_STUDENT VALUES (1, 1001, 2001);
INSERT INTO CLASS_STUDENT VALUES (2, 1002, 2001);
INSERT INTO CLASS_STUDENT VALUES (3, 1001, 2002);
INSERT INTO CLASS_STUDENT VALUES (4, 1002, 2002);
INSERT INTO CLASS_STUDENT VALUES (5, 1002, 2003);
SELECT * FROM CLASS_STUDENT;




