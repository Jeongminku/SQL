-----------------------WHERE, HAVING절에서 사용. 중첩 서브쿼리-----------------------
--비연관, 연관, 단일행, 다중행, 다중컬럼

--비 연관 서브쿼리.
select *
    from academy_a 
    where student_name = (select student_name
                          from academy_b
                          where student_no = 1003);
          
          
--연관 서브쿼리.                
select *
    from academy_a t1
    where student_name = (select t2.student_name
                          from academy_b t2
                          where t2.student_no = t1.student_no);
                          
                          
--중첩 서브쿼리. -- 단일행, 다중행, 다중컬럼 서브쿼리 로 나뉨.
/*단일행 서브쿼리: 서브쿼리가 1건 이하의 데이터를 반환,
단일행 비교 연산자와 같이 사용 (=, >, <, => ,<=)
*/


--단일행
select *
        from academy_a
        where student_name = (select student_name
                              from academy_b
                              where student_no = 1003);
               /* 여기만 실행시키면 1개만 값을 냄. 값이 하나이므로 단일 행 비교 사용 가능.
                              select student_name
                              from academy_b
                              where student_no = 1003
                */




/*--다중행 서브쿼리
            서브쿼리가 여러건의 데이터를 반환
            다중행 비교 연산자와 같이 사용(IN)*/

--다중행(오류발생ver)
SELECT *
        from academy_a  --오류발생. 값을 2개를뱉으므로 단일행(=)으로 쓸 수가 없다.
        where student_name = ( select student_name
                               from academy_b
                               where student_no = 1003 or student_no = 1004);

--다중행(정상 ver)
SELECT *
        from academy_a  --(괄호에있는 select가)값을 2개를뱉으므로 단일행(=)으로 쓸 수가 없으므로 in 으로 바꿈..
        where student_name in (select student_name
                               from academy_b
                               where student_no = 1003 or student_no = 1004);
                               
                               

/*--다중 컬럼 서브쿼리
        서브쿼리가 여러컬럼의 데이터를 반환
        다중행 비교 연산자와 같이 사용(IN)   */
SELECT *
        FROM academy_a
        where (student_name, student_no) in(select student_name, student_no
                                            from academy_b
                                            where student_no = 1003 or student_no = 1004);


------------------------4장 3.GROUP BY, HAVING, ORDER BY-------------------------
SELECT type, count(name) as count  --count(카운팅 할 컬럼 이름)
            from gift 
            group by type
           --count가 2 이상인 애들을 출력.
            having count(name) > = 2 
            order by type asc --가나다 순으로 정렬
            ;




------------------------4장 4. 윈도우 함수----------------------------------------
select * from student_grade;
--rank = 동일한 점수는 10등 10등으로 체크하는데 11등을 체크하지않음. 공동 10위 이후 12위가 등장.
--즉 1,2,3,3,5 등 이런식으로 가는것 (3등이 공동이라고 가정했을때.)
select student_name,score as 점수, rank() over(order by score desc) as 랭크 from student_grade;

--denserank = 동일한 점수를 다른 등수로 카운트하지않습니다.   공동 10위 이후 11위가 등장.
--즉 1,2,3,3,4,5 이렇게 진행됩니다.
select student_name,score as 점수, dense_rank() over(order by score desc) as 덴스_랭크 from student_grade;

--row_number는 같은 값일 지언정 1개의 숫자만을 내 뱉습니다. 공동 10위가 존재하지않고 10, 11로 됩니다.
--3등이 점수가 같다고 가정해도 1,2,3,4,5,6,7 로 숫자를 뿌려줍니다.
select student_name,score as 점수, row_number() over(order by score desc) as 로우_넘버 from student_grade;


SELECT TYPE, SUM(price) AS sum합계 FROM gift GROUP BY TYPE;
SELECT TYPE, PRICE ,SUM(PRICE) OVER(PARTITION BY TYPE) AS SUM합계 FROM GIFT; --over를 사용시 이미 group을 해주기때문에 group을 빼야함.
select type, max(price) as max값 from gift group by type;
select type, min(price) as min값 from gift group by type;
select type, avg(price) as avg값 from gift group by type;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------4장 2.VIEW 뷰----------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--create or replace view 뷰이름 as 쿼리문
--뷰 이름은 테이블 이름과 중복될 수 없습니다.
create or replace view academy_all as select * from academy_a;

-- select * from academy_all where student_no = 1004;

create or replace view academy_student_name as
    select student_no from academy_a;

select * from academy_student_name;
select * from academy_all;

insert into academy_all values(1005, '정민구');
insert into academy_student_name('정민구2'); --오류발생. 안들어감. 데이터변경 제약 존재 같은 느낌(?)
            
            --테이블명
insert into academy_student_name values(1005);--cannot insert NULL into

drop view academy_join;

create or replace view academy_join as
    select t1.student_no, t1.student_name
        from academy_a t1, academy_b t2
        where t1.student_no = t2.student_no;

--------------------------------------------------------------------------
------------------------4장 5. 시퀀스(SEQUENCE)-----------------------------
--------------------------------------------------------------------------


/*시퀀스 SEQUENCE
    오라클에서는 자동 증가 컬럼을 사용할 수 없음.
    오라클에서 자동 증가를 실행하기 위해선 MAX(컬럼) +1 또는 시퀀스 사용.
*/               
                --스키마명.시퀀스명
CREATE SEQUENCE scott.emp_seq
       INCREMENT BY 1 --증가값(1씩 증가)
       START WITH 1   --시작값
       MINVALUE 1     --최솟값
       MAXVALUE 9999  --최댓값
       NOCYCLE        --최댓값 도달시 시작값부터 다시 반복
       NOCACHE        --CACHE를 사용할 지 여부
       NOORDER;       --요청 순서대로 값을 생성할지 여부
/*
NOCYCLE | CYCLE : NOCYCLE(반복안함), CYCLE(시퀀스의 최댓값에 도달 시 최솟값 1부터 다시시작)
NOCACHE | CACHE : NOCACHE(사용안함), CACHE(캐시를 사용하여 미리 값을 할당해 놓아서 속도가 빠르며, 동시 사용자가 많을 경우 유리)
NOORDER | ORDER : NOORDER(사용안함), ORDER(요청 순서로 값을 생성하여 발생 순서를 보장하지만 조금의 시스템 부하가 있음)

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
from dual;  --시퀀스를 하나씩 증가시켜줍니다.

select emp_seq.currval
from dual;  --현재 시퀀스 값을 출력합니다.

--시퀀스를 삭제합니다
drop sequence emp_seq;

insert into emp values(EMP_SEQ.nextval, '둘리', 1);

select * from emp;

alter sequence emp_seq increment by 1; --이제 emp_seq.nextval로 하면 2씩 증가함.

truncate table emp; -- 테이블 안에 있는 데이터를 전부 지워준다.

create sequence scott.emp_seq
        increment by 1
        start with 1
        minvalue 1
        maxvalue 9999
        nocycle
        nocache
        noorder
        ;