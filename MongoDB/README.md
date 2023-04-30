# BDHomeworkMongoDB

Установил MongoDB
```
brew tap mongodb/brew
brew install mongodb-community@5.0
```
MacOS предложила установить
```
xcode-select --install
```

Скачал MongoDB Compass
https://www.mongodb.com/products/compass

Понял, что где-то нужно развернуть базу, перед тем как к ней подключаться.

Запустил монгу
```
brew services start mongodb-community@5.0
```
Поключился в компасе.

Поделал разных команд:
```
$ show dbs
admin     41 kB
config  61.4 kB
local     41 kB

$ use hw
'switched to db hw'
$ db
hw

$ db.user.insert({nickname: 'NickZay', age: 21})
'DeprecationWarning: Collection.insert() is deprecated. Use insertOne, insertMany, or bulkWrite.'
{ acknowledged: true,
  insertedIds: { '0': ObjectId("622a1554ee8e0076ebde38e0") } }
$ db.user.find({})
{ _id: ObjectId("622a1554ee8e0076ebde38e0"),
  nickname: 'NickZay',
  age: 21 }
  
$ db.user.insert([{nickname: "Mary"}, {nickname: "Jane", age: 23}])
{ acknowledged: true,
  insertedIds: 
   { '0': ObjectId("622a1615ee8e0076ebde38e1"),
     '1': ObjectId("622a1615ee8e0076ebde38e2") } }
$ db.user.find({nickname: 'nickzay'})
$ db.user.find({nickname: 'NickZay'})
{ _id: ObjectId("622a1554ee8e0076ebde38e0"),
  nickname: 'NickZay',
  age: 21 }
$ db.user.update({nickname: 'Mary'}, {$set : {age: 41}})
'DeprecationWarning: Collection.update() is deprecated. Use updateOne, updateMany, or bulkWrite.'
{ acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0 }

$ db.user.remove({name: 'Jane'})
'DeprecationWarning: Collection.remove() is deprecated. Use deleteOne, deleteMany, findOneAndDelete, or bulkWrite.'
{ acknowledged: true, deletedCount: 0 }

$ db.dropDatabase()
{ ok: 1, dropped: 'hw' }
```

Посмотрел видео https://www.youtube.com/watch?v=-56x56UppqQ
Узнал и понял несколько новых коммандочек из видео https://gist.github.com/bradtraversy/f407d642bdc3b31681bc7e56d95485b6

Загрузил csv-шку из https://www.kaggle.com/fivethirtyeight/uber-pickups-in-new-york-city/version/2
нашел в https://habr.com/ru/company/edison/blog/480408/ (52 датасета)

[other-Dial7_B00887.csv.zip](https://github.com/NickZay/BDHomeworkMongoDB/files/8226028/other-Dial7_B00887.csv.zip)

<img width="1792" alt="Screen Shot 2022-03-10 at 21 24 14" src="https://user-images.githubusercontent.com/54956141/157729814-7555ab39-0834-4f8a-8660-35b5a23aaa4a.png">

Делаю запрос на MANHATTAN, получаю 89ms
<img width="1792" alt="Screen Shot 2022-03-10 at 21 25 10" src="https://user-images.githubusercontent.com/54956141/157730070-7f526fff-4bfd-4cab-a84f-e827a8446ef3.png">

Создал индекс на PuFrom
<img width="1792" alt="Screen Shot 2022-03-10 at 21 27 14" src="https://user-images.githubusercontent.com/54956141/157730341-0338e9d9-1ba3-47aa-b3b0-879ba27f797d.png">

Получаю 139ms :) Видимо база слишком мала для такого индекса или я чего-то не так настроил
![image](https://user-images.githubusercontent.com/54956141/157730496-5f29b3d5-cf82-46bf-8ee7-8ead9b9c9a4c.png)

