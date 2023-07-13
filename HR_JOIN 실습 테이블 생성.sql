/* JOIN �ǽ� */ 
drop table member10 cascade constraints; 
drop table zipcode10 cascade constraints;
drop table product10 cascade constraints;
drop table orders10 cascade constraints;

create table zipcode10 (
    zipcode number(6) not null constraint PK_ZIPCODE_ZIPCODE Primary key, 
    si_do varchar2(200) not null, 
    gu_gun varchar2 (200) not null, 
    bungi varchar2 (200) not null
    ); 
    
create table member10 (
    m_id number(4) not null constraint PK_MEMBER10_M_ID Primary key, 
    pass varchar2(200) not null , 
    name  varchar2(200) not null, 
    email varchar2(200) not null, 
    zipcode number(6) null , 
    constraint FK_MEMBER10_ZIPCODE10 foreign key (zipcode) references zipcode10(zipcode)
    ); 

create table product10 ( 
    pro_id number (6) not null constraint PK_PRODUCT10_PRO_ID primary key, 
    pro_name varchar2(200) not null, 
    pro_price number (7,2) not null , 
    pro_cnt number (4) default 0 not null 
); 

create table orders10 (
    ord_id number (6) not null constraint PK_ORDER10_ORD_ID Primary key, 
    m_id number(4) not null , 
    pro_id number(6) not null , 
    orderdate date, 
        constraint FK_ORDER10_M_ID foreign key (m_id) references member10(m_id), 
        constraint FK_ORDER10_PRO_ID foreign key (pro_id) references product10(pro_id)
); 

/* zipcode10 */ 
insert into zipcode10(zipcode, si_do, gu_gun, bungi)
values(12, '�����', '���ϱ�', '1����');
insert into zipcode10(zipcode, si_do, gu_gun, bungi)
values(13, '������', '���ϱ�', '2����');
insert into zipcode10(zipcode, si_do, gu_gun, bungi)
values(14, '��õ��', '���ϱ�', '3����');
insert into zipcode10(zipcode, si_do, gu_gun, bungi)
values(15, '���ֽ�', '���ϱ�', '4����');
insert into zipcode10(zipcode, si_do, gu_gun, bungi)
values(16, '���ν�', '���ϱ�', '����');

/* member10 */
insert into member10(m_id, pass, name, email, zipcode)
values(1, 1234, 'John', 'john@naver.com', 12-1);
insert into member10(m_id, pass, name, email, zipcode)
values(2, 1234, 'John', 'john@naver.com', 12-1);
insert into member10(m_id, pass, name, email, zipcode)
values(3, 1234, 'John', 'john@naver.com', 12-1);
insert into member10(m_id, pass, name, email, zipcode)
values(4, 1234, 'John', 'john@naver.com', 12-1);
insert into member10(m_id, pass, name, email, zipcode)
values(5, 1234, 'John', 'john@naver.com', 12-1);


-- �� ���� ���̺� ���ڵ� 5���� ������ JOIN �ǽ�  : EQUIE JOIN, ANSI JOIN  
--  ���� ������ ���ؼ� , ȸ���̸�, �����ּ�, �õ�, ��ǰ�̸�, ��ǰ����, ��ǰ����(cnt), ���ų�¥�� ��� 

-- insert �� ����, EQUIE JOIN, ANSI JOIN   <== �Ϸ�ð� 6:20�б��� . p.jangwoo@gmail.com 

select * from member10;
select * from zipcode10;
select * from product10;
select * from orders10;







