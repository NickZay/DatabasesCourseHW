--3
DROP SCHEMA IF EXISTS project CASCADE;
CREATE SCHEMA project;

CREATE TABLE project.departments (
    department_nm   VARCHAR(100) PRIMARY KEY,
    description     TEXT
);

CREATE TABLE project.teachers (
    teacher_id      int         PRIMARY KEY,
    full_name       VARCHAR(50),
    department_nm   VARCHAR(50)
        REFERENCES project.departments(department_nm)
);

CREATE TABLE project.disciplines (
    discipline_nm   VARCHAR(50) PRIMARY KEY,
    course_num      INT,
    department_nm   VARCHAR(50)
        REFERENCES project.departments(department_nm)
);

--DROP TABLE IF EXISTS project.Fields_of_study;
CREATE TABLE project.fields_of_study (
    field_of_study_num  VARCHAR(50) PRIMARY KEY,
    field_of_study_nm   VARCHAR(50)
);

CREATE TABLE project.discipline_in_field (
    field_of_study_num  VARCHAR(50)
        REFERENCES project.fields_of_study(field_of_study_num),
    discipline_nm       VARCHAR(50)
        REFERENCES project.disciplines(discipline_nm),
    CONSTRAINT PK_discipline_in_field
        PRIMARY KEY (field_of_study_num, discipline_nm)
);

CREATE TABLE project.groups (
    group_nm            VARCHAR(50) PRIMARY KEY,
    field_of_study_num  VARCHAR(50)
        REFERENCES project.fields_of_study(field_of_study_num)
);

CREATE TABLE project.students (
    student_id  INT     PRIMARY KEY,
    full_name   VARCHAR(50),
    group_nm    VARCHAR(50)
        REFERENCES project.groups(group_nm)
);

CREATE TABLE project.lessons (
    discipline_nm   VARCHAR(50)
        REFERENCES project.disciplines(discipline_nm),
    teacher_id      INT
        REFERENCES project.teachers(teacher_id),
    group_nm        VARCHAR(50)
        REFERENCES project.groups(group_nm),
    lesson_type     VARCHAR(10),
    CONSTRAINT PK_lessons PRIMARY KEY (discipline_nm, teacher_id, group_nm)
);

--4
INSERT INTO project.departments VALUES  --full
('Кафедра высшей математики', 'Учат сложной математике'),
('Кафедра общей физики', 'Учат современной физике'),
('Департамент иностранных языков', 'Можно выбирать различные языки'),
('Кафедра теоретической физики', 'Учат очень сложной физике'),
('Департамент физической культуры и спорта', 'Можно выбирать специализации и секции'),
('Кафедра анализа данных', 'Яндекс!'),
('Кафедра корпоративных информационных систем', '1С!'),
('Кафедра дискретной математики', 'Райгородский'),
('Кафедра распознавания изображений и обработки текста', 'ABBYY'),
('Кафедра банковских информационных технологий (БИТ)', 'Сбербанк'),
('Кафедра алгоритмов и технологий программирования', 'Много полезных обязательных курсов');

INSERT INTO project.teachers VALUES
(1, 'Меркурьева Надежда', 'Кафедра алгоритмов и технологий программирования'),
(2, 'Халяпов Александр', 'Кафедра алгоритмов и технологий программирования'),
(3, 'Тюрюмина Элла', 'Кафедра алгоритмов и технологий программирования'),
(4, 'Мавлютов Максим', 'Кафедра алгоритмов и технологий программирования'),
(5, 'Лукьянов Денис', 'Кафедра алгоритмов и технологий программирования'),
(6, 'Митюрин Максим', 'Кафедра алгоритмов и технологий программирования'),
(7, 'Роздухова Нина', 'Кафедра алгоритмов и технологий программирования');

INSERT INTO project.disciplines VALUES
('Databases', 2, 'Кафедра алгоритмов и технологий программирования');

INSERT INTO project.fields_of_study VALUES --full
('01.03.02', 'Прикладная математика и информатика'),
('03.03.01', 'Компьютерные технологии'),
('09.03.01', 'Информатика и вычислительная техника');

INSERT INTO project.discipline_in_field VALUES --full
('01.03.02', 'Databases'),
('03.03.01', 'Databases'),
('09.03.01', 'Databases');

INSERT INTO project.groups VALUES --full
('Б05-921', '01.03.02'),
('Б05-922', '01.03.02'),
('Б05-923', '01.03.02'),
('Б05-924', '01.03.02'),
('Б05-925', '01.03.02'),
('Б05-926', '01.03.02'),
('Б05-927', '01.03.02'),
('Б05-931', '09.03.01'),
('Б05-932', '09.03.01'),
('Б05-911', '03.03.01'),
('Б05-912', '03.03.01');

INSERT INTO project.students VALUES --full
(1, 'Айсин Тимур Рустемович', 'Б05-927'),
(2, 'Алекберов Ислам Гарибович', 'Б05-927'),
(3, 'Виденеева Надежда Вячеславовна', 'Б05-927'),
(4, 'Гусев Петр Андреевич', 'Б05-927'),
(5, 'Дибров Андрей Алексеевич', 'Б05-927'),
(6, 'Долгов Максим Евгеньевич', 'Б05-927'),
(7, 'Ковалёв Константин Андреевич', 'Б05-927'),
(8, 'Макаров Владимир Владимирович', 'Б05-927'),
(9, 'Мараховский Константин Владимирович', 'Б05-927'),
(10, 'Мишин Данила Константинович', 'Б05-927'),
(11, 'Падас Ольга Александровна', 'Б05-927'),
(12, 'Пономарчук Анна Сергеевна', 'Б05-927'),
(13, 'Ипатов Всеволод Олегович', 'Б05-927'),
(14, 'Пластинина Валентина Александровна', 'Б05-927'),
(15, 'Солодова Екатерина Максимовна', 'Б05-927'),
(16, 'Владимиров Эдуард Анатольевич', 'Б05-927'),
(17, 'Зайцев Никита Игоревич', 'Б05-927');

INSERT INTO project.lessons VALUES --full
('Databases', 6, 'Б05-927', 'seminar');

--5
INSERT INTO project.students VALUES
(18, 'Баринов Денис Юрьевич', 'Б05-931'),
(19, 'Бартенев Павел Андреевич', 'Б05-931'),
(20, 'Ванурин Сергей Максимович', 'Б05-931'),
(21, 'Вдовин Максим Денисович', 'Б05-931'),
(22, 'Воробьев Михаил Кириллович', 'Б05-931'),
(23, 'Демина Елизавета Юрьевна', 'Б05-931'),
(24, 'Дробченко Екатерина Дмитриевна', 'Б05-931'),
(25, 'Коновалова Марина Алексеевна', 'Б05-931'),
(26, 'Кулабухова Кристина Александровна', 'Б05-931'),
(27, 'Кязимов Кирилл Александрович', 'Б05-931'),
(28, 'Мусихин Марк Михайлович', 'Б05-931'),
(29, 'Новиков Сергей Александрович', 'Б05-931'),
(30, 'Саранчин Андрей Николаевич', 'Б05-931'),
(31, 'Чуркин Алексей Сергеевич', 'Б05-931'),
(32, 'Солодова Екатерина Максимовн', 'Б05-931'),
(33, 'Владимиров Эдуард Анатольевич', 'Б05-931'),
(34, 'Зайцев Никита Игоревич', 'Б05-931');

SELECT full_name FROM project.students WHERE group_nm = 'Б05-931';
UPDATE project.students SET full_name = 'Солодова Екатерина Максимовна' WHERE full_name = 'Солодова Екатерина Максимовн';
DELETE FROM project.students WHERE full_name = 'Зайцев Никита Игоревич' AND group_nm = 'Б05-931'
                                OR full_name = 'Владимиров Эдуард Анатольевич' AND group_nm = 'Б05-931'
                                OR full_name = 'Солодова Екатерина Максимовн' AND group_nm = 'Б05-931';

--6
--Количество человек в группах по убыванию
SELECT groups.group_nm, count(full_name)
FROM project.groups INNER JOIN project.students ON groups.group_nm = students.group_nm
GROUP BY groups.group_nm
HAVING count(full_name) <> 0
ORDER BY count(full_name) DESC;

--Количество занятий у одного преподавателя
SELECT discipline_nm, teacher_id,
       count(discipline_nm) over (partition by teacher_id)
FROM project.lessons;

--Количество занятий у одного преподавателя, с накоплением по номеру группы
SELECT discipline_nm, teacher_id, group_nm,
       count(discipline_nm) over (partition by teacher_id order by group_nm)
FROM project.lessons;


--Вывести все дисциплины по курсам
SELECT discipline_nm, department_nm,
       count(course_num) over (order by course_num) as course_no
FROM project.disciplines;


-- create table x (
--     y int
-- );
-- insert into x values (1), (2), (4), (3);
-- select count(y) over (order by y) from x;

--7
--Для групп это важно, чтобы быстро выводить всех людей группы
CREATE INDEX ON project.students(group_nm);
--Для кафедр это важно, чтобы быстро выводить всех её преподавателей
CREATE INDEX ON project.teachers(department_nm);

--8
DROP SCHEMA IF EXISTS pro_views CASCADE;
CREATE SCHEMA pro_views;

CREATE VIEW pro_views.vishmat_teachers AS
    SELECT full_name FROM project.teachers WHERE department_nm = 'Кафедра высшей математики';

CREATE VIEW pro_views.b05_927 AS
    SELECT full_name FROM project.students WHERE group_nm = 'Б05-927';

--9
-- Ваши занятия
CREATE VIEW pro_views.max_lessons AS
    SELECT discipline_nm, group_nm
    FROM project.lessons INNER JOIN project.teachers ON teachers.teacher_id = lessons.teacher_id
    WHERE teachers.full_name = 'Митюрин Максим';

-- лекторы
CREATE VIEW pro_views.lectors AS
    SELECT DISTINCT full_name
    FROM project.teachers INNER JOIN project.lessons l on teachers.teacher_id = l.teacher_id
    WHERE lesson_type = 'lecture';

-- дисциплины на ПМИ на 2 курсе
CREATE VIEW pro_views.pmi2 AS
    SELECT DISTINCT d.discipline_nm
    FROM project.disciplines d INNER JOIN project.discipline_in_field dif on dif.discipline_nm = d.discipline_nm
    WHERE field_of_study_num = '01.03.02' AND course_num = 2;

--11
CREATE PROCEDURE update_students(INOUT p1 VARCHAR(50)) AS $$
    BEGIN
        RAISE NOTICE 'Student % will change to %', p1 ;
    END;
$$ LANGUAGE plpgsql ;

create table table_ (
    id int
);
select id from (
   select id, rank() over (order by id) as dense_id
   from table_
) as t
where dense_id = (select count(id) from table_);


select case id
        when 0 then 2
        when 1 then 3
        end
from table_
















