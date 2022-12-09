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
/*������ ��������: ����Ŀ�̸��� 1�� ������ �����͸� ��ȯ,
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
