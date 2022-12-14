-- ■ 1. emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오. ■ scott 계정
select e.empno, e.ename, e.sal from emp e;
-- ■ 2. emp 테이블에서 사원이름과 월급을 출력하는데 컬럼명은 이 름, 월 급으로 바꿔서 출력하시오. ■ scott계정
select ename "이 름", sal "월 급" from emp;
-- ■ 3. emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 사원번호, 사원이름, 월급,연봉으로 출력하시오, ■ scott 계정
select empno "사원번호", ename "사원이름", sal "월급", sal*12 "연봉" from emp;
-- ■ 4. emp 테이블 의 업무(job)를 중복되지 않게 표시하시오. ■ scott 계정
select job from emp group by job;
-- ■ 5. emp 테이블의 사원명과 업무로 연결(SMITH, CHECK)해서 표시하고 컬럼명은 Employee and job으로 표시하시오. ■ scott 계정
select ename || ',' || job "Employee and job" from emp;
-------------------------------------------------------------------------------------------------------------------------

-- ■ 1. EMPLOYEES table의 모든 자료를 출력하라 ■ hr 계정
select * from employees;
-- ■ 2. EMPLOYEES table의 컬럼들을 모두 출력하라. ■ hr 계정
desc employees;
describe employees;
--describe : 설명하다.   약어 : desc


-- ■ 3. EMPLOYEES에서 사원번호, 이름, 급여, 담당업무를 출력하라. ■ hr 계정
select employee_id "사원번호" , FIRST_NAME || ' ' || LAST_NAME "이름", SALARY "급여", JOB_ID "담당업무" FROM EMPLOYEES;

-- ■ 4. 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 SALARY+300 디스플레이 합니다. ■ hr 계정
SELECT SALARY + 300 FROM employees;

-- ■ 5. EMP 테이블에서 사원번호, 이름, 급여, 보너스, 보너스 금액을 출력여라 (참고로 보너스는 월급 + (월급 * 커미션)) ■ hr 계정
SELECT EMPLOYEE_ID "사원번호", FIRST_NAME || ' ' || LAST_NAME "이름", SALARY "급여", SALARY + ( SALARY * COMMISSION_PCT) "보너스" FROM EMPLOYEES;

-- ■ 6. EMPLOYEES 테이블에서 LSAT_NAME을 이름으로 SALARY을 급여로 출력하여라. ■ hr 계정
SELECT LAST_NAME "이름", SALARY "급여" FROM EMPLOYEES;

-- ■ 7. EMPLOYEES 테이블에서 LASY_NAME을 Name으로 SALARY*12를 Annual Salary(연봉)로 출력하여라. ■ hr 계정
SELECT LAST_NAME "Name", SALARY*12 "Annual Salary(연봉)" from employees;

-- ■ 8. EMPLOYEES 테이블에서 이름과 업무를 연결하여 출력하여라. ■ hr 계정
select FIRST_NAME || ' ' || LAST_NAME ||','|| job_id from employees;

-- ■ 9. EMPLOYEES 테이블에서 이름과 업무를 "KING is a PRESIDENT" 형식으로 출력하여라. ■ hr 계정
select FIRST_NAME || ' ' || LAST_NAME ||','|| jo "KING is a PRESIDENT" from employees;

-- ■ 10. EMPLOYEES 테이블에서 이름과 연봉을 "KING: 1 Year salary = 60000" 형식으로 출력하여라. ■ hr계정
select last_name||': 1 Year salary = '||salary * 12 from employees;


-- ■ 11. EMPLOYESS 테이블에서 JOB을 모두 출력하라. ■ hr 계정
select job_id from employees group by job_id;
--===========================================================================================================================

-- ■ 1. EMPLOYEES 테이블에서 급여가 3000이상인 사원읜 정보를 사원번호, 이름, 담당업무, 급여를 출력하라. ■
select * from employees;

-- ■ 2. EMPLOYEES 테이블에서 담당 업무가 ST_MAN 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라. ■
select employee_id"사원번호",First_name"이름",job_id"담당업무",salary"급여",department_id"부서번호" from employees where job_id = 'ST_MAN';

-- ■ 3. EMPLOYEES 테이블에서 입사일자가 2006년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary, hire_date, department_id from employees where hire_date > TO_DATE('2006-01-01', 'YYYY-MM-DD');
--해당사항은 없는듯??

-- ■ 4. EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 성명, 담당업무, 급여, 부서번호를 출력하라. ■
select first_name||' '||last_name "성명", job_id "담당업무", salary"급여",department_id"부서번호" from employees where salary between 3000 and 5000;

-- ■ 5. EMPLOYEES 테이블에서 사원번호가 145, 152, 203 인 사원의 정보를 사원번호, 성명, 담당업무, 급여,입사일자를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary, hire_date from employees where employee_id in (145, 152, 203);

-- ■ 6. EMPLOYEES 테이블에서 입사일자가 05년도에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary, hire_date, department_id from employees where hire_date >= TO_DATE('2005-01-01', 'YYYY-MM-DD') and hire_date < to_date('2006-01-01', 'yyyy-mm-dd');
--select * from employees where hire_date like '05%';

-- ■ 7. EMPLOYEES 테이블에서 보너스가 NULL인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 보너스, 부서번호를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary, hire_date, commission_pct * salary, department_id from employees where commission_pct IS NULL;

-- ■ 8. EMPLOYEES 테이블에서 급여가 1100이상이고 JOB이 ST_MAN 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary, hire_date, department_id from employees where salary >= 1100 and job_id = 'ST_MAN';

-- ■ 9. EMPLOYEES 테이블에서 급여가 10000이상이거나 JOB이 Manager 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary, hire_date, department_id from employees where salary >= 10000 or job_id = 'Manager';

-- ■ 10. EMPLOYEES 테이블에서 JOB이 ST_MAN, SA_MAN, SA_REP가 아닌 사원의 정보를 사원번호,성명, 담당업무, 급여, 부서번호를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary, department_id from employees where job_id not in ('ST_MAN','SA_MAN','SA_REP');

-- ■ 11. 업무가 PRESIDENT(AD_PRES) 이고 급여가 12000이상이거나 업무가 SA_MAN인 사원의 정보를 사원번호, 이름, 업무, 급여를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary from employees where JOB_ID = 'AD_PRES' and salary >= 12000 and job_id = 'SA_MAN';

-- ■ 12. 업무가 PRESIDENT(AD_PRES) 또는 SA_MAN 이고 급여가 12000이상이거나 사원의 정보를 사원번호, 이름, 업무, 급여를 출력하라. ■
select employee_id, last_name || ' ' || first_name, job_id, salary from employees where JOB_ID = 'AD_PRES' or salary >= 12000 or job_id = 'SA_MAN';

--==========================================================================================================================--
-- ■ 1. emp 테이블에서 사원번호가 7698 인 사원의 이름, 업무, 급여를 출력하시오. ■
select ename, job, sal , mgr "사원번호" from emp where mgr = '7698';

-- ■ 2. emp 테이블에서 사원이름이 SMITH인 사람의 이름과 월급, 부서번호를 구하시오. ■
select ename, sal, deptno from emp where ename = 'SMITH';
-- ■ 3. 월급이 2500이상 3500미만인 사원의 이름, 입사일, 월급을 구하시오. ■
select ename, hiredate, sal from emp where sal between 2500 and 3500;
-- ■ 4. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오. ■
select ename, job, sal from emp where sal not between 2000 and 3000;
-- ■ 5. 81년05월01일과 81년12월03일 사이에 입사한 사원의 이름, 급여, 입사일을 출력하시오. ■
select ename, sal, hiredate from emp where hiredate between '81/05/01' and '81/12/03';
-- ■ 6. emp테이블에서 사원번호가 7566,7782,7934인 사원을 제외한 사람들의 사원번호,이름, 월급을 출력하시오.  ■
select empno, ename, sal from emp where empno not in (7566,7782,7934);
-- ■ 7. 부서번호 30(deptno)에서 근무하며 월2,000달러 이하를 받는 81년05월01일 이전에 입사한 사원의 이름, 급여, 부서번호, 입사일을 출력하시오. ■
select ename, sal , deptno, hiredate from emp where deptno = 30 and sal < 2000;
-- ■ 8. emp테이블에서 급여가 2,000와 5,000 사이고 부서번호가 10 또는 30인 사원의 이름과 급여,부서번호를 나열하시오. ■
select ename, sal, deptno from emp where sal between 2000 and 5000 and (deptno = 10 or deptno = 30);
-- ■ 9. 업무가 SALESMAN 또는 MANAGER이면서 급여가 1,600, 2,975 또는 2,850이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오. ■
select ename, job, sal from emp where (job = 'SALESMAN' or JOB = 'MANAGER') and sal not in (1600, 2975,2850);
--10없음.

-- ■ 11. emp테이블에서 이름에 A와 E가 있는 모든 사원의 이름을 표시하시오. ■
select ename from emp where ename like ('%A%') and ename like ('%E%'); 
-- ■ 12. emp테이블에서 관리자가 없는 모든 사원의 이름과 업무를 표시하시오. ■
select ename, job from emp where job != 'MANAGER';
-- ■ 13. emp테이블에서 커미션 항목이 입력된 사원들의 이름과 급여, 커미션을 구하시오. ■
select ename, sal, comm from emp where comm is not null;
--==========================================================================================================================--

-- ■ 1. EMPLOYEES 테이블에서 입사일자 순으로 정렬하여 사원번호, 이름, 업무, 급여, 입사일자, 부서번호를 출력하라. ■
select employee_id, first_name || ' ' || last_name, job_id, hire_date, department_id from employees order by hire_date asc;
-- ■ 2. EMPLOYEES 테이블에서 가장 최근에 입사한 순으로 사원번호, 이름, 업무, 급여, 입사일자, 부서번호를 출력하라. ■
select employee_id, first_name || ' ' || last_name, job_id, hire_date, department_id from employees order by hire_date desc;
-- ■ 3. EMPLOYEES 테이블에서 부서번호로 정렬한 후 부서번호가 같을 경우 급여가 많은 순으로 정렬하여 사원번호, 성명, 업무, 부서번호, 급여를 출력하여라. ■
select employee_id, first_name || ' ' || last_name, job_id, department_id, salary from employees order by department_id asc, salary desc;
-- ■ 4. EMPLOYEES 테이블에서 첫번째 정렬은 부서번호로 두번째 정렬은 업무로 세번째정렬은 급여가 많은 순으로 정렬하여 사원번호, 성명, 입사일자, 부서번호, 업무, 급여를 출력하여라. ■
select employee_id"사원번호", first_name || ' ' || last_name"성명", hire_date"입사일자", department_id"부서번호", job_id "업무", salary "급여" from employees;
-- ■ 5. EMPLOYEES 테이블에서 King의 정보를 소문자로 검색하고 사원번호, 성명, 담당업무(소문자로), 부서번호를 출력하라. ■

-- ■ 6. EMPLOYEES 테이블에서 King의 정보를 대문자로 검색하고 사원번호, 성명, 담당업무(대문자로), 부서번호를 출력하라. ■

-- ■ 7. DEPARTMENTS 테이블에서 부서번호와 부서이름, 부서이름과 위치번호를 합하여 출력하도록 하라. ■

-- ■ 8. EMPLOYEES 테이블에서 이름의 첫 글자가 'K' 보다 크고 'Y' 보다 적은 사원의 정보를 사원번호, 이름, 업무, 급여, 부서번호를 출력하라. 단 이름순으로 정렬하여라. ■

-- ■ 9. EMPLOYEES 테이블에서 20번 부서 중 이름의 길이 및 급여의 자릿수를 사원번호, 이름, 이름의 자릿수, 급여 급여의 자릿수를 출력하라. ■

-- ■ 10. EMPLOYEES 테이블에서 이름 중 'e' 자의 위치를 출력하라. ■

-- ■ 11. 다음 쿼리를 실행하고 결과를 분석하라. ■
select round(4567.678), round(4567.678,0), round(4567.678,2), round(4567.678, -2) from dual;

-- ■ 12. EMPLOYEES 테이블에서 부서번호가 80인 사람의 급여를 30으로 나눈 나머지를 구하여 출력하라. ■

-- ■ 13. EMPLOYEES 테이블에서 30번 부서 중 이름과 담당 업무를 연결하여 출력하여라. 단 담당 업무를 한줄 아래로 출력하라. ■

-- ■ 14. EMPLOYEES 테이블에서 현재까지 근무일 수가 몇주 몇일 인가를 출력하여라. 단 근무 일수가 많은 사람 순으로 출력하여라. ■











