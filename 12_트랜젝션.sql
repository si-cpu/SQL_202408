-- ���� Ŀ�� Ȱ��ȭ ���� Ȯ�� 
SHOW AUTOCOMMIT;
-- ���� Ŀ�� �� 
SET AUTOCOMMIT ON;
-- ���� Ŀ�� ���� 
SET AUTOCOMMIT OFF;


SELECT *FROM emps
ORDER BY employee_id DESC;


DELETE FROM emps WHERE employee_id =100;

INSERT INTO emps
    (employee_id, last_name, email, hire_date,job_id)
VALUES
    (300,'lee','abc1234@naver.com',sysdate,'test');

-- �������� ��� ������ ��������� ���(���)
-- ���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ��
ROLLBACK;

-- �������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ������ ����.
-- Ŀ�� �Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� �����ϴ�.
COMMIT;


INSERT INTO emps
    (employee_id, last_name, email, hire_date,job_id)
VALUES
    (300,'lee','abc1234@naver.com',sysdate,'test');


-- ���̺� ����Ʈ ����
-- �ѹ��� ����Ʈ�� ���� �̸��� �ٿ��� ����.
-- ANSI ǥ�� ������ �ƴϱ� ������ �׷��� ���������� ����.
SAVEPOINT insert_kim;

ROLLBACK TO SAVEPOINT insert_kim;









