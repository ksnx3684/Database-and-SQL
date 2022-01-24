SELECT * FROM DEPARTMENTS;

SELECT * -- ��ȸ�ϰ� ���� �÷����
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 60;-- ���ǽ�

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 60 OR DEPARTMENT_ID = 90;

-- Employees �����ȣ, �̸�, ��, ����, ������ 10000 �̻��� ����� ���

SELECT * FROM EMPLOYEES;
DESC EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >= 10000;

-- Employees �����ȣ, �̸�, ��, ����, ������ 10000 �̻��̰�, �μ���ȣ�� 110
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >= 10000 AND DEPARTMENT_ID = 110;

-- ����� ��� ���� LAST NAME�� KING
SELECT * FROM EMPLOYEES WHERE LAST_NAME = 'King'; -- ���ڿ��� ��������ǥ�� ���μ� ó���ؾ� �ϸ� ��ҹ��ڸ� �����Ѵ�.

-- ����� ��� ���� �� �Ի����� 2002/06/07
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '2002/06/07'; -- '-'�� '/' ����� ����ص� �������. �� �� �ʴ� ':'���� ����

-- ����� ��� ���� �� Ŀ�̼��� null�� �ƴ� �����
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL; -- IS NULL�� ����Ͽ� NULL���� �ƴ� �� ã��
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT != 0; -- �Ǵ� COMMISION_PCT�� ������ Ÿ���� NUMBER �̹Ƿ� NULL���� ã�������� 0���� ã�´�.

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 10;

SELECT SALARY * 12 FROM EMPLOYEES;

SELECT nvl(commission_pct, 0) AS PCT FROM EMPLOYEES;

-- ������̺��� �޿��� 8000�̻� 10000������ ����� ������ ���
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 8000 AND 10000;

-- ������̺��� 2002����� 2003�� 12�� 31�� ���̿� �Ի��� ������� ���� ���
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '02/01/01' AND '03/12/31';

-- �μ����̺� �μ���ȣ�� 10���̰ų� 30�� ���� ���
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID IN (10, 30);

SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%nal%';

-- FIRST_NAME : Sh�� �����ϰų�
-- LAST_NAME : K�� �����ϴ� ��� �� ���
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'Sh%' OR LAST_NAME LIKE 'K%';

-- �μ���ȣ�� 20���� ������� ���� �� ����
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 20 ORDER BY SALARY;


-- 1 --
-- �������(Employees) ���̺��� �����ȣ, �̸�, �޿�, ����, �Ի���, ����� �����ȣ�� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, HIRE_DATE, MANAGER_ID FROM EMPLOYEES;

-- 2 --
-- �������(Employees) ���̺��� ����� �̸�, ��, �޿���  ������ $100 ���ʽ��� �߰��Ͽ� ����� ���� Increased Ann_Salary,
-- �޿��� $100 ���ʽ��� �߰��Ͽ� ����� ������ Increased Salary��� ��Ī�� �ٿ� ���
SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY*12+100 AS "Increased Ann_Salary", (SALARY+100)*12 AS "Increased Salary" FROM EMPLOYEES;

-- 3 --
-- ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�.
-- �������(Employees) ���̺��� �޿��� $7000 ~ $10000 ���� �̿��� ����� �̸��� �� �� �޿��� �޿��� ���� ������ ���
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY NOT BETWEEN 7000 AND 10000 ORDER BY SALARY;

-- 4 --
-- ����� ��(last_name) �߿� 'e', 'o' ���ڰ� ���Ե� ����� ���
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '%e%' AND LAST_NAME LIKE '%o%';

-- 5 --
-- �޿�(salary)�� ������(commission_pct)�� ���� ���� ������ �ۼ��Ϸ��� �Ѵ�.
-- ������ �޴�(null�� �ƴ�) ��� ����� �̸��� ��, �޿�, ����, �������� ����Ͻÿ�.
-- �̶� �޿��� ū ������� �����ϵ�, �޿��� ������ �������� ū ������� ����
SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID, COMMISSION_PCT FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL ORDER BY SALARY DESC, COMMISSION_PCT DESC;



