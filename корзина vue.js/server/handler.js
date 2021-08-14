const cart = require('./cart');
const fs = require('fs');

const handler = (req, res, action, file) => {  //file это файл котрый хотим читать изменять (это server/db/userCart.json см cartRouter)
    fs.readFile(file, 'utf8', (err, data) => {
        if (err) {
            res.send({ result: 0, text: 'error' });
            return;
        }

        let newCart = cart[action](JSON.parse(data), req); //вместо action прилетает update или add - те методы которые ы прописали для cart
        fs.writeFile(file, newCart, (err) => {
            if (err) {
                res.send({ result: 0, text: 'error' });
                return;
            }

            res.send({ result: 1, text: 'error' });
        });
    });
};

module.exports = handler;