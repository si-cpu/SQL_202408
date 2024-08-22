SELECT
    *
FROM employees;
-----------------------------------------
-- 절 비교 (데이터 값은 대/소문자를 구분합니다.)
SELECT
    first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';
---------------------------------------- 
SELECT
    *
FROM employees
WHERE last_name = 'King';
-----------------------------------------
SELECT
    *
FROM employees
WHERE department_id = 50;
------------------------------------------
SELECT
    *
FROM employees
WHERE salary >= 15000
AND salary <20000;
----------------------------------------
---데이터 행제한 ( BETWEEN, IN, LIKE)
SELECT
    *
FROM employees
WHERE salary BETWEEN 15000 AND 200000
------------------------------------
SELECT
    *
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

---------------------------------------------------
--IN 연산자의 사용 (특정 값들과 비교할떄 사용)
SELECT
    *
FROM employees
WHERE manager_id IN (100,101, 102);

--------------------------------------------------

SELECT
    *
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-------------------------------------------------
-- LIKE 연산자 (지정 문자열 포함 여부)
-- %는 어떠한 문자든, _는 데이터의 자리(위치)를 표현할 떄

SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE'03%'; --03으로 시작한다면 나와라 얍

---------------------------------------------------

SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE'%05%';

-------------------------------------------------------

SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE'___05%'; --5월을 조회하고 싶다면 언더바 3개를 이용한다. 


-------------------------------------------------------
-- IS NULL(NULL값을 찾음)
SELECT
    *
FROM employees
WHERE commission_pct IS NULL;

-------------------------------------------------------

SELECT
    *
FROM employees
WHERE commission_pct IS NOT NULL;

--------------------------------------------------------
-- good
SELECT
    *
FROM employees
WHERE (job_id ='IT_PROG'
OR job_id = 'FI_MGR')
AND salary>=6000;

--------------------------------------------------------
-- bad and가 or보다 우선순위가 높으므로 먼저 산술된다.
SELECT
    *
FROM employees
WHERE job_id ='IT_PROG'
OR job_id = 'FI_MGR'
AND salary>=6000;

--------------------------------------------------------
-- 데이터의 정렬(SELECT 구문의 가장 마지막에 배치되며 가장 나중에 실행됩니다.)
-- ASC : 오름차(ascending)
-- DESC : 내림차(descending)

SELECT
    *
FROM employees
ORDER BY hire_date ASC;

---------------------------------------------------------

SELECT
    *
FROM employees
ORDER BY hire_date DESC;

---------------------------------------------------------
-- FROM -> WHERE -> GROUPBY ->SELECT -> ODERBY 순으로 실행되기 떄문에
-- 무조건 FROM부터 실행된다는 것을 이해하자 
SELECT
    first_name,
    salary*12 AS pay
FROM employees
ORDER BY pay DESC


    
