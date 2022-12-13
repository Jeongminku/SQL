--CREATE TABLE SAMPLE (
--    NO   NUMBER PRIMARY KEY,
--    NAME VARCHAR2(20),
--    AGE  NUMBER
--);
--
--INSERT INTO SAMPLE VALUES(1, '양지은', 10);
--INSERT INTO SAMPLE VALUES(2, '박우진', 10);
--INSERT INTO SAMPLE VALUES(3, '김태은', 10);
--
--COMMIT; -- 실제 DB에 저장하기 위해선 커밋(insert,update,delete할 때)을 사용한다.
--
--INSERT INTO SAMPLE VALUES(4, '정지우', 10);
--INSERT INTO SAMPLE VALUES(5, '정지우', 10);
--ROLLBACK; --커밋 이후의 것들은 되돌아감.
--
--select * from sample;
--
--ALTER TABLE SAMPLE MODIFY AGE NUMBER CHECK(AGE IN (10, 11)); --AGE컬럼에 10과 11만 넣겠다.
--INSERT INTO SAMPLE VALUES(4, '정지우', 13); --에러발생. CHECK 제약조건을 위반. 윗열에서 10과 11만 들어가게 CHECK해두었기 때문.
--INSERT INTO SAMPLE VALUES(4, '정지우', 11); --정상작동
--
---------------------------------------------------------------------------------
-----------------------------인덱스----------------------------------------------
---------------------------------------------------------------------------------
--/*인덱스 : 검색을 빠른 속도로 하기 위해서 사용. 
--오라클은 테이블 생성 시 인덱스를 따로 생성하지 않아도 자동으로 생성된다. -> PK, Unique 컬럼
--
--장점 : 1. 테이블 행의 개수가 많은 경우(찾아야할 데이터가 많은 경우)
--       2. 인덱스를 적용한 컬럼이 where 절에서 많이 사용되는 경우.
--       3. join할 때 사용하는 컬럼(on 부모테이블.PK = 자식테이블.FK)
--       4. 검색 결과가 원본 테이블 데이터 2~4 % 에 해당하는 경우.
--       5. 해당 컬럼이 null을 포함하는 경우 (색인에 null인것은 제외한다.)
--                                            ㄴ 색인 = INDEX
--       
--       
--단점 : 1. 테이블 행의 개수가 적은 경우.
--       2. 검색 결과가 원본테이블의 '많은' 비중을 차지하는 경우 (장점 4와 반대되는 겨웅)
--       3. 원본 테이블의 삽입, 수정 삭제가 빈번한 경우
--*/
--
--
-----6장: 인덱스----
--
----초기화--
--drop table emp;
--create table emp (
--no number,
--name VARCHAR2(50),
--age number);
--
--INSERT INTO EMP (NO, NAME, AGE) VALUES (1, '둘리', 10);
--INSERT INTO EMP (NO, NAME, AGE) VALUES (2, '고길동', 10);
--INSERT INTO EMP (NO, NAME, AGE) VALUES (3, '또치', 10);
--
--CREATE INDEX EMP_IX01 ON EMP(NAME); --NAME컬럼에 인덱싱을 건다.
--CREATE INDEX emp_ix02 ON EMP(no, name); --no, name 컬럼에 인덱싱을 건다.
--select * from emp;
--
--create unique index emp_ix03 on emp(age); --에러발생. (해당 테이블의 유일한 값이어야 unique를 걸 수 있다.)
--create unique index emp_ix03 on emp(no);
--
--drop index emp_ix01; --인덱스 삭제방법.
--
---------------------------------------------------------------------------------
--------------------------6장   4.데이터사전-------------------------------------
---------------------------------------------------------------------------------
--select * from user_tables;
--select * from user_indexes;


-------------------------------------------------------------------------------
------------------------6장   5.프로시저---------------------------------------
-------------------------------------------------------------------------------
/* 프로시저 (procedure)   ☆★☆★☆실무용★☆★☆★.
데이터베이스에 대한 일련의 작업을 정리한 절차를 저장한 것.
영구저장모듈(Persistent Storage Module)이라고도 불림.
일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합.
*/
--create or replace PROCEDURE EX_PROC(in_type IN VARCHAR2, in_name IN VARCHAR2)  --매개변수 이름 in_type, in_name 받는 타입으로는 varchar2 받음.
--IS
--price NUMBER := 10000; --변수 선언
--
--BEGIN
--
--INSERT INTO GIFT
--VALUES (11, in_type, in_name, price);
--COMMIT;
--
--END EX_PROC;
 
EXEC EX_PROC('가전제품','TV');
--위의 코드: 프로시저 실행. ()안에는 매개변수를 사용함 in_type, in_name

select * from gift;

