-- 초기화
DROP TABLE CONTACTS;
DROP TABLE CAL;
DROP TABLE GIFT;

DELETE CUSTOMER;
DELETE ORDERS;
DELETE BOOK;

INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(1, '둘리', '인천');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(2, '둘리', '');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(3, '홍길동', NULL);
INSERT INTO CUSTOMER(ID, NAME) VALUES(4, '또치');
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1001, 2002, SYSDATE);
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1002, 2002, SYSDATE);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (1, '역사1', '상상마당', 10000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (2, '역사2', '상상마당', 11000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (3, '스프링웹프로젝트', '한빛미디어', 50000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER) VALUES (4, '자바프로그래밍', '생능출판');
-- 초기화 끝 ----------------------------------------------------------------------------------------------------------------------------------------

-- 예제1. CUSTOMER 테이블에서 고객번호가 2번인 고객의 주소를 수정  
UPDATE CUSTOMER SET ADDRESS = '서울' WHERE ID = 2;

-- 예제2. CUSTOMER 테이블에서 아이디가 3번인 고객의 이름과 주소를 수정  
UPDATE CUSTOMER SET NAME = '훈이', ADDRESS = '제주도' WHERE ID = 3;

-- 예제3. ORDERS 테이블에서 주문번호가 1002인 주문의 시간을 현재시간으로 수정
UPDATE ORDERS SET ORDER_DATE = SYSDATE WHERE ORDER_ID = 1002;

-- 퀴즈1. BOOK 테이블에서 도서번호가 4인 도서의 제목을 자바개발도서로 수정
UPDATE BOOK SET TITLE = '자바개발도서' WHERE BOOK_NO = 4;

-- 퀴즈2. BOOK 테이블에서 출판사가 '상상마당'인 도서의 가격을 모두 30000원으로 수정
UPDATE BOOK SET PRICE = 30000 WHERE PUBLISHER = '상상마당';

-- 퀴즈3. CUSTOMER 테이블에서 모든 고객의 이름을 둘리, 주소를 인천으로 수정
UPDATE CUSTOMER SET  NAME = '둘리', ADDRESS = '인천';

