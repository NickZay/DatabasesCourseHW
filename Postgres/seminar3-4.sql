\1
create schema seminar_3;
\2
create table seminar_3.Salary(
    employee_nm varchar(30) not null,
    department_nm varchar(40) not null,
    salary int not null
);
\3
select * from information_schema.tables;
\4
insert into seminar_3.Salary values('Vladimir Putin','Edinaya Rossiya',15);
insert into seminar_3.Salary values('Alexey Navalny','Fond Borbi s Korrupciei',0);
insert into seminar_3.Salary values('Vladimir Zhirinovsky','LDPR',15);
insert into seminar_3.Salary values('Vladimir Solovyev','TV',15);
insert into seminar_3.Salary values('Ivan Erlikh','MIPT',1000);
\5
alter table seminar_3.Salary add column comment varchar(60);

\6
update seminar_3.Salary set comment = (case when department_nm = 'Edinaya Rossiya' then 'Edro'
                                            when department_nm = 'LDPR' then 'Ogo tut maddison'
                                            when department_nm = 'Fond Borbi s Korrupciei' then 'FBK'
                                            when department_nm = 'TV' then 'Telek'
                                            when department_nm = 'MIPT' then 'Fizteh' end) where department_nm in ('Edinaya Rossiya', 'LDPR', 'Fond Borbi s Korrupciei', 'TV', 'MIPT');

update seminar_3.Salary set comment = 'blabla' where department_nm='Edinaya Rossiya';
\7
delete from seminar_3.Salary where Salary.salary=0;
\8
truncate table seminar_3.Salary;
\9
alter table seminar_3.Salary drop column comment;
\10
INSERT INTO seminar_3.salary VALUES('Ken Sánchez', 'HR', 78);
INSERT INTO seminar_3.salary VALUES('TerriLee Duffy', 'HR', 95);
INSERT INTO seminar_3.salary VALUES('Roberto Tamburello', 'HR', 382);
INSERT INTO seminar_3.salary VALUES('Rob Walters', 'HR', 16);
INSERT INTO seminar_3.salary VALUES('Gail Erickson', 'HR', 1079);
INSERT INTO seminar_3.salary VALUES('Jossef Gibson', 'HR', 102);
INSERT INTO seminar_3.salary VALUES('Dylan Miller', 'HR', 486);
INSERT INTO seminar_3.salary VALUES('Diane Margheim', 'HR', 1953);
INSERT INTO seminar_3.salary VALUES('Gigi Matthew', 'SALE', 49);
INSERT INTO seminar_3.salary VALUES('Michael Raheem', 'SALE', 71);
INSERT INTO seminar_3.salary VALUES('Ovidiu Cracium', 'SALE', 94);
INSERT INTO seminar_3.salary VALUES('Thierry Hers', 'SALE', 61);
INSERT INTO seminar_3.salary VALUES('Janice Galvin', 'SALE', 972);
INSERT INTO seminar_3.salary VALUES('Michael Sullivan', 'SALE', 849);
INSERT INTO seminar_3.salary VALUES('Sharon Salavaria', 'SALE', 715);
INSERT INTO seminar_3.salary VALUES('David Michael', 'SALE', 94);
INSERT INTO seminar_3.salary VALUES('Kevin Brown', 'R&D', 891);
INSERT INTO seminar_3.salary VALUES('John Wood', 'R&D', 1486);
INSERT INTO seminar_3.salary VALUES('Mary Dempsey', 'R&D', 176);
INSERT INTO seminar_3.salary VALUES('Wanida Benshoof', 'R&D', 49);
INSERT INTO seminar_3.salary VALUES('Terry Eminhizer', 'R&D', 381);
INSERT INTO seminar_3.salary VALUES('Sariya Harnpadoungsataya', 'R&D', 946);
INSERT INTO seminar_3.salary VALUES('Mary Gibson', 'R&D', 486);
INSERT INTO seminar_3.salary VALUES('Jill Williams', 'R&D', 19);
INSERT INTO seminar_3.salary VALUES('James Hamilton', 'R&D', 46);
INSERT INTO seminar_3.salary VALUES('Peter Krebs', 'R&D', 445);
INSERT INTO seminar_3.salary VALUES('Jo Brown', 'R&D', 666) ;
INSERT INTO seminar_3.salary VALUES('Guy Gilbert', 'MANAGEMENT', 482);
INSERT INTO seminar_3.salary VALUES('Mark McArthur', 'MANAGEMENT', 12);
INSERT INTO seminar_3.salary VALUES('Britta Simon', 'MANAGEMENT', 194);
INSERT INTO seminar_3.salary VALUES('Margie Shoop', 'MANAGEMENT', 481);
INSERT INTO seminar_3.salary VALUES('Rebecca Laszlo', 'MANAGEMENT', 16);
INSERT INTO seminar_3.salary VALUES('Annik Stahl', 'MANAGEMENT', 134);
INSERT INTO seminar_3.salary VALUES('Suchitra Mohan', 'R&D', 87);
INSERT INTO seminar_3.salary VALUES('Brandon Heidepriem', 'R&D', 111) ;
INSERT INTO seminar_3.salary VALUES('Jose Lugo', 'R&D', 185);
INSERT INTO seminar_3.salary VALUES('Chris Okelberry', 'R&D', 94);
INSERT INTO seminar_3.salary VALUES('Kim Abercrombie', 'R&D', 348);
INSERT INTO seminar_3.salary VALUES('Ed Dudenhoefer', 'R&D', 68);
INSERT INTO seminar_3.salary VALUES('JoLynn Dobney', 'R&D', 346);
INSERT INTO seminar_3.salary VALUES('Bryan Baker', 'R&D', 185);
INSERT INTO seminar_3.salary VALUES('James Kramer', 'SUPPORT', 965);
INSERT INTO seminar_3.salary VALUES('Nancy Anderson', 'SUPPORT', 444);
INSERT INTO seminar_3.salary VALUES('Simon Rapier', 'SUPPORT', 133);
INSERT INTO seminar_3.salary VALUES('Thomas Michaels', 'SUPPORT', 200);
INSERT INTO seminar_3.salary VALUES('Eugene Kogan', 'SUPPORT', 144);
INSERT INTO seminar_3.salary VALUES('Andrew Hill', 'SUPPORT', 186);
INSERT INTO seminar_3.salary VALUES('Ruth Ellerbrock', 'SUPPORT', 179);
INSERT INTO seminar_3.salary VALUES('Barry Johnson', 'HEAD', 10000);
INSERT INTO seminar_3.salary VALUES('Sidney Higa', 'HEAD', 1);
INSERT INTO seminar_3.salary VALUES('Max Lanson', 'PR', 150);
\11 + отладка
select * from seminar_3.Salary;
\11.1
create table seminar_3.Department(
    department_nm varchar(40) not null,
    location varchar(40) not null
);
\12
select employee_nm from seminar_3.Salary where salary>500;
\12.1
INSERT INTO seminar_3.department VALUES('HR', 'Murom');
INSERT INTO seminar_3.department VALUES('SUPPORT', 'Saratov');
INSERT INTO seminar_3.department VALUES('MANAGEMENT', 'Samara');
INSERT INTO seminar_3.department VALUES('HEAD', 'Moscow');
INSERT INTO seminar_3.department VALUES('SALE', 'Moscow');
INSERT INTO seminar_3.department VALUES('R&D', 'Novosibirsk');
\13
select employee_nm from seminar_3.Salary where salary<400 and department_nm='HR';
\14
select employee_nm from seminar_3.Salary where salary between 300 and 500;
\14.1
select * from seminar_3.Department;
\15
select employee_nm from seminar_3.Salary where (employee_nm like '%a% %' or employee_nm like 'A%') and salary>=100;
\16
select employee_nm from seminar_3.Salary where department_nm='HR' union select employee_nm from seminar_3.Salary where department_nm='PR';
\17
select distinct department_nm from seminar_3.Salary where department_nm like '__';
\17.1
select employee_nm from seminar_3.Salary inner join seminar_3.Department
    on (seminar_3.Salary.department_nm=seminar_3.Department.department_nm and seminar_3.Department.location='Moscow');
\18
select department_nm from seminar_3.Salary where department_nm like 'S%'
\19
select employee_nm from seminar_3.Salary where not department_nm='R&D' intersect select employee_nm from seminar_3.Salary where not department_nm='SUPPORT'
\19.1
select employee_nm from seminar_3.Salary left join seminar_3.Department on seminar_3.Salary.department_nm = seminar_3.Department.department_nm
    where location is null;
\20
select distinct department_nm from seminar_3.Salary where department_nm like '%A%' and department_nm like '%E%'
\21
select count(*) from seminar_3.Salary;
\22
select max(salary) from seminar_3.Salary;
\23
select count(*) from seminar_3.Salary where salary>500;
\24
select department_nm, avg(salary) as avg_salary from seminar_3.Salary group by department_nm;
\25
select department_nm from seminar_3.Salary group by department_nm having avg(salary)>300;
\26
select department_nm from seminar_3.Salary group by department_nm having min(salary)>500;
\27
select department_nm from seminar_3.Salary group by department_nm having count(*)>=10;
\28
select employee_nm from seminar_3.Salary order by salary DESC
\28.1
select seminar_3.Department.location, max(seminar_3.Salary.salary) as max_salary
from seminar_3.Department inner join seminar_3.Salary on seminar_3.Salary.department_nm = seminar_3.Department.department_nm
group by seminar_3.Department.location;
\29
select department_nm,
       avg(salary) as avg_salary, min(salary) as min_salary, max(salary) as max_salary, count(*) as workers
from seminar_3.Salary group by department_nm order by avg_salary DESC;
\29.1
select distinct seminar_3.Salary.department_nm
from seminar_3.Salary;
\30
select (max(salary) - min(salary)) as max_minus_min_salary, (max(salary) - avg(salary)) as max_minus_avg_salary from seminar_3.Salary;
\30.1
select seminar_3.Department.location, count(seminar_3.Salary.employee_nm)
from seminar_3.Department right join seminar_3.Salary on seminar_3.Salary.department_nm = seminar_3.Department.department_nm
group by seminar_3.Department.location;
\31
select department_nm, (max(salary) - avg(salary)) as max_minus_avg_salary, (max(salary) - min(salary)) as max_minus_min_salary, (avg(salary) - min(salary)) as avg_minus_min_salary
from seminar_3.Salary group by department_nm;
\32
select department_nm from seminar_3.Salary group by department_nm order by sum(salary);
\32.1
select seminar_3.Department.location, min(seminar_3.Salary.salary)
from seminar_3.Department inner join seminar_3.Salary on seminar_3.Salary.department_nm = seminar_3.Department.department_nm
group by seminar_3.Department.location having min(seminar_3.Salary.salary)>=500
\35
select seminar_3.Salary.employee_nm
from seminar_3.Department right join seminar_3.Salary on seminar_3.Salary.department_nm = seminar_3.Department.department_nm
order by seminar_3.Department.location, seminar_3.Salary.salary;

