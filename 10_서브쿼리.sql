/*
# 서브쿼리 
: SQL 문장 안에 또다른 SQL을 포함하는 방식.
 여러 개의 질의를 동시에 처리할 수 있습니다.
 WHERE, SELECT, FROM 절에 작성이 가능합니다.

- 서브쿼리의 사용방법은 () 안에 명시함.
 서브쿼리절의 리턴행이 1줄 이하여야 합니다. -> 단일행 원칙
- 서브쿼리 절에는 비교할 대상이 하나 반드시 들어가야 합니다.
- 해석할 때는 서브쿼리절 부터 먼저 해석하면 됩니다.
*/

--이름이 'Nancy'인 사원보다 급여가 높은 사원을 조회하기.
SELECT salary FROM employees
WHERE first_name = 'Nancy';
---------------------------------------
SELECT first_name FROM employees
WHERE salary>12008;
---------------------------------------
-- 서브쿼리 활용한 문장 
SELECT first_name FROM employees
WHERE salary>(SELECT salary FROM employees
              WHERE first_name = 'Nancy');
--------------------------------------------------------------------------------
-- employee_id가 103번인 사람의 job_id와 동일한 job_id를 가진 사람을 조회.
SELECT *from employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE employee_id =103);
--------------------------------------------------------------------------------
-- 다음문장은 서브쿼리가 리턴하는 행이 여러개라서 단일 행 연산자를 사용할 수 없다.
-- 단일 행 연산자 : 주로 비교 연산자(=,<,>,<=,>=,<>)를 사용하는 경우는 하나의 행만 반환되어야 한다.
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE last_name = 'King'); -- 에러
--------------------------------------------------
-- 다중 행 연산자 (IN, ANY, ALL, EXIST)
-- IN : 조회된 목록의 어떤값과 같은지를 비교
-- ex) salary > ANY (200,300,400)
        250 -> 

SELECT * FROM employees
WHERE job_id IN (SELECT job_id FROM employees
                WHERE last_name = 'King');

---------------------------------------------------
-- first_name이 David인 사람들의 급여와 같은 급여를 받는 사람들을 조회.
SELECT * FROM employees
WHERE salary in (SELECT salary FROM employees
                  WHERE first_name = 'David');
                  
---------------------------------------------------                  
-- ANY, SOME : 값을 서브쿼리에 의해 리턴된 가가의 값과 비교해서
-- 하나라도 만족하면 조회 대상에 포함됩니다. 
-- ex) salary > ANY (200,300,400)
--       250 -> true 
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees
                  WHERE first_name = 'David');

---------------------------------------------------
-- ALL : 값을 서브쿼리에 의해 리턴된 각각의 값과 비교해서 
-- 전부 다 일치해야 조회대상에 포함됩니다.
-- ex) salary > ALL (200,300,400)
--       250 -> false 200보다 크지만 300, 400보다 크지 않으므로 false 입니당!
SELECT * FROM employees
WHERE salary > ALL (SELECT salary FROM employees
                  WHERE first_name = 'David');
                  
---------------------------------------------------
-- EXISTS : 서브쿼리가 하나 이상의 행을 반환하면 참으로 간주.
-- job_history에 존재하는 직원이 emplloyees에도 존재한다면 조회 대상에 포함.
-- 서브쿼리 내에서 jh에 있는 id와 e에 있는 id가 일치할 떄마다 1이라는 값을 조회.
-- EXISTS 연산자가 1이 조회가 될때 데이터가 존재한다는 것을 판단하여
-- employees에서 해당 사원의 모든 칼럼을 조회.
SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM job_history jh
              WHERE e.employee_id = jh.employee_id);

--------------------------------------------------------------------------------
-- SELECT절에 서브쿼리 붙이기.
-- 스칼라 서브쿼리라고도 칭함.
-- 스칼라 서브쿼리 : 실행 결과가 단일 값을 반환하는 서브쿼리. 주로 SELECT, WHERE절에서 사용됨.
SELECT
    e.first_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.first_name;

---------------------------------------------------

SELECT
    e.first_name,
    (
        SELECT
            d.department_name
        FROM departments d
        WHERE d.department_id = e.department_id
    )AS department_name
FROM employees e
ORDER BY e.first_name;

/*
# 스칼라 서브쿼리 vs LEFT JOIN
a. 간단한 상황에서 사용하면 쿼리가 직관적이고 간결합니다. 
b. 단일 값을 반환하는 서브커리에서 유용.
c. 대량데이터가 아닌 경우나, 서브쿼리의복잡도가 낮은 경우 적합

1. 대량 데이터를 처리하거나, 여러 컬럼을 붙여야 할 때 유리합니다.
2. 여러 테이블을 한 번에 조인해야 할 경우.
3. 다중값 처리 및 중복 데이터 있는 경우 성능상 좀 더 유리.
*/
--------------------------------------------------------------------------------
--각 부서별 사원수 뽑기(부서명, 사원수)
SELECT
    d.department_name,
    COUNT(*) AS 사원수
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_name, d.department_id
ORDER BY 사원수 DESC;


SELECT
    d.department_name,
    NVL((SELECT COUNT(*)
    FROM employees e
    WHERE e.department_id = d.department_id
    GROUP BY department_id),0)AS 사원수
FROM departments d ;
SELECT * FROM departments;

--------------------------------------------------------------------------------
-- FROM 절 서브쿼리 (인라인 뷰)
-- 특정 테이블 전체가 아닌 SELECT를 통해 일부 데이터를 조회한 것을
-- 가상 테이블로 사용하고 싶을떄.
-- 순번을 정해놓은 조회자료를 범위를 지정해서 가지고 오는 경우.
SELECT *
FROM(
    SELECT
        ROWNUM AS rn, tbl.*
    FROM
        (
        SELECT 
            employee_id,first_name,salary 
        FROM employees
        ORDER BY salary DESC
        ) tbl
    )
WHERE rn > 10 AND 20 >= rn ;

/*
가장 안쪽 SELECT 절에서 필요한 테이블 형식(인라인 뷰)을 생성.
바깥쪽 SELECT 절에서 ROWNUM을 붙여서 다시 조회
가장 바깥쪽 SELECT 절에서는 이미 붙어있는 ROWNUM의 범위를 지정해서 조회.

** SQL의 실행 순서
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/
--------------------------------------------------------------------------------
SELECT
    e.employee_id, e.salary,
    tbl.average_salary,
    tbl.department_id
FROM employees e JOIN 
(SELECT
    department_id,
    TRUNC(AVG(salary),0) AS average_salary
FROM employees
GROUP BY department_id)tbl
ON e.department_id = tbl.department_id;
