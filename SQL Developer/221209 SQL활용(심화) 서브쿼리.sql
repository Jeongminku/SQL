-----------------------WHERE, HAVING������ ���. ��ø ��������-----------------------
--�񿬰�, ����, ������, ������, �����÷�

--�� ���� ��������.
select *
    from academy_a 
    where student_name = (select student_name
                          from academy_b
                          where student_no = 1003);
          
          
--���� ��������.                
select *
    from academy_a t1
    where student_name = (select t2.student_name
                          from academy_b t2
                          where t2.student_no = t1.student_no);
                          
                          
--��ø ��������. -- ������, ������, �����÷� �������� �� ����.
/*������ ��������: ���������� 1�� ������ �����͸� ��ȯ,
������ �� �����ڿ� ���� ��� (=, >, <, => ,<=)
*/


--������
select *
        from academy_a
        where student_name = (select student_name
                              from academy_b
                              where student_no = 1003);
               /* ���⸸ �����Ű�� 1���� ���� ��. ���� �ϳ��̹Ƿ� ���� �� �� ��� ����.
                              select student_name
                              from academy_b
                              where student_no = 1003
                */




/*--������ ��������
            ���������� �������� �����͸� ��ȯ
            ������ �� �����ڿ� ���� ���(IN)*/

--������(�����߻�ver)
SELECT *
        from academy_a  --�����߻�. ���� 2���������Ƿ� ������(=)���� �� ���� ����.
        where student_name = ( select student_name
                               from academy_b
                               where student_no = 1003 or student_no = 1004);

--������(���� ver)
SELECT *
        from academy_a  --(��ȣ���ִ� select��)���� 2���������Ƿ� ������(=)���� �� ���� �����Ƿ� in ���� �ٲ�..
        where student_name in (select student_name
                               from academy_b
                               where student_no = 1003 or student_no = 1004);
                               
                               

/*--���� �÷� ��������
        ���������� �����÷��� �����͸� ��ȯ
        ������ �� �����ڿ� ���� ���(IN)   */
SELECT *
        FROM academy_a
        where (student_name, student_no) in(select student_name, student_no
                                            from academy_b
                                            where student_no = 1003 or student_no = 1004);


------------------------4�� 3.GROUP BY, HAVING, ORDER BY-------------------------
SELECT type, count(name) as count  --count(ī���� �� �÷� �̸�)
            from gift 
            group by type
           --count�� 2 �̻��� �ֵ��� ���.
            having count(name) > = 2 
            order by type asc --������ ������ ����
            ;




------------------------4�� 4. ������ �Լ�----------------------------------------
select * from student_grade;
--rank = ������ ������ 10�� 10������ üũ�ϴµ� 11���� üũ��������. ���� 10�� ���� 12���� ����.
--�� 1,2,3,3,5 �� �̷������� ���°� (3���� �����̶�� ����������.)
select student_name,score as ����, rank() over(order by score desc) as ��ũ from student_grade;

--denserank = ������ ������ �ٸ� ����� ī��Ʈ�����ʽ��ϴ�.   ���� 10�� ���� 11���� ����.
--�� 1,2,3,3,4,5 �̷��� ����˴ϴ�.
select student_name,score as ����, dense_rank() over(order by score desc) as ����_��ũ from student_grade;

--row_number�� ���� ���� ������ 1���� ���ڸ��� �� ����ϴ�. ���� 10���� ���������ʰ� 10, 11�� �˴ϴ�.
--3���� ������ ���ٰ� �����ص� 1,2,3,4,5,6,7 �� ���ڸ� �ѷ��ݴϴ�.
select student_name,score as ����, row_number() over(order by score desc) as �ο�_�ѹ� from student_grade;


SELECT TYPE, SUM(price) AS sum�հ� FROM gift GROUP BY TYPE;
SELECT TYPE, PRICE ,SUM(PRICE) OVER(PARTITION BY TYPE) AS SUM�հ� FROM GIFT; --over�� ���� �̹� group�� ���ֱ⶧���� group�� ������.
select type, max(price) as max�� from gift group by type;
select type, min(price) as min�� from gift group by type;
select type, avg(price) as avg�� from gift group by type;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------4�� 2.VIEW ��----------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--create or replace view ���̸� as ������
--�� �̸��� ���̺� �̸��� �ߺ��� �� �����ϴ�.
create or replace view academy_all as select * from academy_a;

-- select * from academy_all where student_no = 1004;

create or replace view academy_student_name as
    select student_no from academy_a;

select * from academy_student_name;
select * from academy_all;

insert into academy_all values(1005, '���α�');
insert into academy_student_name('���α�2'); --�����߻�. �ȵ�. �����ͺ��� ���� ���� ���� ����(?)
            
            --���̺��
insert into academy_student_name values(1005);--cannot insert NULL into

drop view academy_join;

create or replace view academy_join as
    select t1.student_no, t1.student_name
        from academy_a t1, academy_b t2
        where t1.student_no = t2.student_no;

--------------------------------------------------------------------------
------------------------4�� 5. ������(SEQUENCE)-----------------------------
--------------------------------------------------------------------------


/*������ SEQUENCE
    ����Ŭ������ �ڵ� ���� �÷��� ����� �� ����.
    ����Ŭ���� �ڵ� ������ �����ϱ� ���ؼ� MAX(�÷�) +1 �Ǵ� ������ ���.
*/               
                --��Ű����.��������
CREATE SEQUENCE scott.emp_seq
       INCREMENT BY 1 --������(1�� ����)
       START WITH 1   --���۰�
       MINVALUE 1     --�ּڰ�
       MAXVALUE 9999  --�ִ�
       NOCYCLE        --�ִ� ���޽� ���۰����� �ٽ� �ݺ�
       NOCACHE        --CACHE�� ����� �� ����
       NOORDER;       --��û ������� ���� �������� ����
/*
NOCYCLE | CYCLE : NOCYCLE(�ݺ�����), CYCLE(�������� �ִ񰪿� ���� �� �ּڰ� 1���� �ٽý���)
NOCACHE | CACHE : NOCACHE(������), CACHE(ĳ�ø� ����Ͽ� �̸� ���� �Ҵ��� ���Ƽ� �ӵ��� ������, ���� ����ڰ� ���� ��� ����)
NOORDER | ORDER : NOORDER(������), ORDER(��û ������ ���� �����Ͽ� �߻� ������ ���������� ������ �ý��� ���ϰ� ����)

*/
CREATE SEQUENCE emp_seq
       increment by 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
       
select emp_seq.nextval
from dual;  --�������� �ϳ��� ���������ݴϴ�.

select emp_seq.currval
from dual;  --���� ������ ���� ����մϴ�.

--�������� �����մϴ�
drop sequence emp_seq;

insert into emp values(EMP_SEQ.nextval, '�Ѹ�', 1);

select * from emp;

alter sequence emp_seq increment by 1; --���� emp_seq.nextval�� �ϸ� 2�� ������.

truncate table emp; -- ���̺� �ȿ� �ִ� �����͸� ���� �����ش�.

create sequence scott.emp_seq
        increment by 1
        start with 1
        minvalue 1
        maxvalue 9999
        nocycle
        nocache
        noorder
        ;