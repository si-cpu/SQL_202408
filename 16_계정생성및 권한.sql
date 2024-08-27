
-- ����� ���� Ȯ��
SELECT *FROM  all_users;

-- ���� ���� ���
CREATE USER user1 IDENTIFIED BY user1;

--���� ���� �ο�
GRANT CREATE SESSION TO user1;

/*
DCL: GRANT(���� �ο�), REVOKE(���� ȸ��)

CREATE USER -> �����ͺ��̽� ���� ���� ����
CREATE SESSION -> �����ͺ��̽� ���� ����
CREATE TABLE -> ���̺� ���� ����
CREATE VIEW -> �� ���� ����
CREATE SEQUENCE -> ������ ���� ����
ALTER ANY TABLE -> ��� ���̺� ������ �� �ִ� ����
INSERT ANY TABLE -> ��� ���̺��� �����͸� �����ϴ� ����.
SELECT ANY TABLE...

SELECT ON [���̺� �̸�] TO [���� �̸�] -> Ư�� ���̺� ��ȸ�� �� �ִ� ����.
INSERT ON....
UPDATE ON....

- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.
RESOURCE, CONNECT, DBA TO [���� �̸�]
*/

GRANT SELECT ON hr.departments TO user1;
GRANT INSERT ON hr.departments TO user1;


GRANT RESOURCE, CONNECT, DBA TO user1;

REVOKE RESOURCE, CONNECT, DBA FROM user1;

--ROLE: Ư�����ѵ��� ����. �ϰ������� ������ �ο��ϰų� ȸ���ϱ� ���� ���.

CREATE ROLE my_team_role;

GRANT SELECT, UPDATE ON hr.employees TO my_team_role;

GRANT my_team_role TO user1;

REVOKE my_team_role FROM user1;













