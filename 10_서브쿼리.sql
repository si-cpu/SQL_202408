/*
# �������� 
: SQL ���� �ȿ� �Ǵٸ� SQL�� �����ϴ� ���.
 ���� ���� ���Ǹ� ���ÿ� ó���� �� �ֽ��ϴ�.
 WHERE, SELECT, FROM ���� �ۼ��� �����մϴ�.

- ���������� ������� () �ȿ� �����.
 ������������ �������� 1�� ���Ͽ��� �մϴ�. -> ������ ��Ģ
- �������� ������ ���� ����� �ϳ� �ݵ�� ���� �մϴ�.
- �ؼ��� ���� ���������� ���� ���� �ؼ��ϸ� �˴ϴ�.
*/

--�̸��� 'Nancy'�� ������� �޿��� ���� ����� ��ȸ�ϱ�.
SELECT salary FROM employees
WHERE first_name = 'Nancy';
---------------------------------------
SELECT first_name FROM employees
WHERE salary>12008;
---------------------------------------
-- �������� Ȱ���� ���� 
SELECT first_name FROM employees
WHERE salary>(SELECT salary FROM employees
              WHERE first_name = 'Nancy');
--------------------------------------------------------------------------------
-- employee_id�� 103���� ����� job_id�� ������ job_id�� ���� ����� ��ȸ.
SELECT *from employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE employee_id =103);
--------------------------------------------------------------------------------
-- ���������� ���������� �����ϴ� ���� �������� ���� �� �����ڸ� ����� �� ����.
-- ���� �� ������ : �ַ� �� ������(=,<,>,<=,>=,<>)�� ����ϴ� ���� �ϳ��� �ุ ��ȯ�Ǿ�� �Ѵ�.
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE last_name = 'King'); -- ����
--------------------------------------------------
-- ���� �� ������ (IN, ANY, ALL, EXIST)
-- IN : ��ȸ�� ����� ����� �������� ��
-- ex) salary > ANY (200,300,400)
        250 -> 

SELECT * FROM employees
WHERE job_id IN (SELECT job_id FROM employees
                WHERE last_name = 'King');

---------------------------------------------------
-- first_name�� David�� ������� �޿��� ���� �޿��� �޴� ������� ��ȸ.
SELECT * FROM employees
WHERE salary in (SELECT salary FROM employees
                  WHERE first_name = 'David');
                  
---------------------------------------------------                  
-- ANY, SOME : ���� ���������� ���� ���ϵ� ������ ���� ���ؼ�
-- �ϳ��� �����ϸ� ��ȸ ��� ���Ե˴ϴ�. 
-- ex) salary > ANY (200,300,400)
--       250 -> true 
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees
                  WHERE first_name = 'David');

---------------------------------------------------
-- ALL : ���� ���������� ���� ���ϵ� ������ ���� ���ؼ� 
-- ���� �� ��ġ�ؾ� ��ȸ��� ���Ե˴ϴ�.
-- ex) salary > ALL (200,300,400)
--       250 -> false 200���� ũ���� 300, 400���� ũ�� �����Ƿ� false �Դϴ�!
SELECT * FROM employees
WHERE salary > ALL (SELECT salary FROM employees
                  WHERE first_name = 'David');
                  
---------------------------------------------------
-- EXISTS : ���������� �ϳ� �̻��� ���� ��ȯ�ϸ� ������ ����.
-- job_history�� �����ϴ� ������ emplloyees���� �����Ѵٸ� ��ȸ ��� ����.
-- �������� ������ jh�� �ִ� id�� e�� �ִ� id�� ��ġ�� ������ 1�̶�� ���� ��ȸ.
-- EXISTS �����ڰ� 1�� ��ȸ�� �ɶ� �����Ͱ� �����Ѵٴ� ���� �Ǵ��Ͽ�
-- employees���� �ش� ����� ��� Į���� ��ȸ.
SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM job_history jh
              WHERE e.employee_id = jh.employee_id);

--------------------------------------------------------------------------------
-- SELECT���� �������� ���̱�.
-- ��Į�� ����������� Ī��.
-- ��Į�� �������� : ���� ����� ���� ���� ��ȯ�ϴ� ��������. �ַ� SELECT, WHERE������ ����.
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
# ��Į�� �������� vs LEFT JOIN
a. ������ ��Ȳ���� ����ϸ� ������ �������̰� �����մϴ�. 
b. ���� ���� ��ȯ�ϴ� ����Ŀ������ ����.
c. �뷮�����Ͱ� �ƴ� ��쳪, ���������Ǻ��⵵�� ���� ��� ����

1. �뷮 �����͸� ó���ϰų�, ���� �÷��� �ٿ��� �� �� �����մϴ�.
2. ���� ���̺��� �� ���� �����ؾ� �� ���.
3. ���߰� ó�� �� �ߺ� ������ �ִ� ��� ���ɻ� �� �� ����.
*/
--------------------------------------------------------------------------------
--�� �μ��� ����� �̱�(�μ���, �����)
SELECT
    d.department_name,
    COUNT(*) AS �����
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_name, d.department_id
ORDER BY ����� DESC;


SELECT
    d.department_name,
    NVL((SELECT COUNT(*)
    FROM employees e
    WHERE e.department_id = d.department_id
    GROUP BY department_id),0)AS �����
FROM departments d ;
SELECT * FROM departments;

--------------------------------------------------------------------------------
-- FROM �� �������� (�ζ��� ��)
-- Ư�� ���̺� ��ü�� �ƴ� SELECT�� ���� �Ϻ� �����͸� ��ȸ�� ����
-- ���� ���̺�� ����ϰ� ������.
-- ������ ���س��� ��ȸ�ڷḦ ������ �����ؼ� ������ ���� ���.
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
���� ���� SELECT ������ �ʿ��� ���̺� ����(�ζ��� ��)�� ����.
�ٱ��� SELECT ������ ROWNUM�� �ٿ��� �ٽ� ��ȸ
���� �ٱ��� SELECT �������� �̹� �پ��ִ� ROWNUM�� ������ �����ؼ� ��ȸ.

** SQL�� ���� ����
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
