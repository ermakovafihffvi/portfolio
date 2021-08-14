const express = require('express');
const handler = require('./handler');
const fs = require('fs');

const router = express.Router();

router.get('/', (req, res) => {  // получаем из файлика корзины информацио о товарах которые есть в корзине
    fs.readFile('server/db/userCart.json', 'utf8', (err, data) => {
        if (err) {
            res.send({ result: 0, text: 'error' });
            return;
        }

        res.send(data);
    })
});

router.post('/', (req, res) => {  // дописываем в фал json товар если его там ещё нет , тут было вместо '/' - '/api/cart'
    handler(req, res, 'add', 'server/db/userCart.json');
});

router.put('/:id', (req, res) => { // обновляем из файл json если такой товар уже есть
    handler(req, res, 'update', 'server/db/userCart.json');
});

router.delete('/:id', (req, res) => { //удаляем из файла json
    handler(req, res, 'remove', 'server/db/userCart.json');
});

module.exports = router;