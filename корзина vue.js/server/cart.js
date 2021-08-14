const add = (cart, req) => {  //модуль добавления, на вход обект корзины и объект реквеста
    cart.contents.push(req.body); //в корзине есть массив contents И с помощью метода push добавляем то что содежится в реквест бади (там будет объект товара)
    return JSON.stringify(cart, null, 4); //преобразуем к строке json и добавляем форматирование
};

const update = (cart, req) => { //модуль обновления корзины, переметром реквеста передаётя идентификтор, нужно найти товар с таким идентификатором и изменить его количество
    const find = cart.contents.find(el => el.id_product === +req.params.id); // ищем товар с нужным айди +преобразует к числу
    find.quantity += req.body.quantity; //в теле запроса body будет приходить так же количестов товара которое нужно добавить
    return JSON.stringify(cart, null, 4);
};

const remove = (cart, req) => { //удаление одного товара из корзины с данным индексом
    const find = cart.contents.find(el => el.id_product === +req.params.id); // ищем товар с нужным айди +преобразует к числу
    let index = cart.contents.indexOf(find);
    cart.contents.splice(index, 1);
    return JSON.stringify(cart, null, 4);
};

module.exports = {
    add,
    update,
    remove
};