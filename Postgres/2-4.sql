ПЕРВАЯ КОНСОЛЬ
\3
begin transaction isolation level read committed;
    insert into seminar_5.test_table(my_text_field) values ('test_value1');
commit;

update seminar_5.test_table set my_text_field='test_value1' where my_id=1;
\check
select * from new_database.seminar_5.test_table;
\5
begin transaction isolation level repeatable read;
insert into seminar_5.test_table(my_text_field) values ('test2');
savepoint save;
update seminar_5.test_table set my_text_field='pop' where my_id=1;
commit;
insert into seminar_5.test_table(my_text_field) values ('test3');
rollback;
\8
begin transaction isolation level read committed ;
    insert into seminar_5.test_table(my_text_field) values ('test_stuff_1');
commit;
\9
begin transaction isolation level serializable;
    select * from seminar_5.test_table;
    insert into seminar_5.test_table(my_text_field) values ('another_serializable');
commit;
rollback;


ВТОРАЯ КОНСОЛЬ
select * from seminar_5.test_table;
begin transaction isolation level repeatable read ;
update seminar_5.test_table set my_text_field='p2p' where my_id=1;
commit;
rollback;
\8
begin transaction  isolation level read committed;
    insert into seminar_5.test_table(my_text_field) values ('test_stuff_2');
commit;
\9
begin transaction isolation level serializable;
    insert into seminar_5.test_table(my_text_field) values ('serializable_test');
commit;
\10
begin transaction isolation level read committed;
    insert into seminar_5.test_table(my_text_field) values ('line1');
    insert into seminar_5.test_table(my_text_field) values ('line2');
    savepoint save1;
    insert into seminar_5.test_table(my_text_field) values ('line3');
    insert into seminar_5.test_table(my_text_field) values ('line4');
    savepoint save2;
    insert into seminar_5.test_table(my_text_field) values ('line5');
    rollback to save2;
    rollback to save1;
    rollback;
select * from seminar_5.test_table;