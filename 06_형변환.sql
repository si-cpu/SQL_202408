
-- ����ȯ �Լ� TO_CHAR, TO_NUMBER, TO_DATE

-- TO CHAR()��¥�� ���ڷ� �ٲܶ� �����.(��,����)
-- ��¥�� ���ڷ� �� ��ȯ�� �� ���ϴ� �������� ��¥�� ǥ���� �� �ֽ��ϴ�.
-- ��¥ ��������: Y - ����, MM - ���ڸ� ��, D - �ϼ�, DY - ����
-- �ð� ��������: HH12 - ��(1~12), HH24 (0-23), MI - ��, SS - ��
SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate,'YYYY-MM-DD PM HH:MI:SS') FROM dual;  --2024�� 12�ð���
SELECT TO_CHAR(sysdate,'YY-MM-DD HH24 HH:MI:SS') FROM dual; --24�� 24�ð���

--------------------------------------------------------------------------------
SELECT
    TO_CHAR(sysdate,'YY"��"MM"��"DD"��" HH24"��"' )
FROM dual; --24�� 24�ð���

--------------------------------------------------------------------------------

--���ڸ� ���ڷ� TO_CHAR(��, ����)
--���Ŀ��� ����ϴ� '9'�� ���� ���� 9�� �ƴ϶� �ڸ����� ǥ���ϱ� ���� ��ȣ�Դϴ�.
SELECT TO_CHAR(20000,'99,9999')FROM dual;
SELECT TO_CHAR(20000,'L99,9999')FROM dual;
SELECT TO_CHAR(20000,'99,999.9')FROM dual; -- �ݿø��� ����

SELECT
     first_name,
     TO_CHAR(salary, '$999,999') AS salary
FROM employees;

--------------------------------------------------------------------------------

-- ���ڸ� ���ڷ� TO_NUMBER(��,����)
SELECT '2000' + 2000 FROM dual; -- �ڵ� �� ��ȯ (���� -> ����)
SELECT '$3,300' + 2000 FROM dual; --����

-- ��ȯ�Ϸ��� ���ڰ� ����� �������°� �ƴ϶��, ���Ĺ��ڸ� �̿��ؼ� �˷���� �մϴ�.
SELECT 
    TO_NUMBER('$3,300', '$9,999')+2000 
FROM dual;

--------------------------------------------------------------------------------
--���ڸ� ��¥�� TO_DATE(��, ����)
SELECT TO_DATE('2023-04-13') +1 FROM dual;

-- �־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�. �Ϻθ� ��ȯ�� �� �����ϴ�.
SELECT TO_DATE('2023-04-13 12:23:50', 'YYYY-MM-DD HH:MI:SS')+11 FROM dual;

SELECT TO_DATE('2023�� 4�� 13��', 'YYYY"��" MM"��" DD"��"') FROM dual;

--------------------------------------------------------------------------------

-- xxxx�� xx�� xx�� -> ���ڿ� �������� ��ȯ�� ������.
-- ��ȸ �÷����� dateInfo��� �ϰڽ��ϴ�. dual���� ��ȸ�ϼ���.
SELECT 
    TO_CHAR(TO_DATE('20050102','YYYYMMDD'),
    'YYYY"��"MM"��"DD"��"')AS dateinfo
FROM dual;

--------------------------------------------------------------------------------
-- NULL�� ���¸� ��ȯ�ϴ� �Լ� NVL(�÷� Ȥ�� ��, ��ȯ�� Ÿ�ϰ�)
SELECT
    first_name,
    NVL(commission_pct, 0)AS comm_pct
FROM employees;

--------------------------------------------------------------------------------
-- NULL�� ���¸� ��ȯ�ϴ� �Լ� NVL2(Ÿ��, NULL�� �ƴҰ��,NULL�� ���)
SELECT
    first_name,
    salary,
    NVL2(commission_pct, salary  + (salary * commission_pct), salary) AS �޿�
FROM employees;

--------------------------------------------------------------------------------
-- NULLIF(expr1,expr2)
-- �� ���� ������ NULL����, �ٸ��� ����1dl flxjs

SELECT
    NULLIF('�����', '�����')
FROM dual;
-----------------------------------
SELECT
    NULLIF('�����', '���̿�')
FROM dual;
--------------------------------------------------------------------------------

-- COALESCE(expr1, ...)
-- ���� ǥ���� �� NULL�� �ƴ� ���� ���ʷ� �߰ߵǸ� �װ��� ����
SELECT
    COALESCE(NULL, NULL, 3000, 4000)
FROM dual;
------------------------------------
--comm_pct�� null�� �ֵ��� �ڿ� �ִ� 0�� ����, null�� �ƴ� �ֵ��� �ڱ��� ��comm_pct�� ��
SELECT
    first_name,
    salary,
    salary + (salary * COALESCE(commission_pct, 0)) AS total
FROM employees;

--------------------------------------------------------------------------------
-- DECODE(�÷� Ȥ�� ǥ���� , �׸�1,�׸�2,�׸�3,�׸�4,�׸�5.....default)
SELECT
    first_name,
    job_id,
    salary,
    DECODE(job_id, 
    'IT_PROG',salary*1,1,
   'FI_MGR', salary *1.2,
   "AD_VP", salary*1.3,
   0
    )AS result
FROM employees;

-------------------------------------------------------------------------------
-- CASE�� WHEN THEN END
-- ANSI ǥ�� ����
SELECT 
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary*1.1
        WHEN 'FI_MGRG' THEN salary*1.2
        WHEN 'AD_VP' THEN salary*1.3
        WHEN 'Fs_AC' THEN salary*1.$
        ELSE 0
        AS result
FROM employees;



















































































