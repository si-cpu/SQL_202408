
SELECT * FROM info;
SELECT * FROM auth;


-- �̳�(����)����
SELECT
    * 
FROM INFO i
INNER JOIN auth a
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------------

SELECT
    i.title, i.content, a.name, a.auth_id
FROM INFO i
JOIN auth a -- JOIN�̶�� ���� �⺻ INNER JOIN
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------------

SELECT
    i.title, i.content, a.name, a.auth_id
FROM INFO i
JOIN auth a 
ON i.auth_id = a.auth_id
WHERE a.name = '�̰��';

--------------------------------------------------------------------------------
-- �ƿ���(�ܺ�)����
SELECT
    * 
FROM INFO i LEFT JOIN auth a  -- info�� �����̹Ƿ� info �� ����.
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------------
--�������̺� �������̺� �����͸� ��� �о� ǥ���ϴ� �ܺ� ����(Ǯ �ƿ��� ����)
-- ����Ŭ����
SELECT
    * 
FROM info i FULL JOIN auth a
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------------
--CROS JOIN�� JOIN������ �������� �ʱ� ������ 
-- �ܼ��� ��� Į���� ���� JOIN�� �����մϴ�. (������ : �� ���̺��� ���� �����ָ� ��)
--�����δ� ���� ������� ����. ���������� �����Ұ�. for �ڰ���
--����Ŭ ����
SELECT * FROM
info CROSS JOIN auth;

--ANSI ����
SELECT * FROM info, auth; -- ����Ŭ�� cross join

--------------------------------------------------------------------------------
--�������� ���̺��� ���� --> Ű ���� ã�� ������ �����ؼ� ���� �˴ϴ�.
SELECT
    *
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations loc
ON d.location_id = loc.location_id;

--------------------------------------------------------------------------------
/*
- ���̺� ��Ī a, i�� �̿��Ͽ� LEFT OUTER JOIN ���.
- info, auth ���̺� ���
- job �÷��� scientist�� ����� id, title, content, job�� ���.
*/

SELECT
    a.auth_id, i.title, i.content,a.job
FROM auth a
LEFT JOIN info i
ON i.auth_id = a.auth_id
WHERE a.JOb = 'scientist';

--------------------------------------------------------------------------------
-- SELF JOIN�̶� ���� ���̺� ������ ������ ���մϴ�.
-- ���� ���̺� Į���� ���� ������ �����ϴ� ���� ��Ī���� �����Ë� ����մϴ�.

--�� ����� �Ŵ����� �̸��� ����
SELECT
     e1.employee_id, e1.first_name, e1.manager_id,
     e2.first_name, e2.employee_id
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;

--------------------------------------------------------------------------------
--�� �Ŵ����� ����ϴ� ����� ���.
SELECT
     m.employe_id AS manager_id
    d.first_name AS manager_name,
     COUNT(e.employee_id) AS �����
FROM employees e
LEFT JOIN employees
ON e.manager_id = m.employee_id
GROUP BY e2.employee_id, m.first_name;

--------------------------------------------------------------------------------

-- Natural Join
-- ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����Ѵ� ����̴�.
-- ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER JOIN�� ����
-- JOIN�Ǵ� ���� �̸��� Į���� Ÿ���� ���ƾ� �ϸ�,
-- ALIAS�� ���̺���� �ڵ����� Į���� Į���տ� ǥ���ϸ� �ȵ˴ϴ�.
-- ��ȸ�Ϸ��� Į���� *�� ���̸�, ���� Į���� �ѹ��� ǥ��˴ϴ�.
SELECT
    e.employee_id, e.first_name, department_id,
    d.department_name
FROM employees e
Natural JOIN departments d;

--------------------------------------------------------------------------------
-- USING JOIN 
-- NATURAL JOIN���� �ٸ��� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ����������
-- �ο��� �� �ִ�.
-- USING�������� ���� Į���� ���� ALIAS�� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.
SELECT
    e.employee_id, e.first_name, department_id,
    d.department_name
FROM employees e
JOIN departments d USING(department_id);























