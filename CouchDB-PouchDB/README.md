# BDHomeworkCouchDB-PouchDB

Скачал Apache-CouchDB, открыл сайт, сделал админ-юзера admin с паролем admin.

Создал коллекцию hw, добавил в нее запись 

{
  "_id": "91656ae1d963d290de0330dbd3000c28",
  "_rev": "2-5e1042f5dbb146dd4abbebfdf70baa31",
  "name": "Zaitsev"
}

Скачал файл PouchDB.html

Сначала проставил в url Remote ~/Downloads/pouchdb-7.2.1.min.js, но он не увидел файл

Поменял на ./pouchdb-7.2.1.min.js, файл нашелся, но зафейлились CORS ![image](https://user-images.githubusercontent.com/54956141/161120175-7fdba24b-e4d6-4862-90c2-f9babe43ebe0.png)

Включил CORS ![image](https://user-images.githubusercontent.com/54956141/161120606-6e17fbf1-fd5d-4f74-85e8-64b40d16de3b.png)

Но теперь ошибка с авторизацией ![image](https://user-images.githubusercontent.com/54956141/161120685-27d866e1-c1e8-48e8-afbe-f3467960fc83.png)

Полчаса искал, как добавить авторизацию. Нужно было заменить хост на http://admin:admin@localhost:5984/hw

После нажатия на кнопку Sync появилась запись Zaitsev 

![image](https://user-images.githubusercontent.com/54956141/161123673-8346ddca-2cbd-443d-a411-3afe7fcf3c55.png)

Закрыл CouchDB:
 > launchctl list | grep couchdb

   42225	0	application.org.apache.couchdb.10829207.10829213

 > launchctl stop "application.org.apache.couchdb.10829207.10829213"

 > launchctl list | grep couchdb

Обновил html, сделал sync, фамилия появилась

Файлик PouchDB.html в репозиторий добавил

На github pages залил https://nickzay.github.io/BDHomeworkCouchDB-PouchDB/PouchDB.html
