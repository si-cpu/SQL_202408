-- ROW _NUMBER() : �� �׷� ������ �� �࿡ ������ ������ �ο�.
-- �ߺ����� ���� �־ ������ �ߺ����� �ʽ��ϴ�.

-- Partition BY department_id : �μ����� �����͸� �׷�ȭ
-- ORDER BY salary DESC :�� �׷� ������ �޿��� �������� ����
-- �� �Ŀ� ���������� ������ ���� �ο�.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;

================================================================================
-- RANK() : �� �ۺκ� ������ �ο�
-- ���� �����ϸ� ���� ������ �ο�, ������ �ǳʶپ����ϴ�. ex) 1�� �θ� -> �״��� 3��
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;

================================================================================
-- DENSE_RANK() : �� �ۺκ� ������ �ο�
-- ���� �����ϸ� ���� ������ �ο�, ���� ������ ���� --> 1�� 2�� --> 3��°����� 2���� ��ȸ��.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;

================================================================================
-- LEAD() : �׸񺰷� ������ ������ ���� ������.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LEAD(salary, 2) OVER(ORDER BY salary) AS next_salary
FROM employees;

================================================================================
-- LAG() : �׸񺰷� ������ ������ ���� ������.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LAG(salary, 1) OVER(ORDER BY salary) AS next_salary,
    LAG(salary, 1) OVER(ORDER BY salary)- salary AS salary_diff
FROM employees;

================================================================================
-- FIRST_VALUE(�÷�) : �÷��� ù���� ���� ���� ��ȯ�մϴ�.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER(PARTITION BY department_id ORDER BY salary DESC) AS �μ���_�ְ�޿�
FROM employees;

================================================================================
-- LAST_VALUE(�÷�) : �� �μ��� ���� ���� �޿��� �ҷ�����
-- LAST_VALUE�� �⺻������ ���� �࿡�� ������ ���� �� ������ ���� �������Ƿ� 
-- ��ü ������ Ȯ���� �ֱ� ���ؼ� ROWS BETWEEN�� ����մϴ�.
-- ���� ���� ������ ���� �ƴ� ���� ������ �׷����� ������ ������ Ȯ���ϱ� ���� �߰�.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LAST_VALUE(salary) 
    OVER(PARTITION BY department_id 
    ORDER BY salary DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS �μ���_�����޿�
FROM employees;

================================================================================
-- NTILE(N) : �����͸� N���� �׷����� �����µ� ����ϴ� �Լ�.
-- ex) ��ü ���� 10�̰�, NTILE(4) --> 4���� �׷����� �����ش�. 
-- 11 22 33  44 -> ������ ���� ���������� �Ѱ��� -> 111 222 33 44�� ����ȴ�. 
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    NTILE(7) OVER(PARTITION BY department_id ORDER BY salary DESC) AS NTILE 
FROM employees
WHERE department_id =50;

================================================================================





