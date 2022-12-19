--����1. emp ���̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�.
    select EMPNO, ENAME, SAL from emp;
--����2. emp ���̺��� �����ȣ, ����̸�, ����, ������ ���ϰ� ���� �÷����� �����ȣ, ����̸�, ����, �������� ����Ͻÿ�.
    select empno as �����ȣ, ename as ����̸�, sal as ����, sal*12 as ���� from emp; 
--����3. employees ���̺��� ��� �������� �޿��� $300���� ��Ű�� ���ؼ� ���� �����ڸ� ����ϰ� ����� �̸��� SALARY, SALARY+300�� ��� �մϴ�.
    select first_name||' '||last_name as �̸�, salary, salary+300 from employees;
--����4. EMPLOYEES ���̺��� �̸�(last_name + first_name)�� ������ "KING: 1 Year salary = 60000" �������� ����Ͽ���. 
    select first_name||' '||last_name||': 1 Year salary =' ||salary*12 from employees;
--����5. EMPLOYEES ���̺��� �Ի����ڰ� 1995�� 1�� 1�� ���Ŀ� �Ի��� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�
    select employee_id as �����ȣ,
           first_name||' '||last_name as ����,
           job_id as ������,
           hire_date as �Ի�����,
           department_id as �μ���ȣ 
           from employees
           where hire_date > '1995-01-01';
    
           
--����6. EMPLOYEES ���̺��� �޿��� 3000���� 5000������ ������ ����, ������, �޿�, �μ���ȣ�� ����϶�.
    select first_name||' '||last_name as ����,
           job_id as ������,
           salary as �޿�,
           department_id as �μ���ȣ
           from employees
           where salary between 3000 and 5000; --where salary >= 3000 and salary <= 5000;
           
--����7. EMPLOYEES ���̺��� �����ȣ�� 144, 176, 200 �� ����� ������ �����ȣ, ����, ������, �޿�, �Ի����ڸ� ����϶�.
    select employee_id as �����ȣ,
           first_name||' '||last_name as ����,
           job_id as ������,
           salary as �޿�,
           hire_date as �Ի�����
           from employees
           where employee_id in (144,176,200);
--����8.emp ���̺� ���� ������ SALESMAN �Ǵ� MANAGER�̸鼭 �޿��� (1,600, 2,975, 2,850)�� �ƴ� ��� ����� �̸�, ���� �� �޿��� ǥ���Ͻÿ�.
    select ename as �̸�,
           job as ������,
           sal as �޿�
           from emp
           where (job = 'SALESMAN' or job = 'MANAGER') and sal not in (1600,2975,2850);

--����9.EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ�޿�, �޿��� ���� ���Ͽ� ����϶�.
    select department_id, count(department_id) as �ο���, trunc(avg(salary),3) as ��ձ޿�, min(salary) as �����޿�, max(salary) as �ְ�޿�, SUM(salary) "�޿��� ��"  from employees group by department_id order by department_id desc;
    
    
--���� 10. EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ����Ͽ���(GROUP BY, HAVING)
    select department_id as �μ���ȣ, count(department_id) as �ο���, sum(salary) as �޿����� from employees group by department_id having count(department_id) > 4;
    
--���� 11. EMPLOYEES ���̺��� ��ü ������ 10000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����϶�. �� job_id�� 'SA '�� �����ϴ� ������ �����ϰ� �� �޿� �հ�� ����(��������) �϶�. 
    select job_id, sum(salary) from employees group by job_id having sum(salary) > 10000 and job_id not like 'SA%' order by sum(salary) desc;
    select job_id, sum(salary) from employees where job_id not like 'SA%' group by job_id having sum(salary) > 10000 order by sum(salary) desc;
    
    --select job_id "����", sum(salary) over(partition by job_id) "���޿��հ�" from employees where  > 10000 and job_id not like 'SA%' ;

--����12. emp���̺��� ����̸� �� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� �����Ͽ� ���
    select substr(ename,0,3) from emp where ename like '%A%';
    



--���⼭ ���� join����

--����13. ��� ����� �̸�, �μ���ȣ, �μ��̸��� ǥ���Ͻÿ�. (emp, dept)
select e.ENAME, e.deptno, d.deptno, d.dname
    from emp e
    full outer join dept d
    ON e.deptno = d.deptno;
    
select e.ename, e.deptno, d.deptno, d.dname
    from emp e, dept d
    where e.deptno = d.deptno;


--����14. ������ MANAGER�� ����� ������ �̸�, ����, �μ���, �ٹ��� ������ ����Ͻÿ�. ( emp, dept)
select e.ename, e.job, d.dname, d.loc
    from emp e, dept d
    where e.deptno = d.deptno
    and e.job = 'MANAGER';
    
select e.ename, e.job, d.dname, d.loc
    from emp e, dept d
    where e.deptno = d.deptno and e.job = 'MANAGER';
    
select e.ename, e.job, d.dname, d.loc 
    from emp e 
    inner join dept d 
    on e.deptno = d.deptno 
    where e.job = 'MANAGER';
    
    

--����15. Ŀ�̼�(emp���̺��� comm �÷��̿�)�� �ް� �޿��� 1,600�̻��� ����� ����̸�, �μ���, �ٹ����� ����Ͻÿ�.( emp, dept)
select e.ename "����̸�", d.dname "�μ���", d.loc "����"
    from emp e
    inner join dept d
    on e.deptno = d.deptno
    where e.comm is not null  and e.sal >= 1600;
    

--����16. �ٹ����� CHICAGO�� ��� ����� �̸�,����,�μ���ȣ �� �μ��̸��� ǥ���Ͻÿ�. ( emp, dept)
select e.ename "�̸�", e.job "����", e.deptno "�μ���ȣ", d.deptno "�μ���ȣ" ,d.dname "�μ��̸�", d.loc "�ٹ���"
    from emp e
    inner join dept d
    on e.deptno = d.deptno
    where d.loc = 'CHICAGO';


--���⼭ ���� �������� ����

--����17. emp���̺� ���� �����ȣ�� 7900�� ����� ���� ��¥�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
select e.ename "�̸�", e.hiredate "�����ȣ"
    from emp e
    where hiredate = (select hiredate
                        from emp
                        where empno = 7900);
                        
select e.ename "�̸�", e.hiredate "�����ȣ"
    from emp e
    where e.hiredate = (select hiredate from emp where empno = 7900);

--����18. emp���̺� ���� ���ӻ��(mgr)�� KING�� ��� ����� �̸��� �޿��� ����Ͻÿ�.
select e.ename "����̸�", e.sal "�޿�", e.mgr "���ӻ��mgr"
        from emp e
        where mgr in (select mgr
                    from emp
                    where mgr = 7839);  

select * from emp;

select e.ename "����̸�", e.sal "�޿�", e.mgr "���ӻ��mgr"
        from emp e
        where mgr = (select empno from emp where ename = 'KING');
                    
/*single-row subquery returns more than one row                     

select e.ename "����̸�", e.sal "�޿�"
            from emp e
            where mgr = (select mgr
                        from emp
                        where mgr = 7839);     select~7839���� 3���� ���� return.
������ �񱳴� 1���� ������ �������ϹǷ�. �̷����� ������ ���� ����Ͽ����Ѵ�.
*/



--����19. EMPLOYEES ���̺��� (�޿��� ���)���� ���� ����� ������ �����ȣ,�̸�,������,�޿�,�μ���ȣ�� ����Ͽ���

select e.employee_id "�����ȣ", e.last_name "�̸�", e.job_id "������", e.salary "�޿�", e.department_id "�μ���ȣ"
    from employees e
    where salary < (select avg(nvl(salary,0)) --NVL(A, B) A�� null�̶�� B��� ���� ����.
                    from employees e) order by salary desc;
 
 select * from employees;
 select employee_id, last_name, job_id, salary, department_id from employees where salary < ( select avg(salary)
                                            from employees) order by salary desc;
--����20. EMPLOYEES ���̺��� (Kochhar�� �޿�)���� ���� ����� ������ �����ȣ,�̸�,������,�޿��� ����϶�.

select e.employee_id "�����ȣ", e.last_name "�̸�", e.job_id "������", e.salary "�޿�"
    from employees e
    where salary > (select salary
                    from employees
                    where last_name = 'Kochhar');
select e.employee_id "�����ȣ", e.last_name "�̸�", e.job_id "������", e.salary "�޿�"
    from employees e
    where salary > (select salary from employees where last_name = 'Kochhar');
--���� 21. emp���̺� ���� (BLAKE�� ���� �μ�)�� �ִ� ������� �̸��� �Ի����� ���ϴµ� BLAKE�� �����ϰ� ����Ͻÿ�.(BLAKE�� �������� �� ����

select e.ename "�̸�", e.hiredate "�Ի���"
    from emp e
    where deptno in (select deptno
                            from emp
                            where ename = 'BLAKE') and ename != 'BLAKE';
select e.ename "�̸�", e.hiredate "�Ի���"
    from emp e
    where deptno = (select deptno from emp where ename = 'BLAKE') and ename != 'BLAKE';
    
    