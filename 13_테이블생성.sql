/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����˴ϴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���) --> �̹��� ���� ��ǻ�͸� �����.
- DATE -> BC 4712�� 1�� 1�� ~ AD 9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ���� ����.
*/

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);

-- SQL�� �׺��� like �ڹ��� Ŭ���� 
DESC dpt2;

SELECT *FROM dept2;

--������ ����
INSERT INTO dept2
VALUES(30, '����', '���', sysdate, 2000000.86);

---------------------------------------------------
--�÷� �߰�
ALTER TABLE dept2
ADD dept_count NUMBER(3);
---------------------------------------------------
--Į���� ����
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;
---------------------------------------------------
-- Į���� �Ӽ� ���� --> Į�� �����Ͱ� ���� �����Ѵٸ�, �׿� �´� Ÿ������ 
-- �����ؾ� �մϴ�. ���� �ʴ� Ÿ�����δ� ������ �Ұ����մϴ�.
ALTER TABLE dept2
MODIFY emp2 VARCHAR2(10);
---------------------------------------------------
ALTER TABLE dept2
MODIFY
dept_no VARCHAR2(10);


--DDL(CREATE ALTER TRUNCATE DEOP)�� Ʈ������� ����� �ƴմϴ�,
--DML (IINSERT, UPDATE< DELETE) ���� ddl�� �����ϸ� commit�� �ڵ�����˴ϴ�.
ROLLBACK;
---------------------------------------------------
--Į�� ����
ALTER TABLE dept2
DROP COLUMN dept_bonus;
SELECT *FROM dept3;
---------------------------------------------------
--���̺� �̸� ����
ALTER TABLE dept2
RENAME TO dept3;
---------------------------------------------------
-- ���̺� ���� (������ ���ܵΰ� ���� �����͸� ��� ����)
TRUNCATE TABLE dept3;

--���̺� ����
DROP TABLE dept3;
