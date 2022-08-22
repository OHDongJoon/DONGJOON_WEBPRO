--[XI] �ε��� : ��ȸ�� ������ �ϴ� �ε��� 
SELECT * FROM USER_INDEXES; -- ��ųʸ��信�� SCOTT�� ������ �ε��� ����
SELECT * FROM EMP;

DROP TABLE EMP01;     --��
CREATE TABLE EMP01 AS SELECT * FROM EMP; --�� EMP����� ���� EMP01 ����
SELECT * FROM EMP01; -- 14��
INSERT INTO EMP01 SELECT * FROM EMP01; --�� 1�� (28��) 2��(56��
SELECT COUNT(*) FROM EMP01;

SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;
INSERT INTO EMP01 SELECT * FROM EMP01; --�� 11�� (11����)

INSERT INTO EMP01 (EMPNO,ENAME,DEPTNO) VALUES (1111,'HONG', 40);--��
SELECT * FROM EMP01 WHERE ENAME = 'HONG';
INSERT INTO EMP01 SELECT * FROM EMP01; --��3�� 90����)

SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;


-- �ε��� ���� �� ��ȸ

SELECT * FROM EMP01 WHERE ENAME='HONG'; -- �ε��� ���� �� : 0.036�� -->  (90���� ������ 0.017��)


-- �ε��� �����ϰ� (EMP01���̺��� ENAME) �ϰ� ��ȸ
CREATE INDEX IDX_EMP01_ENAME ON EMP01 (ENAME); -- �ε��� ���� : 1.123�� - 0.362��
SELECT * FROM EMP01 WHERE ENAME='HONG'; -- �ε��� ���� �� : 0.001 ~ 0.002�� 
SELECT * FROM USER_INDEXES WHERE INDEX_NAME = 'IDX_EMP01_ENAME';

COMMIT; -- 90���� ��

INSERT INTO EMP01 SELECT * FROM EMP01; -- �ε��� ���� �� INSERT �ӵ� : 21.3 ��
DROP INDEX IDX_EMP01_ENAME;
ROLLBACK; -- 90����
SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;

INSERT INTO EMP01 SELECT * FROM EMP01;















