# BDHomeworkDolphinDB
1. История развития СУБД

Initial release	2016

Stable release 0.7

DolphinDB was started in 2011 when a team of Wall Street software engineers realized conventional database and analytical systems were too slow in processing huge volumes of time-series data. Today the company offers the world’s fastest distributed time-series database that is seamlessly integrated with a fully featured programming language and a high-performance real-time streaming system.

2. Инструменты для взаимодействия с СУБД

DolphinDB предоставляет Python, Java, C++, C# и Excel API для интеграции в существующие приложения.

3. Какой database engine используется в вашей СУБД?

DolphinDB database provides a cross-sectional aggregation engine that can perform aggregation operations on the latest data of all groups in the streaming data. The main body of the cross section engine is divided into two parts: the cross section data table and the calculation engine.

4. Как устроен язык запросов в вашей СУБД? Разверните БД с данными и выполните ряд запросов.

Установщики существуют только для линуса и винды, а у меня мак, поэтому установил на виртуалку
https://marketplace.visualstudio.com/items?itemName=dolphindb.dolphindb-vscode

5. Распределение файлов БД по разным носителям?

Существует что-то на китайском про это https://github.com/dolphindb/Tutorials_CN/blob/master/dolphindb_user_guide.md

6. На каком языке/ах программирования написана СУБД?

DolphinDB написан на C++.

7. Какие типы индексов поддерживаются в БД? Приведите пример создания индексов.

индекс может содержать несколько типов,
каждый тип содержит несколько документов, соответствующих данным DolphinDB.
инвертированный индекс, битовый индекс

8. Как строится процесс выполнения запросов в вашей СУБД?

кто его знает

9. Есть ли для вашей СУБД понятие «план запросов»? Если да, объясните, как работает данный этап.

Есть шедуллер
We can schedule to run jobs at specified time with specified frequencies.
https://www.dolphindb.com/help/SystemManagement/ScheduleJobs.html

10. Поддерживаются ли транзакции в вашей СУБД? Если да, то расскажите о нем. Если нет, то существует ли альтернатива?

DolphinDB adopt WAL(Write Ahead Log) To ensure the atomicity and persistence of transactions , Operations on data are first written to WAL(Write Ahead Log), If an error occurs halfway through the transaction ( Such as downtime ), You can restart according to WAL Roll back the transaction (rollback), Ensure that the operations contained in the transaction are either all successful , All or nothing .
DolphinDB Submit the agreement in two stages (Two-phase commit, 2PC) To ensure the atomicity of distributed transactions and the consistency of cluster data . For all nodes involved in distributed transactions , Either the execution is successful on all nodes (commit), All or nothing (rollback), There will be no partial success or partial failure .
DolphinDB Through multi version control (Multiversion concurrency control, MVCC) To ensure isolation . Read and write concurrent transactions are isolated from each other , Reading does not affect writing , Writing does not affect reading .
DolphinDB adopt Raft To ensure the consistency of cluster metadata .


11. Какие методы восстановления поддерживаются в вашей СУБД. Расскажите о них.

Можно бекапить таблицы
https://stackoverflow.com/questions/70828137/any-efficient-way-for-batch-backup-of-all-tables-in-a-dolphindb-database

12. Расскажите про шардинг в вашей конкретной СУБД. Какие типы используются? Принцип работы.

It supports automatic sharding

13. Возможно ли применить термины Data Mining, Data Warehousing и OLAP в вашей СУБД?

High-performance Database: Columnar hybrid (in-memory and disk-based) engine delivers fast performance for data warehouses with vast amount of data.

DolphinDB is an OLAP database system. It is designed for fast storage and query/computing of massive structured data and for high performance data processing with the in-memory database and streaming functionalities. It is not an OLTP system for frequent updates.

17. Какие методы защиты поддерживаются вашей СУБД? Шифрование трафика, модели авторизации и т.п.

The controller node in DolphinDB is authorized to issue tickets encrypted with OpenSSL

18. Какие сообщества развивают данную СУБД? Кто в проекте имеет права на коммит и создание дистрибутива версий? Расскажите об этих людей и/или компаниях.

https://www.linkedin.com/company/dolphindb
At DolphinDB, we are passionate about helping our clients improve their big data solutions. Numerous clients have been able to speed up their database and analytical systems by up to 1000 times thanks to DolphinDB. We are serving clients in areas such as finance, industrial IoT, telecommunications and academia. 

19. Создайте свои собственные данные для демонстрации работы СУБД.

В процессе

19. Как продолжить самостоятельное изучение языка запросов с помощью демобазы. Если демобазы нет, то создайте ее.

https://stackoverflow.com/questions/tagged/dolphindb

20. Где найти документацию и пройти обучение

https://dolphindb.com/article/article.php?id=79#service2_en

21. Как быть в курсе происходящего

https://github.com/dolphindb
