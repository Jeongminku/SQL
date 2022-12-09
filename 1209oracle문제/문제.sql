--문제1. emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오.
    select EMPNO, ENAME, SAL from emp;
--문제2. emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 사원번호, 사원이름, 월급, 연봉으로 출력하시오.
    select empno as 사원번호, ename as 사원이름, sal as 월급, sal*12 as 연봉 from emp; 
--문제3. employees 테이블에서 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 이름과 SALARY, SALARY+300를 출력 합니다.
    select first_name||' '||last_name as 이름, salary, salary+300 from employees;
--문제4. EMPLOYEES 테이블에서 이름(last_name + first_name)과 연봉을 "KING: 1 Year salary = 60000" 형식으로 출력하여라. 
    select first_name||' '||last_name||': 1 Year salary =' ||salary*12 from employees;
--문제5. EMPLOYEES 테이블에서 입사일자가 1995년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라
    select employee_id as 사원번호,
           first_name||' '||last_name as 성명,
           job_id as 담당업무,
           hire_date as 입사일자,
           department_id as 부서번호 
           from employees
           where hire_date > '1995-01-01';
           
--문제6. EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 성명, 담당업무, 급여, 부서번호를 출력하라.
    select first_name||' '||last_name as 성명,
           job_id as 담당업무,
           salary as 급여,
           department_id as 부서번호
           from employees
           where salary between 3000 and 5000; --where salary >= 3000 and salary <= 5000;
           
--문제7. EMPLOYEES 테이블에서 사원번호가 144, 176, 200 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자를 출력하라.
    select employee_id as 사원번호,
           first_name||' '||last_name as 성명,
           job_id as 담당업무,
           salary as 급여,
           hire_date as 입사일자
           from employees
           where employee_id in (144,176,200);
--문제8.emp 테이블 에서 업무가 SALESMAN 또는 MANAGER이면서 급여가 (1,600, 2,975, 2,850)이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오.
    select ename as 이름,
           job as 담당업무,
           sal as 급여
           from emp
           where (job = 'SALESMAN' or job = 'MANAGER') and sal not in (1600,2975,2850);

--문제9.EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 최저급여, 최고급여, 급여의 합을 구하여 출력하라.
    select department_id, count(department_id) as 인원수, trunc(avg(salary),3) as 평균급여, min(salary) as 최저급여, max(salary) as 최고급여, SUM(salary) "급여의 합"  from employees group by department_id order by department_id desc;
    
    
--문제 10. EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력하여라(GROUP BY, HAVING)
    select department_id as 부서번호, count(department_id) as 인원수, sum(salary) as 급여의합 from employees group by department_id having count(department_id) > 4;
    
--문제 11. EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하라. 단 job_id가 'SA '로 시작하는 직원은 제외하고 월 급여 합계로 정렬(내림차순) 하라. 
    select job_id, sum(salary) from employees group by job_id having sum(salary) > 10000 and job_id not like 'SA%' order by sum(salary) desc;
    --select job_id "업무", sum(salary) over(partition by job_id) "월급여합계" from employees where  > 10000 and job_id not like 'SA%' ;

--문제12. emp테이블에서 사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 출력
    select substr(ename,0,3) from emp where ename like '%A%';
    



--여기서 부터 join문제

--문제13. 모든 사원의 이름, 부서번호, 부서이름을 표시하시오. (emp, dept)
select e.ENAME, e.deptno, d.deptno, d.dname
    from emp e
    full outer join dept d
    ON e.deptno = d.deptno;


--문제14. 업무가 MANAGER인 사원의 정볼르 이름, 업무, 부서명, 근무지 순으로 출력하시오. ( emp, dept)
select e.ename, e.job, d.dname, d.loc
    from emp e, dept d
    where e.deptno = d.deptno
    and e.job = 'MANAGER';
    

    
    

--문제15. 커미션(emp테이블의 comm 컬럼이용)을 받고 급여가 1,600이상인 사원의 사원이름, 부서명, 근무지를 출력하시오.( emp, dept)

--문제16. 근무지가 CHICAGO인 모든 사원의 이름,업무,부서번호 및 부서이름을 표시하시오. ( emp, dept)


--여기서 부터 서브쿼리 문제

--문제17. emp테이블 에서 사원번호가 7900인 사원과 같은 날짜에 입사한 사람의 이름과 입사일을 출력하시오.

--문제18. emp테이블 에서 직속상사(mgr)가 KING인 모든 사원의 이름과 급여를 출력하시오.

--문제19. EMPLOYEES 테이블에서 (급여의 평균)보다 적은 사원의 정보를 사원번호,이름,담당업무,급여,부서번호를 출력하여라

--문제20. EMPLOYEES 테이블에서 (Kochhar의 급여)보다 많은 사원의 정보를 사원번호,이름,담당업무,급여를 출력하라.

--문제 21. emp테이블 에서 (BLAKE와 같은 부서)에 있는 사원들의 이름과 입사일을 구하는데 BLAKE는 제외하고 출력하시오.(BLAKE가 여러명일 수 있음


