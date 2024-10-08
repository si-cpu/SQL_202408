--- 오라클 주석입니다.
/*
여러 줄 주석입니다.

호호호~~~

*/

--SELECT[컬러명(여러 개 가능)] FROM [테이블 이름]
SELECT -- select는 조회하라는의미이다.
    *
FROM 
    employees;
------------------------------    
SELECT
    employee_id,first_name,last_name
FROM
    employees;
------------------------------    
SELECT
    email,phone_number,hire_date
FROM
    employees;
------------------------------
--컬럼을 조회하는 위치에서 산술연산이 가능합니다.
SELECT
    employee_id, 
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS 성과포함 급여 
from
    employees;
------------------------------
-- NULL값의 확인 (숫자 0과 공백과는 다른 존재입니다.)
SELECT
    department_id, commission_pct
FROM employees;

---------------------------------
--alias(칼럼명과 테이블명의 이름을 변경해서 조회합니다.)
SELECT 2
    first_name AS 이름,
    last_name AS 성,
    salary AS 급여
FROM employees;

-----------------------------------
/*
오라클은 홑따옴표로 문자를 표현하고, 문자열 안에 홑따옴표 특수기호를
표현하고 싶다면 ''를 두 번 연속으로 쓰시면 됩니다.
문자열 연결기호는 || 입니다. 문자열의 덧셈 연산을 허용하지 않습니다.
*/
SELECT
    first_name ||''|| last_name||'''s salary is $'||salary As 완성된 문장
FROM employees;
-----------------------------------------------
--DISTINCT(중복행의 제거)
SELECT DISTINCT
    department_id
FROM employees;
------------------------------
--ROWNUM ROWID
--**ROWNUM(로우넘) : 쿼리에 의해 반환되는 행 번호를 표현
--ROWID(로우 아이디) : 데이터베이스 내의 행의 주소를 반환
SELECT
    ROWNUM, ROWID, employee_id
FROM employees;
---------------------------------

