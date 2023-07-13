/* ���� ��ȯ �Լ�
    TO_CAHR : ��¥, �������� ���������� ��ȯ
    TO_DATE : �������� ��¥������ ��ȯ
    TO_NUMBER : �������� ���ڷ� ��ȯ
*/

-- TO_CHAR(date, 'YYYYMMDD') : ��¥������ 'YYYYMMDD' �������� �̾ƿͼ� char Ÿ������ ��ȯ
/*
    YYYY : ��¥ ������ �⵵�� �̾Ƴ�
    YY   : �⵵�� ������ 2�ڸ� �̾ƿ�
    MM   : ��
    MON  : 
    DD   : ��
    
    DAY  : ������ �̾ƿ�(������, ȭ����, ...�Ͽ���)
    DY   : ������ �̾ƿ�(��, ȭ, ...��)
    
    HH : �ð�
    MI : ��
    SS : ��
*/
select TO_CHAR(sysdate, 'YYYYMMDD'), TO_CHAR(sysdate, 'YYYY-MM-DD DY HH:MI:SS') 
from dual;

select sysdate, TO_CHAR(sysdate, 'YY/MM/DD_HH:SS_DY')
from dual;

desc employee;

select hiredate, TO_CHAR(hiredate, 'YYYY-MM-DD DAY HH:MM:SS')
from employee;

-- TO_CHAR : ��¥, ���� ==> ���������� ��ȯ
/*
    0 : �ڸ����� ó����, �ڸ����� ���� ������ 0���� ó����
    9 : �ڸ����� ó����, �ڸ����� ���� ������ ���� ó����
    L : �� ������ ��ȭ�� ��ȣ�� ǥ��
    . : �Ҽ������� ó��
    , : õ���� ������
*/

desc employee;

select ename, salary, TO_CHAR(salary, 'L999,999'), to_char(salary, 'L000,000')
from employee;

-- TO DATE : ������ , ���� => ��¥Ÿ������ ��ȯ
    /*
        TO_DATE (��ȯ�� ����[����], YYYYMMDD)
    */
    
select TO_DATE(20230628, 'YYYYMMDD'), TO_DATE(06282023, 'MMDDYYYY')
from dual;

select to_date('2011-10-30', 'YYYY-MM-DD')
from dual;

-- ���Ͽ��� ���ó�¥���� �� �� ��Ҵ��� ��� : 1981-04-15
select TRUNC (sysdate - to_date('1981-04-15', 'YYYY-MM-DD'))
from dual;

select to_date('12/06/22', 'MM/DD/YY') - to_date('1900-10-17', 'YYYY-MM-DD') as �γ�¥����
from dual;

-- �ڽ��� ���Ͽ��� ������� ���� ��Ҵ���. , ��� ��������?
select trunc(sysdate - to_date('1981/01/01', 'YYYY/MM/DD')) as "��ƿ��� ��",
        trunc (months_between(sysdate , to_date('1981/01/01', 'YYYY/MM/DD'))) as "��ƿ� ������"
from dual;

-- employee ���̺��� ������ �Ի��Ͽ��� 2030/01/01 ������ �ٹ� �������� ����.
select * from employee;
select ename, hiredate,
    trunc (months_between (to_date('2023/01/01', 'YYYY/MM/DD') , hiredate)) as "Ư����¥����������"
from employee

-- null ó�� �Լ� : NVL, NVL2, NULLIF

/*
    NVL(�÷�, ��) : �÷��� NULL�� ������ ��� ������ ��ġ
    NVL2(�÷���, null�� �ƴ� ��� ó��, null ��� ó�� ���)
    
*/

select * from employee;

-- NVL �Լ��� ����ؼ� ó�� - ������ ����. ����(salary) * 12 + ���ʽ�(commission)
select ename, salary, commission, 
        salary * 12 + commission as �ѿ���
from employee;

-- NVL2 �Լ��� ����ؼ� ó�� -
select ename, salary, commission, 
            NVL2(commission, salary * 12 + commission , salary * 12 ) as �ѿ���
from employee;

/* �׷� �Լ� : group by, Ư�� �÷��� �׷����ؼ� ó����. */
select �÷���
from ���̺��̸�[��]
where ����
group by �÷���[�׷����� �÷���]
having ����{�׷����� ����� ����}
order by �÷���[�������÷���]

/* ���� �Լ� : SUM, AVG, MAX, MIN, COUNT
    NUMBER Ÿ�Կ����� ��� ����
    
    -- SUM : �÷��� ��� ���� ���ϴ� �Լ�
    -- AVG : �÷��� ��� ���� ����� ���ϴ� �Լ�
    -- MAX : �÷��� ��� ���� �ִ밪�� �������� �Լ�
    -- MIN : �÷��� ��� ���� �ּҰ��� �������� �Լ�
    -- COUNT : ���ڵ��, �׷��ε� ���� ���
    
    ���� : ���� row�� ��µ�, �ٸ� �÷��� ���� ���� ��� ������ �߻�
*/
select commission from employee
order by commission asc;

select sum(commission) as �հ�, 
    avg(commission) as ���, 
    max(commission) as  �ִ밪, 
    min(commission) as �ּҰ�,
    count(commission)
from employee;

-- �μ��� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��ε� ����
select sum (salary) as �μ��հ�, dno, commission
from employee
group by dno 

select ename, salary, dno, count(dno) as �׷��εȰ���
from employee
order by dno asc;

-- �μ����� ������ �հ�, ���, �ִ����, �ּҿ���, �׷��εȼ��� ���
select sum(salary), avg(salary), max(salary), min(salary), dno �μ���ȣ, count(dno) �׷��μ�
from employee
group by dno 
order by dno asc;

select salary from employee where dno = 20;

select ename, job, salary
from employee;


-- ���� ���� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��εȼ�
select sum(salary), round(avg(salary)) as ���, max(salary), min(salary), job, count(job)
from employee
group by job
having round(avg(salary)) > 2000
order by ��� desc;

-- group by ����
    /*
        where �� : <����> : group by ���� ������ ó���ؼ� ���� ����� group by;
        having �� : <����> : group by �� ����� ���� ����ó��, ��Ī�̸��� ����ϸ� �ȵ�.
        order by �� ��Ī�̸� ��밡��
    */

-- ���޺��� ������ �հ�, ���, �ִ밪, �ּҰ��� ����ϵ� 20�μ��� ����, ����� 2000 �̻��� �͸� ����϶�.
-- ����� ������������ �����϶�.

select sum(salary), round(avg(salary)) as ���, max(salary), job, count(*) �׷��μ�
from employee
where dno not in (20)
group by job
having round(avg(salary)) >= 2000
order by round(avg(salary)) desc;

-- ���÷� �̻� �׷����� �� �� �ִ�. �� �÷���ΰ� �����Ҷ� �׷��� �̵�.
select dno, job
from employee
order by dno, job

-- �μ���ȣ�� ��å�÷� ��θ� �׷����ؼ� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��εȼ�
select sum (salary), round(avg(salary)), max (salary), min(salary), count(*) �׷��εȼ�
from employee
group by dno, job
order by �׷��εȼ� desc;

-- �� ��å�� ���ؼ� ������ �հ�, ���, �ִ밪, �ּҰ��� ����ϴµ� �Ի����� 81�⵵�� �Ի��� ����鸸 ����ϵ�
-- ������ ����� 1500 �����̻��ΰ͸� ����ϰ� ������ ����� ������������ �����ؼ� ���.
select sum(salary), round(avg(salary))as ���, max(salary), min(salary), job, count(*)
from employee
where hiredate like '81%'
group by job
having round(avg(salary)) >= 1500 
order by round(avg(salary)) desc;

select count(*)
from employee
where hiredate like '81%'

-- rollup : �׷��� ��� ������ ���ο� ��ü ����� ���, 
-- cube   : �� �׷����� ������ ���ο� ������, ���� ������ ���ο� ��ü ����� �Բ� ���

-- rollup, cube�� ������� �ʴ� �׷��� ���� 
-- group by ������ �÷� 2���� �׷��� �ɶ� �� �÷��� ���ļ� �ߺ��� �׷���
select sum(salary), round(avg(salary)) as ���, max(salary), min(salary), dno, count(*)
from employee
group by dno, job
order by dno asc;

-- rollup�� ���
select sum(salary), round(avg(salary)) as ���, max(salary), min(salary), dno, count(*)
from employee
group by rollup (dno)
order by dno asc;

-- cube�� ���
select sum(salary), round(avg(salary)) as ���, max(salary), min(salary), dno, count(*)
from employee
group by cube (dno)
order by dno asc;

/* SubQuery(���� ����) : Select ������ select ����, ������ �۾��� �ϳ��� �������� ���� 
        where ������ ���� �����.
*/
-- ename �� SCOTT�� ����� ������ ��å�� ������� ����϶�.
/*
    1. ename�� SCOTT�� ����� ��å�� �������� ����
    2. ��å�� �������� �ؼ� ����� �˾ƿ;��ϴ� ����
*/
select * from employee;

select job 
from employee
where ename='SCOTT';

select ename from employee where job='ANALYST';

-- SubQuery�� ����ؼ� ename�� SCOTT�� ����� ������ ��å�� ������� ����϶�.
select ename, salary, job
from employee
where job=(select job from employee where ename='SCOTT');

-- SMITH�� ������ �μ��� ���� ������� ����ϱ�(subquery)
select ename, salary, dno
from employee
where dno=(select dno from employee where ename='SMITH');

-- 'SCOTT'�� ���޺��� ���� ��� ���� ����ϱ�
select ename, salary from employee;

select ename, salary
from employee
where salary > (select salary from employee where ename='SCOTT');

-- �ּ� �޿��� �޴� ����� �̸��� ������, �޿� ����ϱ�
select ename, job, salary
from employee
where salary=(select min(salary) from employee);

-- ���� ���� �ƴ϶� �������� ���� ��µ� ��� IN Ű���� ���

-- SubQuery�� ���
-- �μ����� �ּұ޿��� �޴� ��� ������ �̸�, ��å, ������ ���, group by, min, in Ű���� ����ؼ� ���
select ename, job, salary, dno
from employee
where salary in (select min(salary) from employee group by dno); 

-- �� �μ��� �ּ� �޿��� 30�� �μ��� �ּ� �޿����� ū �μ��� ���
select min(salary), dno
from employee
group by dno
having min(salary) > (
    -- 30�� �μ��� �ּұ޿��� ���
    select min(salary)
    from employee
    where dno=30
);

/*
    ANY ������ : ���������� ��ȯ�ϴ� ������ ���� ����.
        -- < any�� �ִ밪���� ������ ��Ÿ��.
        -- > any�� �ּڰ����� ŭ�� ��Ÿ��.
        -- = anysms IN�� ������ Ű����
    
    ALL ������ : ������������ ��ȯ�Ǵ� ��� ���� ����.
        -- < all�� �ּҰ����� ����
        -- > all�� �ִ밪���� ŭ�� ��Ÿ��
*/

-- ������ SALESMAN�� �ƴϸ鼭 ������ SALESMAN�� ������� �޿��� ���� ����� ��� ���
select * from employee order by job asc;

select ename, job, salary
from employee
where salary < all (select salary from employee
                    where job='SALESMAN')
    and job != 'SALESMAN';      -- != , <>
    
-- min�� ����ؼ� ���
select ename, job, salary
from employee
where salary < all (select min(salary) from employee
                    where job='SALESMAN')
    and job != 'SALESMAN';
    
-- ��� ������ �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м����� �ƴ� ������� ���
select ename, job, salary
from employee
where salary < all ( select min(salary) from employee
                     where job='ANALYST')
        and job != 'ANALYST';
        
-- ����Ǯ��
1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
select ename, substr(hiredate, 1, 5)
from employee;

2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
select ename, hiredate
from employee
where substr(hiredate, 4, 2) = '04';

3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
select *
from employee
where mod(manager,2) != 0;

4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
select *
from employee
where mod(salary,3) = 0 ;

5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
select to_char(hiredate,'YY_MON_DY') 
from employee;

6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
   ������ ������ ��ġ ��Ű�ÿ�.
select trunc(sysdate - to_date('2023/01/01', 'YYYY-MM-DD'))
from dual;

7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
select trunc(sysdate - to_date('1998/03/28', 'YYYY-MM-DD'))
from dual;

8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
select trunc(months_between(sysdate, to_date('1998/03/28', 'YYYY-MM-DD')))
from dual;

9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.
select ename, nvl(manager,0)
from employee;

10.   �����ȣ,
      [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
      �̸�, 
       [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�" 
       
select rpad(substr(eno, 1, 2), length(eno), '*') as "������ȣ",
       rpad(substr(ename, 1, 1), 4, '*') as "�����̸�" 
from employee;

11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
	dual ���̺� ���
select rpad(substr('980328-223456', 1, 8), length('980328-223456'), '*') "�ֹι�ȣ",
       rpad(substr('010-1234-5678', 1, 6), length('010-1234-5678'), '*') "��ȭ��ȣ"
from employee;

=============================================================================
��� ����� �Ҽ��� 2�ڸ����� ����ϵ� �ݿø� �ؼ� ��� �Ͻÿ�.  
1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.
select dno,  sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
where dno != 10
group by dno;

2.  ��å�� SALSMAN, PRESIDENT, CLERK �� ������ �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 
select dno, sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
where job != 'SALESMAN' or job != 'PRESIDENT' or job != 'CLERK'
group by dno;

3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 
select sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
where dno=(select dno from employee where ename='SMITH');

4. �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���. 
select dno, min(salary)
from employee
group by dno
having min(salary) >= 1000;

5.  �μ��� ������ �հ谡 9000 �̻�͸� ���
select dno, sum(salary)
from employee
group by dno
having sum(salary) >= 9000;

6.  �μ��� ������ ����� 2000 �̻� ���
select dno, round(avg(salary),2)
from employee
group by dno
having round(avg(salary)) >= 2000;

7. ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�. 
select dno, round(avg(salary),2)
from employee
where salary > 1500
group by dno
having round(avg(salary),2) >= 2500;

8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���.
select ename, job, dno, salary
from employee
where salary in (select min(salary) from employee group by dno);


9. sub query - ��ü ��� �޿����� ���� �޴� �������  �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���.
select ename, job, dno, salary
from employee
where salary > ( select avg(salary) from employee);

10. sub query - �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�.
select eno, ename, salary
from employee
where salary > ( select avg(salary) from employee)
order by salary asc;

