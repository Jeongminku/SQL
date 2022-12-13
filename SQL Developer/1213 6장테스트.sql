--CREATE TABLE SAMPLE (
--    NO   NUMBER PRIMARY KEY,
--    NAME VARCHAR2(20),
--    AGE  NUMBER
--);
--
--INSERT INTO SAMPLE VALUES(1, '������', 10);
--INSERT INTO SAMPLE VALUES(2, '�ڿ���', 10);
--INSERT INTO SAMPLE VALUES(3, '������', 10);
--
--COMMIT; -- ���� DB�� �����ϱ� ���ؼ� Ŀ��(insert,update,delete�� ��)�� ����Ѵ�.
--
--INSERT INTO SAMPLE VALUES(4, '������', 10);
--INSERT INTO SAMPLE VALUES(5, '������', 10);
--ROLLBACK; --Ŀ�� ������ �͵��� �ǵ��ư�.
--
--select * from sample;
--
--ALTER TABLE SAMPLE MODIFY AGE NUMBER CHECK(AGE IN (10, 11)); --AGE�÷��� 10�� 11�� �ְڴ�.
--INSERT INTO SAMPLE VALUES(4, '������', 13); --�����߻�. CHECK ���������� ����. �������� 10�� 11�� ���� CHECK�صξ��� ����.
--INSERT INTO SAMPLE VALUES(4, '������', 11); --�����۵�
--
---------------------------------------------------------------------------------
-----------------------------�ε���----------------------------------------------
---------------------------------------------------------------------------------
--/*�ε��� : �˻��� ���� �ӵ��� �ϱ� ���ؼ� ���. 
--����Ŭ�� ���̺� ���� �� �ε����� ���� �������� �ʾƵ� �ڵ����� �����ȴ�. -> PK, Unique �÷�
--
--���� : 1. ���̺� ���� ������ ���� ���(ã�ƾ��� �����Ͱ� ���� ���)
--       2. �ε����� ������ �÷��� where ������ ���� ���Ǵ� ���.
--       3. join�� �� ����ϴ� �÷�(on �θ����̺�.PK = �ڽ����̺�.FK)
--       4. �˻� ����� ���� ���̺� ������ 2~4 % �� �ش��ϴ� ���.
--       5. �ش� �÷��� null�� �����ϴ� ��� (���ο� null�ΰ��� �����Ѵ�.)
--                                            �� ���� = INDEX
--       
--       
--���� : 1. ���̺� ���� ������ ���� ���.
--       2. �˻� ����� �������̺��� '����' ������ �����ϴ� ��� (���� 4�� �ݴ�Ǵ� �ܿ�)
--       3. ���� ���̺��� ����, ���� ������ ����� ���
--*/
--
--
-----6��: �ε���----
--
----�ʱ�ȭ--
--drop table emp;
--create table emp (
--no number,
--name VARCHAR2(50),
--age number);
--
--INSERT INTO EMP (NO, NAME, AGE) VALUES (1, '�Ѹ�', 10);
--INSERT INTO EMP (NO, NAME, AGE) VALUES (2, '��浿', 10);
--INSERT INTO EMP (NO, NAME, AGE) VALUES (3, '��ġ', 10);
--
--CREATE INDEX EMP_IX01 ON EMP(NAME); --NAME�÷��� �ε����� �Ǵ�.
--CREATE INDEX emp_ix02 ON EMP(no, name); --no, name �÷��� �ε����� �Ǵ�.
--select * from emp;
--
--create unique index emp_ix03 on emp(age); --�����߻�. (�ش� ���̺��� ������ ���̾�� unique�� �� �� �ִ�.)
--create unique index emp_ix03 on emp(no);
--
--drop index emp_ix01; --�ε��� �������.
--
---------------------------------------------------------------------------------
--------------------------6��   4.�����ͻ���-------------------------------------
---------------------------------------------------------------------------------
--select * from user_tables;
--select * from user_indexes;


-------------------------------------------------------------------------------
------------------------6��   5.���ν���---------------------------------------
-------------------------------------------------------------------------------
/* ���ν��� (procedure)   �١ڡ١ڡٽǹ���ڡ١ڡ١�.
�����ͺ��̽��� ���� �Ϸ��� �۾��� ������ ������ ������ ��.
����������(Persistent Storage Module)�̶�� �Ҹ�.
�Ϸ��� ������ ��ġ �ϳ��� �Լ�ó�� �����ϱ� ���� ������ ����.
*/
--create or replace PROCEDURE EX_PROC(in_type IN VARCHAR2, in_name IN VARCHAR2)  --�Ű����� �̸� in_type, in_name �޴� Ÿ�����δ� varchar2 ����.
--IS
--price NUMBER := 10000; --���� ����
--
--BEGIN
--
--INSERT INTO GIFT
--VALUES (11, in_type, in_name, price);
--COMMIT;
--
--END EX_PROC;
 
EXEC EX_PROC('������ǰ','TV');
--���� �ڵ�: ���ν��� ����. ()�ȿ��� �Ű������� ����� in_type, in_name

select * from gift;

