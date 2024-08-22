SELECT
    *
FROM employees;
-----------------------------------------
-- �� �� (������ ���� ��/�ҹ��ڸ� �����մϴ�.)
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
---������ ������ ( BETWEEN, IN, LIKE)
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
--IN �������� ��� (Ư�� ����� ���ҋ� ���)
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
-- LIKE ������ (���� ���ڿ� ���� ����)
-- %�� ��� ���ڵ�, _�� �������� �ڸ�(��ġ)�� ǥ���� ��

SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE'03%'; --03���� �����Ѵٸ� ���Ͷ� ��

---------------------------------------------------

SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE'%05%';

-------------------------------------------------------

SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE'___05%'; --5���� ��ȸ�ϰ� �ʹٸ� ����� 3���� �̿��Ѵ�. 


-------------------------------------------------------
-- IS NULL(NULL���� ã��)
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
-- bad and�� or���� �켱������ �����Ƿ� ���� ����ȴ�.
SELECT
    *
FROM employees
WHERE job_id ='IT_PROG'
OR job_id = 'FI_MGR'
AND salary>=6000;

--------------------------------------------------------
-- �������� ����(SELECT ������ ���� �������� ��ġ�Ǹ� ���� ���߿� ����˴ϴ�.)
-- ASC : ������(ascending)
-- DESC : ������(descending)

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
-- FROM -> WHERE -> GROUPBY ->SELECT -> ODERBY ������ ����Ǳ� ������
-- ������ FROM���� ����ȴٴ� ���� �������� 
SELECT
    first_name,
    salary*12 AS pay
FROM employees
ORDER BY pay DESC


    
