--- ����Ŭ �ּ��Դϴ�.
/*
���� �� �ּ��Դϴ�.

ȣȣȣ~~~

*/

--SELECT[�÷���(���� �� ����)] FROM [���̺� �̸�]
SELECT -- select�� ��ȸ�϶���ǹ��̴�.
    *
FROM 
    employees;
------------------------------    
SELECT
    employee_id,first_name,last_name
FROM
    employees;
------------------------------    
SELECT
    email,phone_number,hire_date
FROM
    employees;
------------------------------
--�÷��� ��ȸ�ϴ� ��ġ���� ��������� �����մϴ�.
SELECT
    employee_id, 
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS �������� �޿� 
from
    employees;
------------------------------
-- NULL���� Ȯ�� (���� 0�� ������� �ٸ� �����Դϴ�.)
SELECT
    department_id, commission_pct
FROM employees;

---------------------------------
--alias(Į����� ���̺���� �̸��� �����ؼ� ��ȸ�մϴ�.)
SELECT 2
    first_name AS �̸�,
    last_name AS ��,
    salary AS �޿�
FROM employees;

-----------------------------------
/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ Ư����ȣ��
ǥ���ϰ� �ʹٸ� ''�� �� �� �������� ���ø� �˴ϴ�.
���ڿ� �����ȣ�� || �Դϴ�. ���ڿ��� ���� ������ ������� �ʽ��ϴ�.
*/
SELECT
    first_name ||''|| last_name||'''s salary is $'||salary As �ϼ��� ����
FROM employees;
-----------------------------------------------
--DISTINCT(�ߺ����� ����)
SELECT DISTINCT
    department_id
FROM employees;
------------------------------
--ROWNUM ROWID
--**ROWNUM(�ο��) : ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ǥ��
--ROWID(�ο� ���̵�) : �����ͺ��̽� ���� ���� �ּҸ� ��ȯ
SELECT
    ROWNUM, ROWID, employee_id
FROM employees;
---------------------------------

