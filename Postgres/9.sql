\1
create schema seminar_7;
\2
DROP SCHEMA IF EXISTS seminar_7 CASCADE;
CREATE SCHEMA seminar_7;

DROP TABLE IF EXISTS seminar_7.participant;
CREATE TABLE seminar_7.participant
(
    participant_id         INT PRIMARY KEY,
    participant_nm         VARCHAR(200),
    participant_birth_dt   DATE,
    participant_country_nm VARCHAR(200)
);

DROP TABLE IF EXISTS seminar_7.competition;
CREATE TABLE seminar_7.competition
(
    competition_id           INT PRIMARY KEY,
    competition_nm           VARCHAR(200),
    held_dt                  DATE,
    competition_country_nm   VARCHAR(100),
    result_sorting_type_code VARCHAR(10)
        CHECK (result_sorting_type_code IN ('ASC', 'DESC'))
);

DROP TABLE IF EXISTS seminar_7.competition_result;
CREATE TABLE seminar_7.competition_result
(
    competition_id         INT
        REFERENCES seminar_7.competition (competition_id),
    participant_id         INT
        REFERENCES seminar_7.participant (participant_id),
    participant_result_amt NUMERIC(20, 2)
);
\3
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (1, 'Иванов И.И.', '1970-01-17', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (2, 'Петров А.С.', '1989-02-03', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (3, 'Яковлев П.П.', '1990-04-28', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (4, 'Николаев Д.С.', '1988-09-24', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (5, 'Николаев С.С.', '1987-06-20', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (6, 'Попова А.А.', '1989-12-30', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (7, 'Максимова Ю.П.', '1988-05-23', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (8, 'Смирнов И.И.', '1985-04-27', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (9, 'Попова Р.А.', '1991-04-22', 'Украина');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (10, 'Степанов П.И.', '1987-10-23', 'Украина');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (11, 'Михайлов В.Д.', '1989-04-23', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (12, 'Веселов Н.Д.', '1987-11-25', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (13, 'Киреева З.Д.', '1988-04-05', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (14, 'Дмитриева О.Ж.', '1988-04-05', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (15, 'Федорова М.Л.', '1988-04-05', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (16, 'Лаптева И.Д.', '1988-04-05', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (17, 'Григорьев Л.З.', '1987-05-28', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (18, 'Черепаха П.Г.', '1990-04-01', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (19, 'Цекало М.З.', '1987-06-17', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (20, 'Чапаев К.Л.', '1988-09-30', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (21, 'Чистов К.П.', '1989-06-22', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (22, 'Мамаева В.Р.', '1987-10-27', 'Украина');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (23, 'Михайлов К.Д.', '1988-08-10', 'Украина');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm)
VALUES (24, 'Попов А.Д.', '1987-04-18', 'Украина');

INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm,
                                   result_sorting_type_code)
VALUES (1, 'Веселые старты', '2019-04-09', 'Россия', 'DESC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm,
                                   result_sorting_type_code)
VALUES (2, 'Забег на 10 км', '2017-06-15', 'США', 'DESC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm,
                                   result_sorting_type_code)
VALUES (3, 'Прыжки в длину', '2016-04-23', 'Болгария', 'ASC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm,
                                   result_sorting_type_code)
VALUES (4, 'Прыжки в высоту', '2019-08-14', 'Россия', 'ASC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm,
                                   result_sorting_type_code)
VALUES (5, 'Метание ядра', '2018-05-25', 'США', 'ASC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm,
                                   result_sorting_type_code)
VALUES (6, 'Триатлон', '2014-11-18', 'Россия', 'DESC');

INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (1, 13, 100.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (1, 15, 113.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (1, 10, 50.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (1, 1, 88.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (1, 3, 19.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (1, 4, 56.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (1, 7, 73.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (1, 19, 23.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (2, 11, 92.77);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (2, 2, 104.10);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (2, 9, 115.09);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (2, 4, 105.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (2, 3, 100.10);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (2, 15, 100.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (2, 17, 99.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 5, 343.70);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 6, 645.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 10, 113.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 14, 115.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 15, 119.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 16, 333.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 20, 249.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 21, 149.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 22, 84.20);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 23, 90.07);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 24, 114.88);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (3, 1, 176.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (4, 19, 123.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (4, 18, 234.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (4, 17, 112.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (4, 16, 187.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (4, 15, 109.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (4, 14, 156.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (4, 13, 178.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 1, 116.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 3, 118.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 5, 125.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 7, 129.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 9, 127.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 11, 106.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 13, 105.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 15, 104.50);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 17, 106.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 19, 107.50);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 21, 108.99);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (5, 23, 105.45);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 2, 105.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 4, 100.67);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 6, 147.99);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 8, 185.70);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 10, 136.50);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 12, 114.80);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 14, 149.43);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 16, 115.80);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 18, 100.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 20, 99.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 22, 104.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt)
VALUES (6, 24, 106.00);

\4
select competition_nm,
       participant_nm,
       participant_result_amt,
       max(participant_result_amt)
       over (partition by competition.competition_id order by competition.competition_id) as top_result
from seminar_7.competition_result
         inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
         inner join seminar_7.competition on competition_result.competition_id = competition.competition_id
where result_sorting_type_code = 'ASC'
union
select competition_nm,
       participant_nm,
       participant_result_amt,
       min(participant_result_amt)
       over (partition by competition.competition_id order by competition.competition_id) as top_result
from seminar_7.competition_result
         inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
         inner join seminar_7.competition on competition_result.competition_id = competition.competition_id
where result_sorting_type_code = 'DESC';
\5
select competition_nm,
       participant_nm,
       participant_result_amt,
       count(position) over (partition by competition_nm order by position) as position
from (
         select competition_nm,
                participant_nm,
                participant_result_amt,
                rank() over (partition by competition.competition_id order by participant_result_amt ASC) as position
         from seminar_7.competition_result
                  inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
                  inner join seminar_7.competition on competition_result.competition_id = competition.competition_id and
                                                      result_sorting_type_code = 'ASC'
         union
         select competition_nm,
                participant_nm,
                participant_result_amt,
                rank() over (partition by competition.competition_id order by participant_result_amt DESC) as position
         from seminar_7.competition_result
                  inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
                  inner join seminar_7.competition on competition_result.competition_id = competition.competition_id and
                                                      result_sorting_type_code = 'DESC'
     ) as name
where position <= 3;
\6
-- select * from (
select competition_nm,
       participant_nm,
       participant_result_amt,
       abs(participant_result_amt -
           max(participant_result_amt) over (partition by competition.competition_id)) as difference
from seminar_7.competition_result
         inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
         inner join seminar_7.competition on competition_result.competition_id = competition.competition_id
-- ) as kek
--where difference <> 0
\7
with tops as (
    select competition_nm, participant_nm, participant_birth_dt, participant_result_amt
    from (
             select *, max(participant_result_amt) over (partition by competition.competition_id) as max_result
             from seminar_7.competition_result
                      inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
                      inner join seminar_7.competition on competition_result.competition_id = competition.competition_id
         ) as x
    where competition_nm = x.competition_nm
      and participant_result_amt = max_result
)
select competition.competition_nm,
       participant.participant_nm,
       participant.participant_birth_dt as participant,
       tops.participant_nm              as top_nm,
       tops.participant_birth_dt        as top,
       competition_result.participant_result_amt
from seminar_7.competition_result
         inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
         inner join seminar_7.competition on competition_result.competition_id = competition.competition_id
         inner join tops on competition.competition_nm = tops.competition_nm and
                            participant.participant_birth_dt < tops.participant_birth_dt;
\8
select competition_nm,
       participant_nm,
       lag(participant_result_amt, 1, 0::numeric)
       over (partition by competition_nm order by participant_result_amt)                                             as prev_result,
       participant_result_amt,
       lead(participant_result_amt, 1, 0::numeric)
       over (partition by competition_nm order by participant_result_amt)                                             as next_resutl,
       participant_result_amt - lag(participant_result_amt, 1, 0::numeric)
                                over (partition by competition_nm order by participant_result_amt)                    as difference
from seminar_7.competition_result
         inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
         inner join seminar_7.competition on competition_result.competition_id = competition.competition_id
\9
select distinct competition_nm, count(*) over (partition by competition_nm)
from seminar_7.competition_result
         inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
         inner join seminar_7.competition on competition_result.competition_id = competition.competition_id
\10
select *,
       case position
           when 1 then 'Занял место 1'
           when 2 then 'Занял место 2'
           when 3 then 'Занял место 3'
           else 'Не занял призового места'
           end                                                              as comment,
       count(position) over (partition by competition_nm order by position) as kek
from (
         select competition_nm,
                participant_nm,
                participant_result_amt,
                rank() over (partition by competition.competition_id order by participant_result_amt ASC) as position
         from seminar_7.competition_result
                  inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
                  inner join seminar_7.competition on competition_result.competition_id = competition.competition_id and
                                                      result_sorting_type_code = 'ASC'
         union
         select competition_nm,
                participant_nm,
                participant_result_amt,
                rank() over (partition by competition.competition_id order by participant_result_amt DESC) as position
         from seminar_7.competition_result
                  inner join seminar_7.participant on competition_result.participant_id = participant.participant_id
                  inner join seminar_7.competition on competition_result.competition_id = competition.competition_id and
                                                      result_sorting_type_code = 'DESC'
     ) as source