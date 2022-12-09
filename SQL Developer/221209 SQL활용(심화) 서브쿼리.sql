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
/*단일행 서브쿼리: 서브커ㅜ리가 1건 이하의 데이터를 반환,
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
                                            
                                            