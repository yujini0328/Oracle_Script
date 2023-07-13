select * from employee;
-- <문제1>
select eno, ename, hiredate
from employee
where commission is null;

-- <문제2>
select ename,job, hiredate
from employee
where dno = '20' and hiredate >= '81/04/01';

-- <문제3>
select eno, ename, salary, commission, salary*12+NVL(commission,0) as 월급
from employee;

-- <문제4>
select ename
from employee
where commission is not  null;

-- <문제5>
select ename, job
from employee
where manager = '7698';

-- <문제6>
select ename, hiredate, dno, salary
from employee
where salary >= 1500 and dno = '20';

-- <문제7>
select ename, hiredate
from employee
where hiredate between '81/04/01' and '81/12/31';

-- <문제8>
select ename
from employee
where salary <= 1500 and job='SALESMAN' and dno='30';

-- <문제9>
select ename, salary, dno
from employee
where salary <= 1500 and dno not in(20);

-- <문제10>
select dno, ename, job
from employee
where eno = '7788' or eno='7782';