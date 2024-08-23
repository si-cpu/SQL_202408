
-- 형변환 함수 TO_CHAR, TO_NUMBER, TO_DATE

-- TO CHAR()날짜를 문자로 바꿀때 사용함.(값,형식)
-- 날짜를 문자로 형 변환할 때 원하는 형식으로 날짜를 표현할 수 있습니다.
-- 날짜 포맷형식: Y - 연도, MM - 두자리 월, D - 일수, DY - 요일
-- 시간 포맷형식: HH12 - 시(1~12), HH24 (0-23), MI - 분, SS - 초
SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate,'YYYY-MM-DD PM HH:MI:SS') FROM dual;  --2024년 12시간제
SELECT TO_CHAR(sysdate,'YY-MM-DD HH24 HH:MI:SS') FROM dual; --24년 24시간제

--------------------------------------------------------------------------------
SELECT
    TO_CHAR(sysdate,'YY"년"MM"월"DD"일" HH24"시"' )
FROM dual; --24년 24시간제

--------------------------------------------------------------------------------

--숫자를 문자로 TO_CHAR(값, 형식)
--형식에서 사용하는 '9'는 실제 숫자 9가 아니라 자리수를 표현하기 위한 기호입니다.
SELECT TO_CHAR(20000,'99,9999')FROM dual;
SELECT TO_CHAR(20000,'L99,9999')FROM dual;
SELECT TO_CHAR(20000,'99,999.9')FROM dual; -- 반올림이 지원

SELECT
     first_name,
     TO_CHAR(salary, '$999,999') AS salary
FROM employees;

--------------------------------------------------------------------------------

-- 문자를 숫자로 TO_NUMBER(값,형식)
SELECT '2000' + 2000 FROM dual; -- 자동 형 변환 (문자 -> 숫자)
SELECT '$3,300' + 2000 FROM dual; --에러

-- 변환하려는 문자가 깔끔한 숫자형태가 아니라면, 서식문자를 이용해서 알려줘야 합니다.
SELECT 
    TO_NUMBER('$3,300', '$9,999')+2000 
FROM dual;

--------------------------------------------------------------------------------
--문자를 날짜로 TO_DATE(값, 형식)
SELECT TO_DATE('2023-04-13') +1 FROM dual;

-- 주어진 문자열을 모두 변환해야 합니다. 일부만 변환할 수 없습니다.
SELECT TO_DATE('2023-04-13 12:23:50', 'YYYY-MM-DD HH:MI:SS')+11 FROM dual;

SELECT TO_DATE('2023년 4월 13일', 'YYYY"년" MM"월" DD"일"') FROM dual;

--------------------------------------------------------------------------------

-- xxxx년 xx월 xx일 -> 문자열 형식으로 변환해 보세요.
-- 조회 컬럼명은 dateInfo라고 하겠습니다. dual에서 조회하세요.
SELECT 
    TO_CHAR(TO_DATE('20050102','YYYYMMDD'),
    'YYYY"년"MM"월"DD"일"')AS dateinfo
FROM dual;

--------------------------------------------------------------------------------
-- NULL의 형태를 변환하는 함수 NVL(컬럼 혹은 값, 변환할 타켓값)
SELECT
    first_name,
    NVL(commission_pct, 0)AS comm_pct
FROM employees;

--------------------------------------------------------------------------------
-- NULL의 형태를 변환하는 함수 NVL2(타켓, NULL이 아닐경우,NULL인 경우)
SELECT
    first_name,
    salary,
    NVL2(commission_pct, salary  + (salary * commission_pct), salary) AS 급여
FROM employees;

--------------------------------------------------------------------------------
-- NULLIF(expr1,expr2)
-- 두 값이 같으면 NULL리턴, 다르면 ㄷ텍1dl flxjs

SELECT
    NULLIF('김춘식', '김춘식')
FROM dual;
-----------------------------------
SELECT
    NULLIF('김춘식', '라이옹')
FROM dual;
--------------------------------------------------------------------------------

-- COALESCE(expr1, ...)
-- 많은 표현식 중 NULL이 아닌 값이 최초로 발견되면 그값을 리턴
SELECT
    COALESCE(NULL, NULL, 3000, 4000)
FROM dual;
------------------------------------
--comm_pct가 null인 애들은 뒤에 있는 0이 적용, null이 아닌 애들은 자기으 ㅣcomm_pct가 상ㄴ
SELECT
    first_name,
    salary,
    salary + (salary * COALESCE(commission_pct, 0)) AS total
FROM employees;

--------------------------------------------------------------------------------
-- DECODE(컬럼 혹은 표현식 , 항목1,항목2,항목3,항목4,항목5.....default)
SELECT
    first_name,
    job_id,
    salary,
    DECODE(job_id, 
    'IT_PROG',salary*1,1,
   'FI_MGR', salary *1.2,
   "AD_VP", salary*1.3,
   0
    )AS result
FROM employees;

-------------------------------------------------------------------------------
-- CASE문 WHEN THEN END
-- ANSI 표준 구문
SELECT 
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary*1.1
        WHEN 'FI_MGRG' THEN salary*1.2
        WHEN 'AD_VP' THEN salary*1.3
        WHEN 'Fs_AC' THEN salary*1.$
        ELSE 0
        AS result
FROM employees;



















































































