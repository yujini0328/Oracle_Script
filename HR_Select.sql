/* Select�� */

/* ���̺��� ��� �÷��� ��� */

select * from Employee;     -- ��� ������ ����� ���̺�

select * from Department;   -- ����� ���� �μ� ������ ����

select * from Salgrade;     -- ������ ���� ����� �����

/* EMPLOYEE ���̺��� �÷�(�ʵ�) ���� */
  /*
    ENO : �����ȣ
    ENAME : �����
    JOB : ��å
    MANAGER : ���� ���(���)
    HIREDATE : �Ի�����
    SALARY : ����
    COMMISSION : ���ʽ�
    DNO : �μ���ȣ
    
  */
  
/* DEPARTMENT ���̺��� �÷�(�ʵ�) ���� */
  /*
    DNO : �μ���ȣ
    DNAME : �μ���
    LOC : �μ� ��ġ
  */
  
/* SALGRADE ���̺��� �÷�(�ʵ�) ���� */
  /*
    GRADE : ���
    LOSAL : �ּҿ���
    HISAL : �ִ����
  */

/* SELECT ���� : ����϶� */
SELECT �÷���
FROM ���̺��[��]
WHERE ����
GROUP BY �׷����� �÷�
HAVING ����(�׷����� ����� ����)
ORDER BY �÷���(������ �÷���)

/* ���̺��� ������ Ȯ��*/
desc employee;

/* �⺻ SELECT */
-- ��� �÷� ����ϱ�
select * from employee;

-- Ư�� �÷��� ����ϱ�
select eno, ename, salary
from employee;

-- �÷��� ������ ��� �� �� �ִ�. �÷��� ������ ���� �� �� �ִ�.
select ename, salary, salary, hiredate, salary * 2
from employee;

-- �÷��� ��ħ �����ϱ�, �����̸� as ��Ī�̸�
select ename as �̸� , salary as ����, salary + 100 as "����+100", salary*2 as "������ 2��"
from employee;

-- as�� ������ �� �ִ�.
select ename �̸� , salary ����, salary + 100 "����+100", salary*2 "������ 2��"
from employee;

-- WHERE ���ǻ���ϱ�
select * from employee;

-- �̸��� JAMES�� ����� �̸��� ��å, �Ի��, �μ���ȣ ����ϱ�
-- SELECT, select, FROM, from, WHERE, where
-- �÷��� ����� ���� �����ö� ��ҹ��ڸ� ������.

select ename �̸�, job ��å, hiredate �Ի�����, dno �μ���ȣ
from employee
where ename = 'JAMES';

-- where ������ ������ ���
select *
from employee
where ename = 'JAMES' or ename = 'SMITH' ;

-- where������ in ������ ���
select*
from employee
where ename in ('JAMES', 'SMITH');

-- where ������ �� ������ ����ϱ� : >, <, >=, <=
-- ������ 1500 �̻��� ����ڸ� ���
select*
from employee
where salary >= 1500;

-- ������ 1500�̰� �μ��� 30�� ����� ������ ���
select * 
from employee
where salary >= 1500 and dno = 30;

-- ���̺��� �÷��� �ڷ��� �� ���̺� ���� Ȯ��
-- NUMBER : Oracle���� ����, �Ǽ�
    /*
        NUMBER(4) : ���� : 4�ڸ��������� ���� �� �ִ�.
        NUMBER(7,2) : �Ǽ�(��ü 7�ڸ�, �Ҽ������� 2�ڸ�)
        
        CHAR(10) : ���� 10byte    <== �ڸ����� �� �� �ִ� ���
            varchar2���� ������ ������. �ϵ���� ���� �ִ�.
            �ֹι�ȣ(13), ��й�ȣ 4�ڸ� ������.
            
        VARCHAR(10) : ���� 10byte     <== VARCHAR2�� ���, <== �ڸ����� �� �� ���� ���
            char ���� ������ ���������� �ϵ� ������ �������� �ʴ´�.
        
    */

-- ���̺� ���� Ȯ��
desc employee;

select * from employee;

-- NUMBER : ����, �Ǽ�, ���� �����ö� '' �� ���̸� �ȵ�
-- CAHR, VARCHAR2, DATE ���� �����ö� ''�� �ٿ�����.

-- ��å�� �������(SALESMAN) �̰� ������ 1500�̻� 3000 �̸��� ����� �̸��� ����غ���
select *
from employee
where salary >=1500 and salary < 3000 and job='SALESMAN';

--null�� �˻� : ���� : =�� ����ϸ� �ȵ�, is null
    -- null : 0�� �ƴϰ� ����ִ� ����

-- ���ʽ��� ���� ��� ������ ���
select*
from employee
where commission is null;

-- ���ʽ��� �ִ� ��� ������ ���
select*
from employee
where commission is not null;

/* ���(���) MANAGER�� ���� ��� ���� ��� */
select * from employee;

select * 
from employee
where manager is null; 

/* ��¥ �˻��ϱ� */
-- �Ի� ��¥�� 81/02/20�ϳ� �Ի��� ����� �̸��� ��å�� ����, �Ի����� ���
select ename as �̸�, job as ��å, salary ����, hiredate as �Ի���
from employee
where hiredate = '81/02/20';

-- 81�⵵�� �Ի��� ����ڸ� ���
select * from employee;
select * 
from employee
where hiredate >= '81/01/01' and hiredate <= '81/12/31';    -- ��¥ Ŀ�� : date

-- where ���� Like ������ ����ϱ�   <== �÷��� Ư�� �ܾ �˻��Ҷ� ��� : �Խ���, �̸�, �۳���, ��¥�� �˻�
    -- ���ڿ��� �ܾ �˻��Ҷ� ���
    -- ���ϵ� ī�� �ĺ��� ��� : % � ���ڰ� �͵� �������.
    
-- �̸��� A�� ���� �Ǵ� ����� �˻�
select *
from employee
where ename like 'A%';

select *
from employee
where hiredate like '81%';

-- ��å (job) �÷����� AG��� �ܾ �� ��� ������ ���
select *
from employee
where job like '%AG%';

/* �ߺ��� �����ؼ� ��� �ϱ� : DISTINCT, �ٸ� �÷��� �����Ǹ� ���� �߻�, ���� �÷����� ��� */

-- �츮 ȸ���� �����ϴ� ��å�� ���
select distinct job
from employee;

-- �츮 ȸ�翡 �����ϴ� �μ��� ���
select distinct dno
from employee;

/* �����ؼ� ��� : order by �÷��� asc[desc] 
        asc : �������� ����, A -> Z, 1 -> 9   <== �⺻��
        desc : �������� ����, Z -> A, 9 -> 1
*/

-- ������̺��� �̸� �÷��� �������� �������� ����
select * 
from employee
order by ename desc;

-- �����ȣ�� �������� �������� ����
select *
from employee
order by eno asc;

-- �ֱ� �Ի��� ������� ����϶�.
select *
from employee
order by hiredate desc;

-- �޿��� ���� ������� ����ϵ� ������ 1000���� �̻� �����, ��å, �޿�, �μ���ȣ�� ����϶�.
select ename as �����, job as ��å, salary �޿�, dno �μ���ȣ
from employee
where salary >= 1000
order by salary desc;


-- NVL �Լ� ����ϱ� : NULL�� 0���� ó���ϴ� �Լ�
    -- + / - / * / NULL�� ������ �����ϸ� NULL�� ó����
    -- NULL�� ����ִ� ������. 0�� �ƴ�.
    -- NVI, (commision, 0) : commisstion �÷��� null�� ������ ��� 0���� �ٲ���.
    
-- NVL �Լ��� ������� �ʰ� ��ü ������ ���ϴ� �÷��� ���
select *
from employee;

-- ���� : ��Ģ ������ �Ҷ� null �÷��� �����ϴ��� Ȯ��

-- �� ���� = ����(salary) * 12 + Commission(���ʽ�)
-- ��ü ������ ����ؼ� �̸�, ��å, ����, ���ʽ�, �ѿ���
select ename as �̸�, job as ��å, salary as ����, commission as ���ʽ�, 
    salary * 12 + commission �ѿ���
from employee;

-- NVL �Լ��� ����ؼ� commission �÷��� null�� 0���� ��ü�� ��� �� ������ ���� ������ ���
select ename as �̸�, job as ��å, salary as ����, commission as ���ʽ�, 
    salary * 12 + NVL(commission,0) �ѿ���
from employee
order by �ѿ��� desc;

-- null�� �˻�
select * from employee
where commission is null ;

-- where �÷��� between A and B : A�̻� B���� 
-- ������ 1500�̻� 3000������ �����, ��å, ����(�޿�), �Ի����� ����ϵ� �ֱ� �Ի��� ����ڷ� �����ؼ� ���
select *
from employee
where salary between 1500 and 3000
order by hiredate desc;

/* ���ڵ� ���� ��� : count     <== �Խ��ǿ��� DB�� ��ü ���ڵ� ���� �����ͼ� ����¡ ó���� �ϱ����ؼ� ��� */
-- count �Լ��� null�� ī��Ʈ���� �ʴ´�.
-- Ư�� �÷��� ����� ���Ҷ�, null�� ī��Ʈ ���� ī��Ʈ ���� �������� �����ؾ� ��.

select count(*) as "��ü���ڵ��"
from employee;

-- Ư�� �÷��� ī��Ʈ �Ҷ� null ���� �÷��� ��� null�� ī��Ʈ ���� ����.
select count(commission) as "���ڵ��"
from employee;

-- not null �÷��� count �ؾ� ��ü���ڵ带 ����� ��� �� �� �ִ�.
select count(eno)
from employee;


-- employee ���̺��� �÷��� null ��� ����, �ڷ��� (number(n), char(n), varchar2(n), date)
desc employee;


