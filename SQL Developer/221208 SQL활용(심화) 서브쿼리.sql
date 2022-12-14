--서브 쿼리
/*  스칼라 서브 쿼리
주로 SELECT절에 위치.
컬럼 대신 사용되므로 반드시 하나의 값만을 반환해야 한다.
*/
SELECT T1.STUDENT_NO,
    (SELECT T2.STUDENT_NAME
    FROM ACADEMY_B T2
    WHERE T2.STUDENT_NO = T1.STUDENT_NO) AS NAME --3~5번열 = NAME값.  AS NAME은 별칭
FROM ACADEMY_A T1;
    
/* 인라인 뷰
FROM 절에 SELECT 구문이 온다.
*/
SELECT T1.STUDENT_NO, T2.STUDENT_NAME
    FROM ACADEMY_A T1,
        (SELECT STUDENT_NO, STUDENT_NAME FROM ACADEMY_B) T2
    WHERE T1.STUDENT_NO = T2.Student_No;
    
SELECT ROWNUM, SAWON_NAME FROM SAWON;
DELETE FROM SAWON 