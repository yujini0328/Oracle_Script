select * from employee;
-- <����1>
select eno, ename, hiredate
from employee
where commission is null;

-- <����2>
select ename,job, hiredate
from employee
where dno = '20' and hiredate >= '81/04/01';

-- <����3>
select eno, ename, salary, commission, salary*12+NVL(commission,0) as ����
from employee;

-- <����4>
select ename
from employee
where commission is not  null;

-- <����5>
select ename, job
from employee
where manager = '7698';

-- <����6>
select ename, hiredate, dno, salary
from employee
where salary >= 1500 and dno = '20';

-- <����7>
select ename, hiredate
from employee
where hiredate between '81/04/01' and '81/12/31';

-- <����8>
select ename
from employee
where salary <= 1500 and job='SALESMAN' and dno='30';

-- <����9>
select ename, salary, dno
from employee
where salary <= 1500 and dno not in(20);

-- <����10>
select dno, ename, job
from employee
where eno = '7788' or eno='7782';