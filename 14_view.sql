/*
view�� �������� �ڷḸ ���� ���� ����ϴ� ���� ���̺��� �����Դϴ�.
��� �⺻ ���̺�� ������ ���� ���̺��̱� ������
�ʿ��� �÷��� ������ �θ� ������ ������ ���ϴ�.
��� �������̺�� ���� �����Ͱ� ���������� ����� ���´� �ƴմϴ�.
�並 ���ؼ� �����Ϳ� �����ϸ� ���� �����ʹ� �����ϰ� ��ȣ�� �� �ֽ��ϴ�.
*/
SELECT *FROM user_sys_privs; ---����Ȯ��

-- �ܼ� ��: �ϳ��� ���̺��� �̿��Ͽ� ������ ��
-- ���� Į������ �Լ� ȣ�⹮, ����� �� ���� ���� ǥ�����̸� �ȵ˴ϴ�.
SELECT
    employee_id,
    first_name||' '||last_name AS name,
    job_id,
    salary
FROM employees 
WHERE department_id = 60;


CREATE VIEW view_emp AS (
SELECT
    employee_id,
    first_name||' '||last_name AS full_name,
    job_id,
    salary
FROM employees 
WHERE department_id = 60
);

SELECT * FROM view_emp;

-- ���� ��
-- ���� ���̺��� �����Ͽ� �ʿ��� �����͸� �����ϰ� ���� Ȯ���� ���� ���.(���뼺 ����)
CREATE VIEW view_emp_dept_job AS (
    SELECT
        e.employee_id,
        e.first_name || ' '|| e.last_name AS full_name,
        d.department_name,
        j.job_title
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
    )
ORDER BY e.employee_id;

-- ���� ���� (CREATE OR REPLACE)
-- ���� �̸����� �ش� ������ ����ϸ� �����Ͱ� ����Ǹ鼭 ���Ӱ� �����˴ϴ�.
-- ������ �������� �ʾҴٸ� ���Ӱ� CREATE �˴ϴ�.
CREATE OR REPLACE VIEW view_emp_dept_job AS (
    SELECT
        e.employee_id,
        e.first_name || ' '|| e.last_name AS full_name,
        d.department_name,
        j.job_title,
        e.salary
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
    )
ORDER BY e.employee_id;

SELECT * FROM view_emp_dept_job;



SELECT
    job_title,
    AVG(salary) AS avg
FROM view_emp_dept_job
GROUP BY job_title
ORDER BY avg DESC; -- sql �� ��������

--�� ����
DROP VIEW view_emp;

-- �ظ��ϸ� ��ȸ �뵵�θ� ����Ұ� --> ���������� �Ѽ��Ҽ��� ����. ��ȸ�������� �����ϰ� �������
/*
VIEW�� INSERT�� �Ͼ�� ��� ���� ���̺��� �ݿ��� �ˈ�.
�׷��� VIEW�� INSERT, UPDATE, DELETE���� ���� ���� ������ �����ϴ�.
���� ���̺��� NOT NULL�� ��� VIEW�� INSERT�� �Ұ��� �մϴ�.
VIEW���� ����ϴ� �÷��� ������ ��쵵 �ֽ��ϴ�.
*/

SELECT * FROM view_emp_dept_job;

INSERT INTO view_emp_dept_job
VALUES(300, 'test', 'test', 'test', 100000); -- �ȵ�. --> FULL_name�� ������ Į���̶�� ��.
--------------------------------------------------------------------------------
--JOIN�� ��(���� ��)�� ��쿡�� �ѹ��� ������ �� �����ϴ�.
INSERT INTO view_emp_dept_job
    (employee_id, department_name, job_title, salary)
VALUES(300, 'test', 'test', 100000);


-- ���� ���̺� Į�� �� NOT NULL Į���� �����ϰ�, �� Į���� view���� �����Ҽ����ٸ�
-- 

INSERT INTO view_emp
    (employee_id, job_id, salary)
VALUES(300, 'test', 100);

DELETE FROM view_emp_dept_job
WHERE employee_id =107;

ROLLBACK;
SELECT *FROM employees;

-- WITH CHECK OPTION -> ���� ���� Į��
-- �並 �����Ҷ� ����� ���� Į���� �並 ���ؼ� ������ �� ���� ���ִ� Ű���� 
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
)
WITH CHECK OPTION CONSTRAINT view_emp_test_ck;

UPDATE view_emp_test
SET department_id =100
WHERE employee_id = 107;
--------------------------------------------------------------------------------
DROP VIEW view_emp_test;

SELECT *FROM view_emp_test;

--------------------------------------------------------------------------------
-- �б� ���� �� -> SELECT�� ���. DML ������ ����.
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
)
WITH READ ONLY;


