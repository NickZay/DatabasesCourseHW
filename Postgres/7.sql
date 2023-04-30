create table public.organization as
select 1 as id_org, 'АО Тинькофф Банк' as name_org
union
select 2, 'X5 Retail Group'
union
select 3, 'АО Ромашка';

create table public.teacher (id_teach, last_name, first_name, birth_date, salary_amt, id_org) as
select 1, 'Роздухова', 'Нина', '1992-04-15', 15000.00, 1
union
select 2, 'Меркурьева', 'Надежда', '1995-03-12', 25000.00, 1
union
select 3, 'Халяпов', 'Александр', '1994-09-30', 17000.00, 2
union
select 4, 'Иванов', 'Иван', NULL, 100000.00, 3
union
select 5, 'Петров', 'Петр', NULL, 3000.00, 3;

\1
create view copy_teacher as select * from teacher;
\2
create view copy_teacher_without_org as select * from teacher where id_org is null;
\3
create or replace view list_teachers as
                     select id_teach, last_name, first_name, birth_date, name_org
                     from teacher inner join organization
                         on teacher.id_org = organization.id_org
\4
create or replace view new_list_teachers as
    select id_teach, last_name || ' ' || first_name as "Фамилия Имя", birth_date as "Дата рождения", name_org as "«Название организации"
    from teacher inner join organization
        on teacher.id_org = organization.id_org
\5
insert into copy_teacher values (6, 'Kek', 'Lolovich', NULL, 100, 1);
\6
delete from copy_teacher where id_teach=6;
\7
update copy_teacher set birth_date = '1994-02-19' where id_teach = 4;
\8
--...

\1
with recursive t(n) as (
        select 0
    union all
        select n + 1 from t where n < 100
 )
select n from t;
\2
with recursive t(n) as (
        select 3
    union all
        select n + 5 from t where n < 48
 )
select sum(n) from t;
\3
select sum(n) from
(with recursive t(n) as (
        values (1)
    union all
        select n * 3 from t
 )
select n from t limit 10) as name
\4
with recursive t(n) as (
        values ('2021-02-04'::date)
    union all
        select n + 1 from t where n < now()
 )
select n from t
\5
with recursive t(n) as (
        values ('2021-02-04'::date)
    union all
        select (n + interval '7' day)::date from t where n < now()
 )
select n from t;

--Иерархия
create table public.department (dep_id, par_dep_id, dep_name) as
select 1, NULL, 'АО Тинкофф Банк' union
select 2, 1, 'Управление анализа кредитных рисков' union
select 3, 2, 'Отдел риск-менеджмента малого и среднего бизнеса' union
select 4, 2, 'Отдел риск-менеджмента розничного бизнеса' union
select 5, 1, 'Департамент ИТ' union
select 6, 5, 'Управление хранилищ данных и отчетности' union
select 7, 6, 'Отдел очистки и контроля качества данных' union
select 8, 7, 'Группа администрирования хранилищ данных' union
select 9, 7, 'Группа контроля качества данных' union
select 10, 5, 'Отдел отчетности и витрин данных' union
select 11, 5, 'Отдел трансформации и загрузки данных' union
select 12, 11, 'Группа системного анализа' union
select 13, 11, 'Группа разработки'
;
\1
select parent_d.dep_id as parent_id, parent_d.dep_name as parent_name, child_d.dep_name as child_name,
       count(*) over (partition by parent_d.dep_id)
from department child_d
    inner join department parent_d
        on child_d.par_dep_id = parent_d.dep_id
\2
WITH RECURSIVE recursion(dep_id, dep_name, step) AS (
        SELECT dep_id, dep_name, 1::numeric as step FROM department
    UNION ALL
        SELECT department.dep_id, department.dep_name, step + 1
        FROM recursion parent
            INNER JOIN department
                ON parent.dep_id = department.par_dep_id
        where step < 5
)
SELECT * FROM recursion
where step = 5




