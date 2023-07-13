/* DDL : Alter Table : ������ ������ ���̺��� ����
    - ���� ���̺��� �÷��� �߰�, �÷��̸�����, �÷�����
    - �÷��� �ο��� ���� ������ ����, ����, ����
*/

-- ���� ���̺� ����
-- ���̺� ���� : ���� ���̺� : department, ���� : dept01
    -- ���� �÷���, �ڷ���, ������(���ڵ�) ����
    -- ���� ���̺��� ���� ������ ����Ǿ� ���� ����
    
create table dept01
as
select * from department;

create table emp01
as
select * from employee;

select * from dept01;
desc dept01;
desc department;

-- ���� ������ Ȯ���ϴ� ������ ����
show user;
select * from user_constraints      -- ���� ������ ������ ��� ���̺��� ���������� Ȯ��
where table_name='DEPARTMENT';
-- where table_name='Dept01';

select * from user_constraints      -- ���� ������ ������ ��� ���̺��� ���������� Ȯ��
where table_name='EMPLOYEE';
where table_name='EMP01';

-- DEPT01 ���̺� ���ο� �÷� �߰�, null
select * from dept01;

alter table dept01
add (birth date);

alter table dept01
add (email varchar2(100), addr varchar2(200), jumin char(14));

-- ���̺� �÷��� �߰��Ҷ� null�� �⺻, update ������ ����ؼ� ���� ����.
update dept01
set birth = sysdate, email = 'aaa@aaa.com', addr='����', jumin='880520-1111111';
where dno=10;
commit;

-- �÷��� �ڷ��� ���� : char, varchar ���ڼ��� �ø�.
alter table dept01
modify email varchar(200);

desc dept01;

-- Ư�� �÷� ����     <== �߰��� �۾��ؾ� ��. ���ϰ� ���� �ɸ��� �۾�
alter table dept01
drop column JUMIN;

alter table dept01
drop column addr;

select * from dept01;

-- �÷��� ���� : 
alter table dept01
rename column dno to d_dno;

alter table dept01
rename column birth to birthday;

-- ���̺� �̸� ����
rename dept01 to dept001;

rename dept01 to dept01;

-- ������ �������� ���� �α׿��� ������� ��� ���̺� ���
select * from user_tables
select table_name from user_tables
order by table_name asc;
 
/* alter table�� ����ؼ� �������� ����, ����, ����
    -- Primary Key
    -- Unique
    -- Foreign Key
    -- Check
    -- Not Null     <== ������ �ٸ�
    
    -- Default
*/

-- ������ ������ ���ؼ� ���� ���̺��� ���� ������ �ѹ��� Ȯ��
select * from user_constraints
where table_name in ('DEPT01', 'DEPARTMENT', 'EMP01', 'EMPLOYEE');

-- ���� ���̺� Primary Key ���� ���� �ֱ� 
    -- �÷��� �ߺ��� ���� ����� �Ѵ�.
    -- �÷��� null ��� ������ �ȵ�.
    -- ���̺� Primary Key �÷��� �����ϸ� �ȵ�, ���̺� 1���� ���� �� �ִ�.
select * from dept01;

desc dept01;

-- dept01 ���̺� d_dno �÷��� Primary Key �Ҵ�
alter table dept01
add constraint PK_DEPT01_D_DNO primary key (d_dno);

/* Foreign Key �Ҵ�
    - �θ� ���̺��� Primary Key, Unique �÷��� ������.
    - FK�� ����� �÷���, �θ����̺��� �����÷��� �ڷ����� ����ϰų� ���ƾ� �Ѵ�.
    - FK�� ����� �÷��� ���� �θ����̺��� ���� ���� ����־�� �Ѵ�.
*/
-- EMP01 ���̺���
select * from dept01;   -- �θ� ���̺�(DEPT01) : d_dno
select * from emp01;    -- �ڽ� ���̺� : dno (FK)

-- emp01 �� dno �÷��� FK �Ҵ�.   �θ� ���̺� : d_dno
alter table emp01
add constraint FK_EMP01_DNO foreign key (dno) references DEPT01(D_DNO);

/* Unique ���� ���� �߰�
    - �÷��� �ߺ��� ���� ����� �Ѵ�.
    - null �� 1���� �� �־�� �Ѵ�.
    - not null, null�� ����� ���� �ο��� �� �ִ�.
*/

-- EMP01 ���̺��� ename �÷��� UNIQUE ���� ���� �߰�
select * from emp01;

alter table emp01
add constraint U_EMP01_ENAME unique (ename);

-- EMP01 ���̺��� eno �÷��� Primary Key �������� �߰�
alter table emp01
add constraint PK_EMP01_ENO primary key(eno);

/* check ���� ����
    -- Ư���÷��� ���ǿ� �´� ���� ����ǵ��� ����
    -- salary �÷��� ���� : salary > 0 
    
*/

alter table emp01
add constraint CK_EMP01_SALARY check (salary > 0);

/* NOT NULL ���� ���� �߰��ϱ� 
    -- �÷��� NULL ���� �������� �ʾƾ� �Ѵ�.
*/
-- job �÷��� NOT NULL ���� ���� �߰�
desc emp01;

alter table emp01
modify job constraint NN_EMP01_JOB not null;

/* ���� ���̺��� default 
    -- default�� ���� ������ �ƴѴ�. �������� �̸��� ������ �ʴ´�.
*/

select * from emp01;

-- commission �÷��� ���� ���� ���� ��� �⺻��(default) : 0
alter table emp01
modify commission default 0;

-- default, null�� ���� ������ : default, null
insert into emp01
values(8000, 'ȫ�浿', '�繫��', 7369, sysdate, 2000, default, 40);

-- �÷��� �������� �ʾ����� default, null
insert into emp01(eno, ename, job, manager, hiredate, salary, dno)
values(8001, 'ȫ�浿', '�繫��', 7369, sysdate, 2000, 40);

-- ���� ���̺��� ���� ���� ���� : 
    -- ���� ���� �̸����� ���Ű� ����
    
select * from user_constraints
where table_name='EMP01';

select constraint_name from user_constraints
where table_name='EMP01';

-- �������� ���� : Primary Key : PK_EMP01_ENO
-- �������� ���� : Unique : U_EMP01_ENAME
-- �������� ���� : Check : CK_EMP01_SALARY
-- �������� ���� : Not Null : NN_EMP01_JOB
-- �������� ���� : Foreign Key : FK_EMP01_DNO

alter table EMP01
drop constraint PK_EMP01_ENO;

alter table EMP01
drop constraint U_EMP01_ENAME;

alter table EMP01
drop constraint CK_EMP01_SALARY;

alter table EMP01
drop constraint NN_EMP01_JOB;

alter table EMP01
drop constraint FK_EMP01_DNO;

-- default -- �⺻������ null ����
alter table emp01
modify commission default null;