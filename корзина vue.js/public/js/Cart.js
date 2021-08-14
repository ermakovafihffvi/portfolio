import { CartItem } from "./cartItem.js";

export const Cart = {
    inject: ['getJson', 'postJson', 'putJson', 'deleteJson',
        'productsInCart'],
    components: {
        CartItem,
    },
    data() {
        return {
            isVisibleCart: false,
            //productsInCart: [],
        }
    },
    methods: {
        /*addProduct(product) {
            //let productToCart = { name: product.product_name, img: product.img, id: product.id_product, price: product.price, count: 1 };
            let findProduct = this.productsInCart.find(el => el.id_product === product.id_product);
            if (findProduct) {
                this.putJson(`/api/cart/${find.id_product}`, { count: 1 })
                    .then(data => {
                        if (data.result) {
                            findProduct.count++;
                        }
                    });
            } else {
                let productToCart = Object.assign({ count: 1 }, product);
                console.log(productToCart);
                this.postJson(`/api/cart`, productToCart)
                    .then(data => {
                        if (data.result) {
                            this.productsInCart.push(productToCart);
                        }
                    });
            }
            console.log(this.productsInCart);
        },*/
        addProduct(product) {
            let find = this.productsInCart.find(el => el.id_product === product.id_product); //сначала ищем товар в корзине и получаем есть он уже или нет
            if (find) {  //если товар уже есть
                this.putJson(`/api/cart/${find.id_product}`, { quantity: 1 })  //обновляем  количество товаров
                    .then(data => { //передаём на сервер
                        if (data.result) { //если сервер ответил положительно
                            find.quantity++ //мы тоже увеличиваем количество товаров на единичку у себя в массивах чтобы отображать на страницу
                        }
                    });
                return //ето чтобы елс не писать
            }

            const prod = Object.assign({ quantity: 1 }, product); //если объект найден не было, то создаём копию объекта товара

            this.postJson(`/api/cart`, prod) //делаем пост запрос в который закидываем копию объекта товара корзины
                .then(data => {
                    if (data.result) {
                        this.productsInCart.push(prod);
                    }
                });
        },
        /*deleteOne(product) {
            if (product.count === 1) {
                this.deleteItem(product);
            } else {
                product.count--;
            }
        },
        addOne(product) {
            product.count++;
        },*/
        deleteItem(product) {
            console.log(this.productsInCart);
            let currentProduct = this.productsInCart.find(el => el.id_product === product.id_product);
            let index = this.productsInCart.indexOf(currentProduct);
            if (currentProduct.quantity === 1) {
                this.deleteJson(`/api/cart/${currentProduct.id_product}`, currentProduct)
                    .then(data => { //передаём на сервер
                        if (data.result) { //если сервер ответил положительно
                            this.productsInCart.splice(index, 1); //удалить из локального массива товар
                        }
                    });
            } else {
                this.putJson(`/api/cart/${currentProduct.id_product}`, { quantity: -1 })  //обновляем  количество товаров
                    .then(data => { //передаём на сервер
                        if (data.result) { //если сервер ответил положительно
                            currentProduct.quantity--; //мы тоже увеличиваем количество товаров на единичку у себя в массивах чтобы отображать на страницу
                        }
                    });
            }
        },
        /*clear() { //скорее всего не рабочий вариант, но тут и не надо
            for (let product of this.productsInCart) {
                this.deleteJson(`/api/cart/${product.id_product}`, product);
            };
            this.productsInCart = [];
        },*/
        goToCart() {
            window.location = "./shopping.html";
        },
        goToCheckout() {
            window.location = "./Chekout.html";
        },
    },
    computed: {
        sumPrice() {
            let s = 0;
            for ( let el of this.productsInCart) {
                s = s + (el.quantity * +el.price);
            }
            return s;
        }
    },
   mounted() {
        this.getJson(`/api/cart`)
            .then(data => {
                for (let el of data.contents) {
                    this.productsInCart.push(el);
                }
            });
    },
    template: `
        <div class="buy" @click="isVisibleCart = !isVisibleCart">
                    <svg class="icon icon-shopping-cart"><use xlink:href="#icon-shopping-cart"></use>
                        <defs>
                            <symbol id="icon-shopping-cart" viewBox="0 0 24 24">
                                <path d="M20.756 5.345c-0.191-0.219-0.466-0.345-0.756-0.345h-13.819l-0.195-1.164c-0.080-0.482-0.497-0.836-0.986-0.836h-2.25c-0.553 0-1 0.447-1 1s0.447 1 1 1h1.403l1.86 11.164c0.008 0.045 0.031 0.082 0.045 0.124 0.016 0.053 0.029 0.103 0.054 0.151 0.032 0.066 0.075 0.122 0.12 0.179 0.031 0.039 0.059 0.078 0.095 0.112 0.058 0.054 0.125 0.092 0.193 0.13 0.038 0.021 0.071 0.049 0.112 0.065 0.116 0.047 0.238 0.075 0.367 0.075 0.001 0 11.001 0 11.001 0 0.553 0 1-0.447 1-1s-0.447-1-1-1h-10.153l-0.166-1h11.319c0.498 0 0.92-0.366 0.99-0.858l1-7c0.041-0.288-0.045-0.579-0.234-0.797zM18.847 7l-0.285 2h-3.562v-2h3.847zM14 7v2h-3v-2h3zM14 10v2h-3v-2h3zM10 7v2h-3c-0.053 0-0.101 0.015-0.148 0.030l-0.338-2.030h3.486zM7.014 10h2.986v2h-2.653l-0.333-2zM15 12v-2h3.418l-0.285 2h-3.133z"></path>
                                <path d="M10 19.5c0 0.828-0.672 1.5-1.5 1.5s-1.5-0.672-1.5-1.5c0-0.828 0.672-1.5 1.5-1.5s1.5 0.672 1.5 1.5z"></path>
                                <path d="M19 19.5c0 0.828-0.672 1.5-1.5 1.5s-1.5-0.672-1.5-1.5c0-0.828 0.672-1.5 1.5-1.5s1.5 0.672 1.5 1.5z"></path>
                            </symbol>
                        </defs>
                    </svg>
            <div class="cartWindow" @click.stop :class="{visible: isVisibleCart, invisible: !isVisibleCart}">
                <CartItem 
                    v-for="el of productsInCart" 
                    :key="el.id_product"
                    :product="el"
                    @deleteItem = "deleteItem"
                >
                </CartItem>

                <div v-if="productsInCart.length" class="total">
                    <p>TOTAL</p><p>&#36{{ sumPrice }}</p>
                </div>
                
                <button v-if="productsInCart.length" class="goToCheckout" @click="goToCheckout">CHECKOUT</button>
                <button v-if="productsInCart.length" class="goToCart" @click="goToCart">GO TO CART</button>
                <p class="emptyCart" v-else>Cart is empty</p>
            </div>
        </div>

    `
}