# BDHomeworkRedis

Установил docker desktop https://docs.docker.com/desktop/mac/install/

Спуллил redis-insight https://hub.docker.com/r/redislabs/redisinsight

Понял, что не понял, как подключиться


Скачал redis-insight с помощью друга https://download.redisinsight.redis.com/latest/RedisInsight-v2-mac-x64.dmg

Установил brew install redis

Установился сам redis-server
<img width="1281" alt="image" src="https://user-images.githubusercontent.com/54956141/163784025-464327c3-1bbe-4be6-a74c-abf1e9c523e9.png">

Запустил в фоне brew services start redis

Теперь можно подключиться через redis-cli
https://redis.io/docs/getting-started/installation/install-redis-on-mac-os/


Понял, как подключаться к докерному redis-insight, нужно пробросить 8001 порт и зайти через браузер

Спуллил redis, пробросил порт 6379

Попытался подключиться в redis-insight. Получил такую ошибку

Could not connect: Error 99 connecting to localhost:6379. Cannot assign requested address.


Понял, что redis и redis-insight не в одной сети, и нужно собираться через docker-compose

Сделал docker-compose.yml как здесь https://collabnix.com/running-redisinsight-using-docker-compose/


Пришлось подключаться не по localhost, а по 10.55.130.24 из ifconfig en0

Потом понял, что нужно подключиться по названию сервиса в docker-compose.yml. Подключился по redis:6379
<img width="1792" alt="image" src="https://user-images.githubusercontent.com/54956141/163799530-39f1b24f-f8f8-40cf-a6c7-4a44f97c6131.png">


Почитал про RedisJSON, понял, что не хочу его использовать

Написал небольшую програмку на питоне, чтобы сделать простой json с одной парой ключ-значение, подобрал размер ключа и значения, чтобы примерно получилось 20МБ

Начал вспоминать про строки, hset, zset, list в redis

Попытался вставить ключ, но и браузер, и десктоптня версия зависают от таких больших значений

Попробовал сделать 1МБ, но зависает на get

Смог удалить значение только при помощи FLUSHDB


Включил showlog в вебверсии, через него увидел, что 
* на set ушло 0,20 мс, на get 0,18 мс
* на hset 0,27 мс, на hget 0,17 мс
* на rpush 0,22 мс, на lindex 0,18 мс
* на zadd 0,18 мс, zrange 0,11 мс

Далее настроил кластер на 6 нод, как описано в этой статье https://www.dltlabs.com/blog/how-to-setup-configure-a-redis-cluster-easily-573120

timeout-ы проставил в redis.conf файлах https://redis.io/docs/manual/scaling/
