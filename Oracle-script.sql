
-- Oracle�� ���� �ּ�

/*
    ������ �ּ�
*/

-- 1. ������ ���� : HR, 1234 <== ���� �� �տ� �� �ٿ��� C##�� �ٿ��� ���� ����(Oracle 12����)

create user C##HR identified by 1234
    default tablespace USERS        -- ��ü�� ���� : USERS
    temporary tablespace TEMP;      -- Ʈ����� �α� : TEMP

-- 2. �������� ������ �ο�, (
        -- ����Ŭ�� ������ �� �ִ� ����, ��ü�� ����, ����, ����)
        
        
-- 3. ���̺� �����̽��� ��뷮(����) ����


/* ���̺� ���� */
create table myTest(
    idx number not null,
    name varchar2(10) not null,
    pass varchar2(50) not null,
    addr varchar2(100) null,
    email varchar2(100) null
    );
    
/* ���̺��� ������ ��� */
select * from myTest;

/* ���̺� ���� �Է� */
insert into myTest(idx, name, pass, addr, email)
values(1, 'ȫ�浿', '1234', '����', 'aaa@aaa.com');

/* ������ ���̺��� ���� ���� */