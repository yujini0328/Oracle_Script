/* Select 2 */

/* �Լ� ����ϱ� */

/*
    ����Ŭ���� ������ �ִ� �پ��� �⺻ ������ �Լ�
    1. ���� ó�� �Լ�
    2. ���� ó�� �Լ�
    3. ��¥ ó�� �Լ�
    4. ��ȯ �Լ�
    5. �Ϲ� �Լ�
*/

/*
    1. ���� �Լ� :
        UPPER : �빮�ڷ� ��ȯ ���ִ� �Լ�
        LOWER : �ҹ��ڷ� ��ȯ ���ִ� �Լ�
        INITCAP : ù�ڸ� �빮�ڷ� ��ȯ���ִ� �Լ�
*/

/*
    dual : ������ ���̺�, ���� �Լ��� ó�� �ϱ� ���� �������� ���� ���̺�, 
*/

select UPPER ('Oracle mania') as �빮��
from dual;

select LOWER ('Oracle mania') as �ҹ���
from dual;

select INITCAP ('Oracle mania') as �ܾ���ù�ڸ��빮��
from dual;

select ename as "�̸�(����)", LOWER(ename) as �ҹ���, INITCAP(ename) as ù�ڸ��빮��
from employee;

select *
from employee;

select *
from employee
where ename= UPPER('ward');

/*
    ������ ���̸� ó���ϴ� �Լ�
    LENGTH : ���ڼ��� ��ȯ (�ѱ��� 1byte)
    LENGTHB : ���ڼ��� ��ȯ (�ѱ��� 3byte)�� ó�� <== UTF-8
*/
-- ���ڼ��� ����
select LENGTH ('Oracle mania') as ���ڼ�
from dual;

-- �ѱ� 1�ڴ� 3byte ==> 1�ڷ� ���
select LENGTH('����Ŭ �ŴϾ�') as ���ڼ�
from dual;

select LENGTHB('Oracle maina') as ���ڼ�
from dual;

--LENGTHB : �ѱ� 1�ڸ� 3byte�� ó��
select LENGTHB('����Ŭ �ŴϾ�') as ���ڼ�
from dual;

/*
    char(6) : ���� : 6��, �ѱ� : 2��      <== ������ �ڸ����� ������ ���     : �ֹι�ȣ(13), ������ ��й�ȣ 
    varchar2(6) : ���� : 6��, �ѱ� : 2��  <== ������ �ڸ����� �� �� ���� ���  : �ּ�, ����
    
    nchar(6) : �����ڵ� (3byte) 6�ڸ� �Է� : �ѱ�, �Ϻ���, �߱���, �ƽ�Ű�ڵ� ���� 18��
    nvarchar2(6) : �����ڵ� (3byte) 6�ڸ� �Է� : �ѱ�, �Ϻ���, �߱���, �ƽ�Ű�ڵ� ���� 18��
    
*/

-- Test01 ���̺� ����
create table test01 (
    name1 char(6)not null,
    name2 varchar(6) null,
    name3 nchar(6) null,
    name4 nvarchar2(6) null
);

drop table test01;

desc test01;

-- test01 ���̺� ���ֱ�
-- name1 : char(6), name2 varchar(6) : ���� 6��, �ѱ� 2��
-- name3 : nchar(6), name4 nvarchar2(6) : ���� 18��, �ѱ� 6��
select LENGTH('abcdefghijklmn') from dual;

insert into test01( name1, name2, name3, name4)
values('abcdef', 'hijklm', 'abcde6', '����Ŭ�ŴϾ�');

insert into test01 (name1, name2)
values('����', '����');

select * from test01;

-- ���� ���̺��� ���ڼ��� �о����
select * from employee;

select ename, length(ename) as �̸��Ǳ��ڼ�
from employee;

/*
    CONCAT : ���ڿ��� ���� �����ִ� �Լ�
    SUBSTR : ���ڸ� �߶󳻴� �Լ�, �ѱ� 1�ڸ� 1byte�� ó����.
    SUBSTRB : ���ڸ� �߶󳻴� �Լ�, �ѱ� 1�ڸ� 3byte�� ó����.
    INSTR : Ư�� ������ ��ġ���� ��ȯ(�ѱ� 1byte)
    INSTRB : Ư�� ������ ��ġ���� ��ȯ(�ѱ� 3byte)
    LPAD : ���� �ڸ����� �Է¹ް� �������� Ư����ȣ�� ä��(����)
    RPAD : ���� �ڸ����� �Է¹ް� �������� Ư����ȣ�� ä��(������)
    TRIM : ������ �����ϴ� �Լ� (��, ��)
    RTRIM : �������� ������ ����
    LTRIM : ������ ������ ����
*/

select 'Oracle', 'mania',
    concat('Oracle', 'mania')
from dual;

select ename, job, concat(ename, job) as �÷�����
from employee;

-- substr : ���ڿ��� �߶���� �Լ� : substr(�÷�, 4, 3) --- �÷��� 4��° �ڸ����� 3�ڸ� �߶�ͼ� ���
select substr('Oracle mania', 4, 3)
from dual;

select substr('����Ŭ �ŴϾ�', 5, 3)
from dual;

-- ���� ���̺��� ���
select * from employee;

select hiredate, substr(hiredate, 1, 2) as ���������, substr(hiredate, 4, 2) as �������
       , substr(hiredate, 7, 2) as �ϸ����
from employee;

-- INSTR : Ư�� ������ ��ġ�� ���
select instr('Oracle mania', 'a')
from dual;

-- 4��° �ڸ� ���� 
select instr('Oracle mania', 'a', 4)
from dual;

-- ��� �̸� �÷��� 'K' ���ڰ� �� �ڸ����� �˻� : �˻��� ���� �ʴ� ��� : 0,
select ename, instr(ename, 'K')
from employee;

-- LPAD : LPAD(�÷�, �ڸ����� Ʋ��, '*')
select salary, LPAD (salary, 10, '+'), RPAD(salary, 10, '*')
from employee;

-- �ֹι�ȣ(13�ڸ�) : 230627-1234567  : ��ü : 14�ڸ�, 230627-1*****
    -- substr�� �ؼ� �߶󳻰�, RPAD�� ����ؼ� �������� *ǥ�� ó�� ���
    -- dual ���̺��� �����ؼ� ���
    
select '230627-1234567' as �ֹι�ȣ,
RPAD (substr('230627-1234567', 1,8), length('230627-1234567'), '*') as �ֹι�ȣ2
from dual;

-- �̸�, �Ի����� ��½� �⵵��**�� ���
select ename as �̸�,
RPAD(substr(hiredate, 1, 6), length(hiredate), '*')
from employee;

-- trim�� ����ؼ� ���� ���� : DataBase�� �����ϱ��� client���� ���ڿ��� �յ� ���� ������ DB�� ����
select 'Oracle mania' as ����,
RTRIM ('      Oracle mania          ') as �����ʰ�������,
LTRIM ('      Oracle mania          ') as ���ʰ�������,
TRIM ('       Oracle mania          ') as �յڰ�������
from dual;

/* 2. �����Լ�
    ROUND : Ư�� �ڸ������� �ݿø� ó�� �ϴ� �Լ�      <== ����� �Ҽ����ڸ��� �ݿø��ؼ� ó��
            5�̻��� �ݿø�, 5���ϴ� ����.
    ROUND (���) : �Ҽ��� ���ڸ����� �ݿø�.
    ROUND (���, �Ҽ����ڸ���) :
        - ����϶� : �Ҽ��� �������� ���������� �̵��ؼ� �ݿø�, �� �ڸ��� �ڿ��� �ݿø� <== ����
        - �����϶� : �Ҽ��� �������� �������� �̵��ؼ� �ݿø�, �� �ڸ����� �ݿø���
    TRUNC : Ư�� �ڸ������� �߶� ����
    MOD : ������ ���� ��ȯ
*/

select 98.7654 as ����,
    round(98.7654),      --99
    round(98.7654),
    roundround(98.7654)
from dual;

-- �� �ٷμҵ漼�� ��� : ���� * 0.033
select salary, salary * 0.033 as �ٷμҵ漼
from employee;

--TRUNC : Ư�� �ڸ����� ����.
select trunc(98.7654),   -- 98 �Ҽ��� �ڴ� ��� ����
        trunc(98.7654, 2), -- 98.76 �Ҽ��� 2�ڸ� �� �ڴ� ��� ����
        trunc(98.7654, -1), -- 90 �Ҽ��� �������� 1�ڸ� �̵��� ����
        trunc(98.7654, 1)   -- 98.7
from dual;

-- MOD (���, �����¼�) : ����� ������ ���� ����� �������� ���

-- 31�� ����� �� ���, ������ ���
select round(31/2) as �����, MOD (31, 2) as �����������
from dual;

/* ��¥ �Լ�
    SYSDATE : ���� �ý����� ��¥�� ����ϴ� �Լ�,
    MONTHS_BETWEEN : �� ��¥ ������ ���� ���� ���
    ADD_MONTHS : Ư�� ��¥�� �������� ���Ҷ� ���
    NEXT_DAY : Ư�� ��¥���� �ʷ��ϴ� ������ ���ڷ� �޾Ƽ� ������ �����ϴ� ��¥�� ���
    LAST_DAY : ���� ������ ��¥�� ��ȯ
    ROUND : ��¥�� �ݿø��ϴ� �Լ�, 15�� �̻� : �ݿø�, 15�̸� : ����
    TRUNC : ��¥�� �߶󳻴� �Լ�
*/
-- ���� �ý����� ��¥�� ��� : ��/��/��
select sysdate
from dual;

select sysdate - 100
from dual;

select sysdate - 1 as ����, sysdate as ����, sysdate + 1 as ����
from dual;

select * from employee;

-- �Ի��Ϸκ��� ���� ��¥���� ���� �ٹ��ߴ��� ���
select ename �̸�, hiredate �Ի���, sysdate - hiredate �ѱٹ��ϼ�
from employee;

-- �Ի��Ϸκ��� 1000�� ���� ������ ��¥�� ���.
select ename �̸�, hiredate �Ի���, hiredate + 1000 �Ի�õ�ϳ�¥
from employee;

-- Ư����¥���� ���� �������� ���
select hiredate as ����, trunc(hiredate, 'MONTH'), ROUND(hiredate, 'MONTH')
from employee;

-- months_between : �� ��¥ ������ ���� ���� ���
select ename, hiredate, trunc(months_between(sysdate, hiredate)) as �ٹ�������
from employee;

-- date (��¥Ÿ��) 
-- add_months(��¥, ������) : ��¥�� �������� ���ϴ� �Լ�
-- ���� ��¥�� 100������ ���� ��¥
select sysdate as "���ó�¥", add_months (sysdate, 100) as "100����", sysdate + 100 as "100����" 
from dual;

-- �Ի��� 6������ ���� ������ ���
select ename, hiredate, add_months(hiredate, 6) as "�Ի���6��������"
from employee;

-- next_day : Ư����¥���� ������ ��ǲ���� �־ �����ϴ� ������ ��¥�� ���
select next_day(sysdate, '�����')
from dual;

-- last_day(date) : date�� ������ ��¥�� ���
select sysdate as ���ó�¥, last_day(sysdate)
from dual;

-- ������̺��� �Ի����� ������ ��¥�� ���
select hiredate as �Ի���, last_day(hiredate)
from employee;


    
