
/* DDL, DML, �������� */

/*
    SQL(Structured Query Language) : ����ť��, ����, ����ȭ�� ���� ���
    select �÷���
    from ���̺��[��]
    where ����
    group by �÷�[�׷���]
    having ����[group by ���������]
    order by ����Į��
    
    SQL ������ ������ �з�
    
    DDL(Data Definition Language) : ��ü(���̺�, �Լ�, ��, Ʈ����, �������ν���, �ε���, �� �����ϴ� ���(����)
                                  : ��Ű��(Ʋ, ��ü)�� �����ϴ� ���
        - create(����), alter(����), drop(����)
        
    DML(Data Manipulation Language) : ���̺��� ���ڵ�(��)�� ���۾�� <== Ʈ������� �߻���Ŵ (commit, rollback)
        -- ����Ŭ������ Ʈ����� ������ �ڵ����� �ڵ���.
        -- Ʈ������� �Ϸ��ؾ��Ѵ�. (commit, rollback) 
            <== Ʈ������� �Ϸ����� ������ LOCK�� �ɷ��� �ٸ� ����ڰ� ������ �ȵ�
        - insert (�Է�), update(����), delete (����)
        
    DCL(Data Control Language) : ������ ���� ���, ������ ������ �ο�, ����, ����
        - grant (������ �ο�), revoke (������ ���)
        
    =============================================================
    
    DQL (Data Query Language) : ����Ÿ ���� ���(���), 
        - Select 
    TCL (Transaction Control Language) : Ʈ����� ���� ���, <== DML 
        -- begin transaction    : Ʈ����� �ڵ����� ���� (insert, update, delete)
        
        -- commit [transaction] : Ʈ������� �Ϸ�, ���� DataBase�� ���������� ����
        -- rollback [transaction] : Ʈ������� ���۽������� �ǵ���.
        
        -- savepoint : Ʈ������� �ӽ����� ���� ����
    
*/

-- ���̺� ���� : create table

create table dept (
    dno number(2) not null,
    dname varchar2(50) not null,
    loc varchar2(13) null
);
drop table dept;

desc dept; -- ���̺� ���� Ȯ��

-- ���̺� �� �ֱ�
--begin transaction
insert into dept(dno, dname, loc)
values(10, '�λ��', '����');

rollback;
commit;

select * from dept;

/*
    Ʈ�����(Transaction) : �۾�(��)�� ó���ϴ� �ּ� ����
        -- DBMS : ��Ʈ��ũ�� ���ؼ� ���� ���� ����ڰ� ���ÿ� �۾�
        -- �۾��� �Ҷ� LOCK�� �ɰ� �Ϸ�Ǹ� LOCK�� Ǯ����
        -- DML ������ �۵�,
        -- Ʈ������� ����(commit, rollback) �ϱ� �������� LOCK�� �ɷ��� �ٸ� ������� ������ ����
        -- commit : RAM�� ������ ������ DB�� ���������� ����
        -- rollback : Ʈ����� ���� �������� �ǵ���.
        -- commit �������� RAM������ ����Ǿ� ����.
        -- log�� ��ϵ�, "Ʈ����Ƿα�"   <== ��������� �ƴ϶� ������������ ���� 
        
        -- Ʈ������� 4���� Ư¡ 
            -- ALL or NOTHING : �Ǹ� ���� �ǰ� �ϰų� �ƴϸ� ������ �ǵ����ų�
            
            - ���ڼ�(Atomicity) : ���� ó���ϴ� �ּ� ����
            - �ϰ���(Consistency) : Ʈ����ǿ��� ó���� ����� �ϰ����� ������.
            - ������(Isolation) : �ϳ��� Ʈ������� �ٸ� Ʈ����ǰ� �ݸ�, LOCK
            - ���Ӽ�(Durability) : commit Ʈ������� DB�� �����
            
            A �� B ���� 100�� �Ա� ��  : �� update ������ �ϳ��� Ʈ��������� �۵��Ǿ����.
            
            1. update���� ����ؼ� A ���� 100���� ���
            
            2. update���� ����ؼ� B ���� 100���� �Ա�
*/
-- insert ��
desc dept;

insert into dept(loc, dname, dno)
values('�λ�', '������',20);

-- �÷��� �����Ǹ� ��� �÷��� ���� �Ҵ�
insert into dept
values(30,'������', null)

select * from dept;

insert into dept(dno, dname)
values(40, '����');

commit;

-- UPDATE : ����      <=== ���� : �ݵ�� where ����(Primary Key, Unique �÷�)�� ����ؾ� �Ѵ�.
update dept
set dname = '������'
where dno = 40;         -- 

rollback;
commit;

insert into dept(dno, dname)
values(40, '�Ǹź�');

-- dno : where �� ���, �ߺ��� ���� ��������ʴ� �÷��� ���(primary key, Unique)
update dept
set dname='HR', loc='����'
where dno=40;

-- ���̺��� Primary Key �÷��� �����ؾ� �Ѵ�.   <== �ߺ��� ���� ���� �� ������ ������ ����

-- delete : ���̺��� Ư�� ���ڵ� ���� : ���� : : �ݵ�� where ����(Primary Key, Unique �÷�)�� ����ؾ� �Ѵ�.
delete dept
where dno=40;

commit;

/* ���� ���� : �÷��� �ο��Ǵ� ����, Primary Key, Unique, Default, Not null, Check,
        Ư���÷��� ���Ἲ�� Ȯ���ϱ� ���ؼ� �ο�
    Primary Key :
        -- �ߺ��� ���� ���� ���ϵ��� ����
        -- NOT NULL 
        -- ���̺� �ѹ��� ���� �� �ִ�. ���� Į���� �ϳ��� Primary Key�� ���� �� �ִ�.
        -- INDEX�� �ڵ����� �����ȴ�.    <== �˻��� ������ ��.
        -- update, delete �� where ������ ���Ǵ� �÷�
        
    Unique : 
        -- �ߺ��� ���� ���� �� ����.
        -- null                <== 1���� ���� �� �ִ�.
        -- not null �÷����� ���� ����
        -- �ϳ��� ���̺��� ������ ���� �� �ִ�.
        -- INDEX�� �ڵ����� ������  <== �˻��� ������ ��.
        -- update, delet tl where ������ ���Ǵ� �÷�
        -- JOIN �� On ������ ���Ǵ� �÷�
        
    Not null
        -- �ݵ�� ���� �ԷµǾ�� �Ѵ�. NULL�� ���� �� ������
        
    Check
        -- �÷��� ������ ���� üũ�ؼ� ����, ���ǿ� �����ϴ� ���� �ֵ���     age>0
        
    Foreign Key
        -- �θ����̺��� Ư�� �÷��� �����ؼ� ���� ���� �� �ֵ��� ����
        -- �θ� ���̺��� �����ϴ� �÷��� Primary Key, Unique Ű �÷��� ����
        
    Default : �÷��� ���� ���� �ʴ� ���, Default�� ������ ���� �ڵ����� ��.
        -- ���������� �ƴϾ �������� �̸��� �ο��� �� ����.
        -- null, not null �տ� ó���ؾ���. <<����>>
    
    ������ ���� : ����Ŭ���� ���̺� ���� ���� ������ ������ ���̺�
        user_constraints                    -- ���� ������ Ȯ���ϴ� ������ ����
        select * from user_constraints
        
*/
create table member1 (
    id varchar2(50) not null Primary key,
    pass varchar2(5) not null,
    addr varchar2(100)null,
    phone varchar2(30) null,
    age number(3),        -- ���� 3�ڸ�
    weight number(5,2)  -- �Ǽ� : ��ü 5�ڸ�, �Ҽ������� 2�ڸ�
);

-- Insert
values('aaa'+'aaa', 

-- delete �� where ���ǿ� primary key �÷��� �������� ó��
delete member1
where id='ccc';

/* Unique */
create table member2 (
    id varchar2(50) not null Primary key,
    pass varchar2(5) not null Unique,
    addr varchar2(100)null,
    phone varchar2(30) null Unique,
    age number(3),        
    weight number(5,2)
);

--Insert
insert into member2
values('aaaa', 'bbbb', '����', '010-1111-1111', 10, 70.55);

select * from member2;
commit;

-- ����Ŭ�� ������ ������ ����ؼ� member2 ���̺��� ���������� Ȯ��
show user;  -- ���� ������ ���� ������ ��� : C##HR

select * from user_constraints
where table_name='MEMBER2';

-- ���̺� ������ ���� �����̸��� �ο��ϸ鼭 ���� ���� �Ҵ�.
-- ���� ���� �̸��� : PK_���̺��̸�_�÷���

create table member3 (
    id varchar2(50) not null constraint PK_MEMBER3_ID Primary key,
    pass varchar2(50) not null constraint U_MEMBER3_PASS Unique,
    addr varchar2(100) null,
    phone varchar2(30) null constraint U_MEMBER3_PHONE Unique,
    age number(3),        
    weight number(5,2)
);

--Insert
insert into member3
values('aa', 'aa', '����', '010-1111-1111', 10, 70.55);

select * from member3;
commit;

/* check : �÷��� ���� üũ */
create table member4 (
    id varchar2(50) not null constraint PK_MEMBER4_ID Primary key,
    pass varchar2(50) not null constraint U_MEMBER4_PASS Unique,
    addr varchar2(100) null,
    phone varchar2(30) null constraint U_MEMBER4_PHONE Unique,
    age number(3) constraint U_MEMBER4_AGE check (age > 0 and age < 150),
    gender char(1) constraint U_MEMBER4_GENDER check(gender in('W', 'M')),
    weight number(5,2)
);

-- ���� ���� ���
select * from user_constraints
where table_name='MEMBER4';

-- Insert
insert into member4
values('a', 'a', '����', '010-1111-1111', 10, 'W', 70.55);

select * from member4;
commit;

/* Default : �÷��� ���� ���� �ʴ� ���, Default�� ������ ���� �ڵ����� ��. */
create table member5 (
    id varchar2(50) not null constraint PK_MEMBER5_ID Primary key,
    pass varchar2(50) not null constraint U_MEMBER5_PASS Unique,
    addr varchar2(100) default '����' null,
    phone varchar2(30) null constraint U_MEMBER5_PHONE Unique,
    age number(3) null constraint U_MEMBER5_AGE check (age > 0 and age < 150),
    gender char(1) null constraint U_MEMBER5_GENDER check(gender in('W', 'M')),
    weight number(5,2) default 10.00 null,
    hiredate date default sysdate
);

drop table member5;

-- Insert : default �� �� �Ҵ� : default Ű�� ����ϴ� ���
insert into member5
values('b', 'b', default, '010-1111-1111', 10, 'M', default, default);

-- Insert : default �� �� �Ҵ� : �÷��� ��� ���� �ʴ� ���
insert into member5(id, pass, phone, age, gender)
values('c', 'c', '010-1111-3333', 70, 'M');

select * from member5;
commit;

/* Foreign Key : �θ����̺��� Ư�� �÷��� �����ؼ� ���� ���� �� �ֵ��� ���� 
    - �θ� ���̺��� Primary Key, Unique Ű �÷��� ����
    - Foreign Key�� �ڽ� ���̺��� Ư�� �÷��� �ִ´�.
*/

-- employee ���̺��� dno �÷��� Foreign Key ===> Department ���̺��� dno �÷��� ����
-- employee ���̺��� dno  �÷��� ���� �Ҵ��Ҷ� department ���̺��� dno �÷��� ���� ������ �Ҵ�.
select * from department;       -- �μ� ������ �����ϴ� ���̺�(�θ� ���̺�) dno
select * from employee;         -- ��� ������ �����ϴ� ���̺�(�ڽ� ���̺� : Foreign Key(dno)) 

desc employee;

-- employee�� dno �÷��� department�� dno�� ������.
insert into employee(eno, ename, job, manager, hiredate, salary, commission, dno)
values(8000, 'PJW', 'MANAGER', 7369, sysdate, 1000, 100, 40);

select * from employee;
rollback;

/* Foreign Key �ǽ� ���̺� ���� */

-- �θ� ���̺� ����(PK, UK)
create table ParentTbl(
    info number constraint PK_ParentTbl_info Primary Key,
    name varchar2(20),
    age number(3) check ( age > 0 and age < 200),
    gender char(1) check (gender in ('W', 'M'))
);

-- �θ����̺��� ����(Dumy) ������ �ֱ�
insert into ParentTbl(info, name, age, gender)
values(10, 'ȫ�浿', 22, 'M');

insert into ParentTbl(info, name, age, gender)
values(20, '�̱浿', 32, 'M');

insert into ParentTbl(info, name, age, gender)
values(30, '��浿', 42, 'M');

insert into ParentTbl(info, name, age, gender)
values(40, '�۱浿', 52, 'M');

select * from ParentTbl;


-- �ڽ� ���̺� ����(FK)
create table ChildTbl(
    id varchar2(40) constraint PK_ChildTbl Primary Key, 
    pw varchar2(40),
    info number,
        constraint FK_ChildTbl_info foreign key (info) references ParentTbl(info)
);

-- �ڽ� ���̺��� ���� ������ �Է�
insert into ChildTbl(id, pw, info)
values('aaa', 'aaa', 10);

insert into ChildTbl(id, pw, info)
values('bbb', 'aaa', 10);

insert into ChildTbl(id, pw, info)
values('ccc', 'aaa', 30);

-- FK �� �����ϴ� �θ� ���̺��� drop ���� �ʴ´�.
    -- 1. �ڽ� ���̺��� ���� ������ �θ� ���̺� ����
    -- 2. �θ� ���̺��� �����ϸ鼭 cascade �ɼ��� ����ϸ� ���� �����ȴ�.
    
-- �θ� ���̺� ����
drop table ParentTbl;

-- 1. �ڽ����̺��� ���� ������ �θ����̺� ����

