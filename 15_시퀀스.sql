-- ONLY ����Ŭ ���� ���� �̸��̾�
-- ������ (���������� ����,�����ϴ� ���� ������ִ� ���)

CREATE SEQUENCE test_seq
    START WITH 1  -- ���۰� (�⺻���� �����ҋ� �ּڰ�, �����Ҷ� �ִ�)
    INCREMENT BY 1 -- ������(����� ����, ������ ����, �⺻�� 1)
    MAXVALUE 10 -- �ִ� (�⺻���� �����ϋ� 1027, �����϶��� -1)
    MINVALUE 1 -- �ּڰ� ( �⺻���� �����ϋ� 1�����϶� -1028)
    NOCACHE -- ĳ�� �޸� ��� ���� (CACHE) 
    NOCYCLE;  -- ��ȯ ���� (NOCYCLE�� �⺻, ��ȯ��ų�Ÿ� CYCLE ) --> primary key�� ����� ���ؼ� �����.

CREATE TABLE test_tbl(
    test_no NUMBER(2) PRIMARY KEY,
    TEST_msg VARCHAR2(100)
    );

--������ ����ϱ�(NEXTVAL, CURRVAL)

INSERT INTO test_tbl
VALUES(test_seq.NEXTVAL, 'test');

SELECT test_seq.CURRVAL FROM dual; -- �������� ���� �� Ȯ��
SELECT test_seq.NEXTVAL FROM dual; -- �������� ���� �� Ȯ��

SELECT *FROM test_tbl;


-- ������ �Ӽ� ����(���������� ����)
-- START WITH�� ������ �Ұ��� �մϴ�.
ALTER SEQUENCE test_seq MAXVALUE 9999;
ALTER SEQUENCE test_seq INCREMENT BY 10;
ALTER SEQUENCE test_seq INCREMENT BY -10;
ALTER SEQUENCE test_seq MINVALUE 0;






































