--lower(소문자), initcap(앞글자만 대문자), upper(대문자)

SELECT
    last_name,
    Lower(last_name),
    INITCAP(last_name),
    UPPER(last_name)
FROM employees;

------------------------------------------------------

-- 오라클에서 빠르게 확인하기 위한 더미 테이블이 있다. 
SELECT
    *
FROM dual;

----------------------------------------------------

SELECT
    'abcDEF',
    LOWER('abcDEF'),
    UPPER('abcDEF'),
    INITCAP('abcDEF')
FROM dual;

/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서,
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블 입니다.
일시적인 산술 연산이나 날짜 연산 등에 주로 사용합니다.
모든 사용자가 접근할 수 있습니다.
*/
------------------------------------------------------

SELECT
    salary
FROM employees
WHERE UPPER(last_name) = 'AUSTIN';
-- 글자가 다 대문자가 아니거나 다 소문자가 아니거나 대문자와 소문자의 위치를 모르는 경우 위와 같이 만들어서 조회하면 모두 조회할수있다.

------------------------------------------------------------------

-- length(길이), instr(문자 찾기, 없으면 0을 반환, 있으면 인덱스 값)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef', 'b')
FROM dual;


----------------------------------------------------------------

SELECT
    first_name,
    LENGTH(first_name),
    INSTR(first_name, 'a')
FROM employees;

----------------------------------------------------------------

-- substr(자를 문자열, 시작인덱스, 길이)
-- substr(자를 문자열, 시작인덱스) -> 문자열 끝까지.
-- JAVA의 subString과 같다고 볼수있다.
-- 인덱스 1부터 시작
-- concat(문자 연결)
SELECT
    'abcdef' AS ex,
    SUBSTR('abcdef', 2),
    CONCAT('abc', '123')
FROM dual;

----------------------------------------------------------------

SELECT
    first_name,
    SUBSTR(first_name,1,3),
    CONCAT(first_name, last_name)
FROM employees;

---------------------------------------------------------------

-- LTRIM(), RTRIM()
-- TRIM() -> 양쪽 공백 제거
-- LTRIM(param1, param2) -> param2의 값을 param1에서 찾아서 제거 (왼쪽부터)
-- RTRIM(param1, param2) -> param2의 값을 param1에서 찾아서 제거 (오른쪽부터)
SELECT
    LTRIM('javascript_java', 'java')
FROM dual; 

SELECT
    RTRIM('javascript_java', 'java')
FROM dual;

SELECT TRIM('       java       ') FROM dual;

-------------------------------------------------------------
--LPAD(),RPAD(): 좌,우측을 지정한 문자열로 채우기
SELECT
    LPAD('abc', 10, '*'),
    RPAD('abc', 10, '#')
FROM dual;

---------------------------------------------------------------------------------
-- REPLACE(str, old, new)
SELECT
    REPLACE('My dream is a president', 'president', 'programmer')
FROM dual;

SELECT
    REPLACE(REPLACE('My dream is a president', 'president', 'programmer'), ' ', '')
FROM dual;

SELECT
    REPLACE(CONCAT('hello', 'world!'), '!', '?')
FROM dual;

---------------------------------------------------------------------------------


