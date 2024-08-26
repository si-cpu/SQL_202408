-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT
-- �׷�ȭ�� ���� �������� ������ �׷��� ���̺� ��ü�� �˴ϴ�.
SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

------------------------------

SELECT COUNT(*) FROM employees; -- �� �� �������� ��
SELECT COUNT(first_name) FROM employees; 
SELECT COUNT(commission_pct) FROM employees; -- NULL�� �ƴ� ���� �� 
SELECT COUNT(manager_id) FROM employees; --NULL�� ī���õ��� �ʽ��ϴ�.

------------------------------------------------------------------------------
--�μ����� �׷�ȭ, �׷��Լ��� ���
-- GROUP BY���� ����� ��, GROUP���� ������ �ʴ� Į���� ��ȸ�� �� �����ϴ�.

--�׷� �Լ��� �ܵ������� ����Ҷ��� ��ü ���̺��� �׷��� ����� ������
-- �Ϲ� Į���� ���ÿ� ����Ҽ��� �����ϴ�. �Ϲ� �÷��� �׷�ȭ �ؾ� �����մϴ�.
SELECT
    department_id,
    AVG(salary)
FROM employees -- -> ����

---------------------------------------

SELECT
    department_id,
    AVG(salary)
FROM employees 
GROUP BY (department_id); -- �׷�ȭ

-------------------------------------
-- GROUP BY�� 2�� �̻� ���.
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees 
GROUP BY (department_id,job_id); 

-----------------------------------
-- ������� FROM -> GROUP BY -> HAVING -> SELECT ������ ������� �˾ƾ� �Ѵ�.
-- GROUP BY�� ���� �׷�ȭ �Ҷ� ������ ������ ��� HAVING ���� ����ؾ��Ѵ�.
--WHERE������ ����� �Ұ����� ������ WHERE�� �Ϲ� �������� GROUP BY���� ���� ����Ǳ� �����̴�.
SELECT
    department_id,
    AVG(salary)
FROM employees 
GROUP BY (department_id)
HAVING SUM(salary) > 100000;

----------------------------------------

SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*)>=5;

-----------------------------------------

--�μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� �޿� ����� 5000�̻� ��ȸ
SELECT
    department_id,
    AVG(salary) AS ��ձ޿�
FROM employees
WHERE department_id>=50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY ��ձ޿� DESC;


--------------------------------------------------------------------------------
/*
���� 1.
1-1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
*/
SELECT
    JOB_ID,
    COUNT(*) AS �����
FROM employees
GROUP BY job_id
ORDER BY job_id DESC;

/*
1-2. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/
SELECT
    JOB_ID,
    AVG(SALARY)AS ��տ���,
    COUNT(*) AS �����
FROM employees
GROUP BY JOB_id
ORDER BY AVG(SALARY) DESC;

/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/
SELECT
    TO_CHAR(hire_date,'yy') AS �Ի翬��,
    COUNT(*)AS �����
FROM employees
GROUP BY TO_CHAR(hire_date,'yy')
ORDER BY �Ի翬��;


/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/
SELECT
    department_id,
    AVG(salary) AS ��ձ޿�
FROM employees
WHERE salary >=5000
GROUP BY department_id
HAVING AVG(salary) >= 7000;


/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/
SELECT
    department_id,
    TRUNC(AVG(salary + salary*commission_pct),2) AS avg_salary,
    SUM (salary + salary*commission_pct)AS total,
    Count(*)as count
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;
