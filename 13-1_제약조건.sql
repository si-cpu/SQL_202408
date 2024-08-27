-- ���̺� ������ ��������
-- : ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ���� ��Ģ�� �����ϴ� ��.

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű) ���� ���� 2���� �ɼ��� �ִ�.
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)
-- NOT NULL: null�� ������� ����. (�ʼ���)
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.

-- �÷����� �������� (�÷� ���𸶴� �������� ����)
CREATE TABLE dept2(
    -- �������� �ĺ��ڴ� ������ �����մϴ�. (����Ŭ���� �˾Ƽ� �̸� ����)
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
    dept_name VARCHAR2(14)NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE, --�ʼ��̸�, �ߺ����ٰ� �����Ѱ�.
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    dept_bonus NUMBER(10)CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M','F'))    
);
---------------------------------------------------------------------------------
DROP TABLE dept2;
---------------------------------------------------------------------------------
-- ���̺� ���� ���� ���� ( ��� �� ���� �� ���� ������ ���ϴ� ���)
CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1),
 ------------------------------------------------   
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);
--------------------------------------------------------------------------------
DROP TABLE dept2;
--------------------------------------------------------------------------------
-- �ܷ�Ű(foreign Key)�� �θ����̺�(�������̺�)�� ���ٸ� INSERT�� �Ұ���.
INSERT INTO dept2
VALUES (10, 'gg' , 6542, 90000, 'M'); -- ���� 6542 ������ ����,
------------------------------------------------
INSERT INTO dept2
VALUES (20, 'hh' , 1900, 90000, 'F');
------------------------------------------------
SELECT * FROM dept2;

--------------------------------------------------------------------------------
UPDATE dept2
SET loca = 4000
WHERE dept_no=10; -- ���� (�ܷ�Ű �������� ����)
------------------------------------------------
UPDATE dept2
SET dept_no = 20
WHERE dept_no = 10; -- ���� (PK �������� ����)
------------------------------------------------
UPDATE dept2
SET dept_bonus = 900
WHERE dept_no = 10; -- ���� (�ܷ�Ű �������� ����)
--------------------------------------------------------------------------------
-- ���̺� ���� ���� �������� �߰� �� ����, ���� 
-- ���������� �߰�, ������ �����մϴ�. ������ �Ұ��մϴ�.
-- �����Ϸ��� �����ϰ� ���ο� ������ �߰��ϸ� �˴ϴ�.

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
    );
-- pk �߰� 
ALTER TABLE dept2
ADD CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
-- UNIQUE �߰� 
ALTER TABLE dept2
ADD CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
-- FK �߰� 
ALTER TABLE dept2
ADD CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
-- CHECK �߰� 
ALTER TABLE dept2
ADD CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
ADD CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))

--NOT NULL�� �� ���� ���·� �����մϴ�. Ư�����̽���.
ALTER TABLE dept2
MODIFY dept_bonus NUMBER(10) NOT NULL;















