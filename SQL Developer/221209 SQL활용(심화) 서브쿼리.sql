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
                                            
                                            