
SELECT * FROM info;
SELECT * FROM auth;


-- 이너(내부)조인
SELECT
    * 
FROM INFO i
INNER JOIN auth a
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------------

SELECT
    i.title, i.content, a.name, a.auth_id
FROM INFO i
JOIN auth a -- JOIN이라고만 쓰면 기본 INNER JOIN
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------------

SELECT
    i.title, i.content, a.name, a.auth_id
FROM INFO i
JOIN auth a 
ON i.auth_id = a.auth_id
WHERE a.name = '이경민';

--------------------------------------------------------------------------------
-- 아우터(외부)조인
SELECT
    * 
FROM INFO i LEFT JOIN auth a  -- info가 기준이므로 info 다 나옴.
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------------
--좌측테이블 우측테이블 데이터를 모두 읽어 표현하는 외부 조인(풀 아우터 조인)
-- 오라클문법
SELECT
    * 
FROM info i FULL JOIN auth a
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------------
--CROS JOIN은 JOIN조건을 설정하지 않기 떄문에 
-- 단순히 모든 칼럼에 대한 JOIN을 수행합니다. (실행결과 : 각 테이블의 행을 곱해주면 됨)
--실제로는 거의 사용하지 않음. 개념적으로 인지할것. for 자격증
--오라클 문법
SELECT * FROM
info CROSS JOIN auth;

--ANSI 문법
SELECT * FROM info, auth; -- 오라클의 cross join

--------------------------------------------------------------------------------
--여러개의 테이블의 조인 --> 키 값을 찾아 구문을 연결해서 쓰면 됩니다.
SELECT
    *
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id;

--------------------------------------------------------------------------------
/*
- 테이블 별칭 a, i를 이용하여 LEFT OUTER JOIN 사용.
- info, auth 테이블 사용
- job 컬럼이 scientist인 사람의 id, title, content, job을 출력.
*/

SELECT
    a.auth_id, i.title, i.content,a.job
FROM auth a
LEFT JOIN info i
ON i.auth_id = a.auth_id
WHERE a.JOb = 'scientist';

--------------------------------------------------------------------------------
-- SELF JOIN이란 동일 테이블 사이의 조인을 말합니다.
-- 동일 테이블 칼럼을 통해 기존의 존재하는 값을 매칭시켜 가져올떄 사용합니다.

--각 사원별 매니저의 이름을 조사
SELECT
     e1.employee_id, e1.first_name, e1.manager_id,
     e2.first_name, e2.employee_id
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;

--------------------------------------------------------------------------------
--각 매니저가 담당하는 사원의 명수.
SELECT
     m.employe_id AS manager_id
    d.first_name AS manager_name,
     COUNT(e.employee_id) AS 사원수
FROM employees e
LEFT JOIN employees
ON e.manager_id = m.employee_id
GROUP BY e2.employee_id, m.first_name;

--------------------------------------------------------------------------------

-- Natural Join
-- 동일한 이름을 갖는 컬럼들에 대해 자동으로 조인조건을 생성한느 기법이다.
-- 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER JOIN을 수행
-- JOIN되는 동일 이름의 칼럼은 타입이 같아야 하며,
-- ALIAS나 테이블명을 자동조인 칼럼은 칼럼앞에 표기하면 안됩니다.
-- 조회하려는 칼럼에 *을 붙이면, 공통 칼럼은 한번만 표기됩니다.
SELECT
    e.employee_id, e.first_name, department_id,
    d.department_name
FROM employees e
Natural JOIN departments d;

--------------------------------------------------------------------------------
-- USING JOIN 
-- NATURAL JOIN과는 다르게 USING을 사용하면 원하는 컬럼에 대해서만 선택적 조인조건을
-- 부여할 수 있다.
-- USING절에서도 종니 칼럼에 대해 ALIAS나 테이블명을 표기하시면 안됩니다.
SELECT
    e.employee_id, e.first_name, department_id,
    d.department_name
FROM employees e
JOIN departments d USING(department_id);























