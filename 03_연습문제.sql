--1. ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
SELECT
    employee_id,
    CONCAT(first_name, last_name),
    hire_date,
    salary
FROM employees;

--2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
SELECT
    CONCAT(first_name, last_name) As name
FROM employees;

--3. 50�� �μ� ����� ��� ������ ����ϼ���.
SELECT
    *
FROM employees
WHERE department_id = 50;

--4. 50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT
    CONCAT(first_name, last_name)AS name,
    department_id,
    job_id
FROM employees
WHERE department_id = 50;

--5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT
    CONCAT(first_name, last_name)AS name,
    salary,
    salary +300
FROM employees;

--6. �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
SELECT
    CONCAT(first_name, last_name)AS name,
    salary
FROM employees
WHERE salary >= 10000;

--7. ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
SELECT
    CONCAT(first_name, last_name)AS name,
    job_id,
    salary + salary*commission_pct
FROM employees
WHERE commission_pct >0;
--8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)

SELECT
    CONCAT(first_name, last_name)AS name,
    hire_date,
    salary
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';
--9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
SELECT
    CONCAT(first_name, last_name)AS name,
    hire_date,
    salary
FROM employees
WHERE hire_date LIKE'_3%';
--10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��� ������ ����ϼ���.
SELECT
    CONCAT(first_name, last_name)AS name,
    salary
FROM employees;

--11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
SELECT
    CONCAT(first_name, last_name)AS name,
    salary
FROM employees
WHERE department_id = 60
ORDER BY salary DESC;

--12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
SELECT
    *
FROM employees
WHERE job_id IN ('IT_PROG', 'SA_MAN');

--13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
SELECT
    CONCAT(first_name, last_name,"����� �޿��� ",salary,"�޷��Դϴ�.")
FROM employees
WHERE first_name = "King";

--14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
SELECT
    CONCAT(first_name, last_name)AS name,
    job_id
FROM employees
WHERE job_id IN '_MAN';

--15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.