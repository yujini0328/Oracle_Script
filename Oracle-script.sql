
-- Oracle의 한줄 주석

/*
    여러줄 주석
*/

-- 1. 계정을 생성 : HR, 1234 <== 계정 명 앞에 을 붙여서 C##을 붙여서 계정 생성(Oracle 12버전)

create user C##HR identified by 1234
    default tablespace USERS        -- 객체를 저장 : USERS
    temporary tablespace TEMP;      -- 트랜잭션 로그 : TEMP

-- 2. 계정에게 권한을 부여, (
        -- 오라클에 접속할 수 있는 권한, 객체를 생성, 수정, 삭제)
        
        
-- 3. 테이블 스페이스에 사용량(쿼터) 적용


/* 테이블 생성 */
create table myTest(
    idx number not null,
    name varchar2(10) not null,
    pass varchar2(50) not null,
    addr varchar2(100) null,
    email varchar2(100) null
    );
    
/* 테이블의 내용을 출력 */
select * from myTest;

/* 테이블에 값을 입력 */
insert into myTest(idx, name, pass, addr, email)
values(1, '홍길동', '1234', '서울', 'aaa@aaa.com');

/* 기존의 테이블의 값을 수정 */