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

FROM
















