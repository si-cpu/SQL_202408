
--lower(�ҹ���), initcap(�ձ��ڸ� �빮��), upper(�빮��)

SELECT
    last_name,
    Lower(last_name),
    INITCAP(last_name),
    UPPER(last_name)
FROM employees;

------------------------------------------------------

-- ����Ŭ���� ������ Ȯ���ϱ� ���� ���� ���̺��� �ִ�. 
SELECT
    *
FROM dual;

----------------------------------------------------

SELECT
    'abcDEF',
    LOWER('abcDEF'),
    UPPER('abcDEF'),
    INITCAP('abcDEF')
FROM dual;

/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
*/


