
--ROLLUP(arg1, arg2) -> arg1�� arg2�� �׷�ȭ. -> ���׷캰 �հ�SUM(salary) 
-- -> arg1 �׷��� SUM(salary) -> ���������� ��ü SUM(salary)
-- Ư�� �÷����� �ܰ��� �հ踦 ���.
--------------------------------------------
-- �μ��� �޿� �հ�
-- �μ��� �������պ� �հ�
-- ��ü �޿� �հ� 
SELECT
    department_id, job_id, SUM(salary) AS total_salary
FROM employees
GROUP BY ROLLUP(department_id, job_id);
--------------------------------------------------------------------------------

-- CUBE(): ��� ������ ������ ����Ͽ� ����.
-- ������ �޿� �հ� 
-- �μ��� �޿� �հ�
-- �μ��� �������պ� �հ�
-- ��ü �޿� �հ� 
SELECT
    department_id, job_id, SUM(salary) AS total_salary
FROM employees
GROUP BY CUBE(department_id, job_id);

--------------------------------------------------------------------------------

-- GROUPING SETS(arg1,arg2): �־��� �׷� ���տ� ���ؼ��� ����
-- ������ �޿� �հ� 
-- �μ��� �޿� �հ�
SELECT
    department_id, job_id, SUM(salary) AS total_salary
FROM employees
GROUP BY GROUPING SETS(department_id, job_id);

--------------------------------------------------------------------------------
-- GROUPING() : NULL���� ���ϴ� ������ ����� �����̶� �Ҽ��ֽ��ϴ�.
-- GROUPING() : �� �Լ��� ���� �׷� ���踦 ������ ����.
-- ������� Ư�� ���� ���谡 �Ǿ������� ���θ� Ȯ���Ͽ� ���� ���Ƿ� ���� ������ ���.
-- ROLLUP, CUBE, GROUPING SET���� ��� ��밡��
SELECT
    CASE GROUPING(department_id) WHEN 1 THEN 9999 ELSE department_id END AS dept_id,
    CASE GROUPING(job_id) WHEN 1 THEN 'total' ELSE job_id END AS job_id,
    SUM(salary) AS total_salary
FROM employees
WHERE department_id IS NOT NULL
GROUP BY CUBE (department_id, job_id)
ORDER BY department_id DESC;
--------------------------------------------------------------------------------




























































































