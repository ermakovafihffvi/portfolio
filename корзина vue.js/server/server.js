const express = require('express'); //подключаем express
const fs = require('fs'); //модуль для чтения и записи в базу данных 
const cartRouter = require('./cartRouter');

const app = express(); //создаём приложение на эксперессе

app.use(express.json()); //общий обработчик для преобразования строки json 
app.use('/', express.static('public')); //путь к папке где лежат файлы для пользователя
app.use('/api/cart', cartRouter); //там содержится обработка всех путей для корзиныб внутри cartRouter теперь нужно все пути писать как если бы cartRouter был корневой папкой

app.get('/api/products', (req, res) => {    //запрос который выполняется при переходе по сслыке url, определили путь к каталогу на сервере
    fs.readFile('server/db/myCatalog.json', 'utf8', (err, data) => {   //считывае непосредственно каталог, который содержится в проекте как файл
        if (err) {
            res.send({ result: 0, text: 'error' });
            return;
        }

        res.send(data); //получили данные data из файла products.json (в смыле что строку json)
    })
});

app.listen(3000, () => console.log('Server started....')); 