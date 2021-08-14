import { ShoppingItem } from "./shoppingItem.js";

export const Shopping = {
    inject: ['getJson', 'postJson', 'putJson', 'deleteJson','productsInCart'],
    components: {
        ShoppingItem,
    },
    data() {
        return {
            //productsInCart: [],
        }
    },
    methods: {
        goToCheckout() {
            window.location = "./Chekout.html";
        },
        goToCatalog() {
            window.location = "./catalog.html";
        },
        clear() {
            while (this.productsInCart.length !== 0) {//потому что без этого костыля, не удаляется последний товар почему-то
                for (let product of this.productsInCart) {
                    let index = this.productsInCart.indexOf(product);
                    this.deleteJson(`/api/cart/${product.id_product}`, product)
                        .then(data => { //передаём на сервер
                            if (data.result) { //если сервер ответил положительно
                                this.productsInCart.splice(index, 1); //удалить из локального массива товар
                            }
                        })
                }
            }
            //console.log(this.productsInCart);
        },
    },
    computed: {
        sumPrice() {
            let s = 0;
            for (let el of this.productsInCart) {
                s = s + (el.quantity * +el.price);
            }
            return s;
        }
    },
    /*mounted() {
        this.getJson(`/api/cart`)
            .then(data => {
                for (let el of data.contents) {
                    this.productsInCart.push(el);
                };
                console.log(this.productsInCart);
            });
    },*/
    template: `
        <div class="container main">
                <div class="cart">
                    <div class="head">
                        <div class="right"><h4>Product Details</h4></div>
                        <div class="left">
                            <h4 class="unit">unite Price</h4>
                            <h4 class="Quan">Quantity</h4>
                            <h4 class="ship">shipping</h4>
                            <h4 class="sub">Subtotal</h4>
                            <h4 class="act">ACTION</h4>
                        </div>
                    </div>

                    <ShoppingItem 
                        v-for="el of productsInCart" 
                        :key="el.id_product"
                        :product="el"
                        @deleteItem = "$root.$refs.cartRef.deleteItem"
                    >
                    </ShoppingItem>
         
                </div>

                <div class="buttons">
                    <button class="clear" @click="clear">CLEAR SHOPPING CART</button>
                    <button class="continue" @click="goToCatalog">CONTINUE SHOPPING</button>
                </div>
        </div>
    `
};