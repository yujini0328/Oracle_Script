/* Select문 */

/* 테이블의 모든 컬럼을 출력 */

select * from Employee;     -- 사원 정보가 저장된 테이블

select * from Department;   -- 사원에 대한 부서 정보가 저장

select * from Salgrade;     -- 연봉에 대한 등급이 저장됨

/* EMPLOYEE 테이블의 컬럼(필드) 구조 */
  /*
    ENO : 사원번호
    ENAME : 사원명
    JOB : 직책
    MANAGER : 직급 상사(사수)
    HIREDATE : 입사년월일
    SALARY : 연봉
    COMMISSION : 보너스
    DNO : 부서번호
    
  */
  
/* DEPARTMENT 테이블의 컬럼(필드) 구조 */
  /*
    DNO : 부서번호
    DNAME : 부서명
    LOC : 부서 위치
  */
  
/* SALGRADE 테이블의 컬럼(필드) 구조 */
  /*
    GRADE : 등급
    LOSAL : 최소월급
    HISAL : 최대월급
  */

/* SELECT 쿼리 : 출력하라 */
SELECT 컬럼명
FROM 테이블명[뷰]
WHERE 조건
GROUP BY 그룹핑할 컬럼
HAVING 조건(그룹핑한 결과의 조건)
ORDER BY 컬럼명(정렬할 컬럼명)

/* 테이블의 구조를 확인*/
desc employee;

/* 기본 SELECT */
-- 모든 컬럼 출력하기
select * from employee;

-- 특정 컬럼만 출력하기
select eno, ename, salary
from employee;

-- 컬럼을 여러번 출력 할 수 있다. 컬럼에 연산을 적용 할 수 있다.
select ename, salary, salary, hiredate, salary * 2
from employee;

-- 컬럼에 별침 적용하기, 원본이름 as 별칭이름
select ename as 이름 , salary as 월급, salary + 100 as "연봉+100", salary*2 as "월급의 2배"
from employee;

-- as는 생략될 수 있다.
select ename 이름 , salary 월급, salary + 100 "연봉+100", salary*2 "월급의 2배"
from employee;

-- WHERE 조건사용하기
select * from employee;

-- 이름이 JAMES인 사원의 이름과 직책, 입사월, 부서번호 출력하기
-- SELECT, select, FROM, from, WHERE, where
-- 컬럼에 저장된 값을 가져올때 대소문자를 구분함.

select ename 이름, job 직책, hiredate 입사년월일, dno 부서번호
from employee
where ename = 'JAMES';

-- where 절에서 연산자 사용
select *
from employee
where ename = 'JAMES' or ename = 'SMITH' ;

-- where절에서 in 연산자 사용
select*
from employee
where ename in ('JAMES', 'SMITH');

-- where 절에서 비교 연산자 사용하기 : >, <, >=, <=
-- 연봉이 1500 이상인 사용자만 출력
select*
from employee
where salary >= 1500;

-- 월급이 1500이고 부서과 30인 사원의 정보를 출력
select * 
from employee
where salary >= 1500 and dno = 30;

-- 테이블의 컬럼의 자료형 및 테이블 구조 확인
-- NUMBER : Oracle에서 정수, 실수
    /*
        NUMBER(4) : 정수 : 4자리까자지만 넣을 수 있다.
        NUMBER(7,2) : 실수(전체 7자리, 소숫점이하 2자리)
        
        CHAR(10) : 문자 10byte    <== 자릿수를 알 수 있는 경우
            varchar2보다 성능이 빠르다. 하드공간 낭비가 있다.
            주민번호(13), 비밀번호 4자리 만들어간다.
            
        VARCHAR(10) : 문자 10byte     <== VARCHAR2를 사용, <== 자릿수를 알 수 없는 경우
            char 보다 성능은 떨어지지만 하드 공간을 낭비하지 않는다.
        
    */

-- 테이블 구조 확인
desc employee;

select * from employee;

-- NUMBER : 정수, 실수, 값을 가져올때 '' 를 붙이면 안됨
-- CAHR, VARCHAR2, DATE 값을 가져올때 ''를 붙여야함.

-- 직책이 영업사원(SALESMAN) 이고 연봉이 1500이상 3000 미만인 사원의 이름만 출력해보기
select *
from employee
where salary >=1500 and salary < 3000 and job='SALESMAN';

--null을 검색 : 주의 : =를 사용하면 안됨, is null
    -- null : 0이 아니고 비어있는 상태

-- 보너스가 없는 사원 정보를 출력
select*
from employee
where commission is null;

-- 보너스가 있는 사원 정보를 출력
select*
from employee
where commission is not null;

/* 상사(사수) MANAGER가 없는 사원 정보 출력 */
select * from employee;

select * 
from employee
where manager is null; 

/* 날짜 검색하기 */
-- 입사 날짜가 81/02/20일날 입사한 사원의 이름과 직책과 월급, 입사일을 출력
select ename as 이름, job as 직책, salary 월급, hiredate as 입사일
from employee
where hiredate = '81/02/20';

-- 81년도에 입사한 사용자만 출력
select * from employee;
select * 
from employee
where hiredate >= '81/01/01' and hiredate <= '81/12/31';    -- 날짜 커럼 : date

-- where 에서 Like 연산자 사용하기   <== 컬럼의 특정 단어를 검색할때 사용 : 게시판, 이름, 글내용, 날짜로 검색
    -- 문자열의 단어를 검색할때 사용
    -- 와일드 카드 식별자 사용 : % 어떤 글자가 와도 상관없다.
    
-- 이름이 A로 시작 되는 사원을 검색
select *
from employee
where ename like 'A%';

select *
from employee
where hiredate like '81%';

-- 직책 (job) 컬럼에서 AG라는 단어가 들어간 사원 정보를 출력
select *
from employee
where job like '%AG%';

/* 중복을 제거해서 출력 하기 : DISTINCT, 다른 컬럼이 지정되면 오류 발생, 단일 컬럼에서 사용 */

-- 우리 회사의 존재하는 직책을 출력
select distinct job
from employee;

-- 우리 회사에 존재하는 부서를 출력
select distinct dno
from employee;

/* 정렬해서 출력 : order by 컬럼명 asc[desc] 
        asc : 오름차순 정렬, A -> Z, 1 -> 9   <== 기본값
        desc : 내림차순 정렬, Z -> A, 9 -> 1
*/

-- 사원테이블의 이름 컬럼을 기준으로 내림차순 정렬
select * 
from employee
order by ename desc;

-- 사원번호를 기준으로 오름차순 정렬
select *
from employee
order by eno asc;

-- 최근 입사한 순서대로 출력하라.
select *
from employee
order by hiredate desc;

-- 급여가 많은 사원부터 출력하되 월급이 1000만원 이상 사원명, 직책, 급여, 부서번호를 출력하라.
select ename as 사원명, job as 직책, salary 급여, dno 부서번호
from employee
where salary >= 1000
order by salary desc;


-- NVL 함수 사용하기 : NULL을 0으로 처리하는 함수
    -- + / - / * / NULL과 연산을 수행하면 NULL로 처리됨
    -- NULL은 비어있는 상태임. 0이 아님.
    -- NVI, (commision, 0) : commisstion 컬럼의 null이 존재할 경우 0으로 바꿔어라.
    
-- NVL 함수를 사용하지 않고 전체 연봉을 구하는 컬럼을 출력
select *
from employee;

-- 주의 : 사칙 연산을 할때 null 컬럼이 존재하는지 확인

-- 총 연봉 = 월급(salary) * 12 + Commission(보너스)
-- 전체 연봉을 계산해서 이름, 직책, 월급, 보너스, 총연봉
select ename as 이름, job as 직책, salary as 월급, commission as 보너스, 
    salary * 12 + commission 총연봉
from employee;

-- NVL 함수를 사용해서 commission 컬럼의 null을 0으로 대체후 계산 후 연봉이 많은 순으로 출력
select ename as 이름, job as 직책, salary as 월급, commission as 보너스, 
    salary * 12 + NVL(commission,0) 총연봉
from employee
order by 총연봉 desc;

-- null을 검색
select * from employee
where commission is null ;

-- where 컬럼명 between A and B : A이상 B이하 
-- 월급이 1500이상 3000이하인 사원명, 직책, 월급(급여), 입사일을 출력하되 최근 입사한 사용자로 정렬해서 출력
select *
from employee
where salary between 1500 and 3000
order by hiredate desc;

/* 레코드 갯수 출력 : count     <== 게시판에서 DB의 전체 레코드 수를 가져와서 페이징 처리를 하기위해서 사용 */
-- count 함수는 null을 카운트하지 않는다.
-- 특정 컬럼의 평균을 구할때, null을 카운트 할지 카운트 하지 않을지를 지정해야 함.

select count(*) as "전체레코드수"
from employee;

-- 특정 컬럼을 카운트 할때 null 허용된 컬럼인 경우 null은 카운트 되지 않음.
select count(commission) as "레코드수"
from employee;

-- not null 컬럼을 count 해야 전체레코드를 제대로 출력 할 수 있다.
select count(eno)
from employee;


-- employee 테이블의 컬럼의 null 허용 여부, 자료형 (number(n), char(n), varchar2(n), date)
desc employee;


