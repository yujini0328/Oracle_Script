/* CRUD : Create, Read, Update, Delete */
-- 한줄 주석
/* 여러줄 주석 */

-- 데이터 베이스 생성하기

create database myDB;

-- 데이터 베이스 접속하기

use myDB;

/* 테이블 생성 */
create table myTest(
    idx int not null,
    name varchar(10) not null,
    pass varchar(50) not null,
    addr varchar(100) null,
    email varchar(100) null
    );
    
/* 테이블의 내용을 출력 */
select * from myTest;

/* 테이블에 값을 입력*/
insert into myTest(idx, name, pass, addr, email)
values(1, '홍길동', '1234', '서울', 'aaa@aaa.com');

insert into myTest(idx, name, pass, addr, email)
values(2, '홍길순', '1234', '부산', 'bbb@bbb.com');

-- MS-SQL, MySQL : 자동 커밋 트랜잭션

