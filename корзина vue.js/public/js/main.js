import { FeaturedProducts } from "./featuredProducts.js";
import { Cart } from "./Cart.js";
import { AlsoLike } from "./alsoLike.js";
import { Products } from "./products.js";
import { Error } from "./Error.js";
import { Shopping } from "./shopping.js";
import { BrowseAllProducts } from "./browseAllProducts.js";
import { TotalPrice } from "./totalPrice.js";
import { ForDropDown } from "./forDropDown.js";
import { CatalogList } from "./catalogList.js";

const app = Vue.createApp({
    components: {
        'featured_products': FeaturedProducts, //не забыть в html дописать 
        Cart,
        'also_like': AlsoLike,
        Products,
        Error,
        Shopping,
        'browse-all-products': BrowseAllProducts,
        'total-price': TotalPrice,
        'browse-btn': ForDropDown,
        'categories': CatalogList
    },
    data() {
        return {
            productsInCart: [],
            //sum: 0,
        }
    },
    provide() {
        return {
            getJson: this.getJson,
            postJson: this.postJson,
            putJson: this.putJson,
            deleteJson: this.deleteJson,
            productsInCart: this.productsCart,
            //sum: this.sumPrice
        }
    },
    computed: {
        productsCart() {
            return this.productsInCart;
        },
        /*sumPrice() {
            for (let el of this.productsCart) {
                this.sum = this.sum + (el.quantity * +el.price);
            }
            return this.sum;
        }*/ //почему-то не сработало
    },
    methods: {
        getJson(url) {
            return fetch(url)
                .then(result => result.json())
                //.catch(error => this.$refs.error.setError(error))
        },
        postJson(url, data) {
            return fetch(url, {
                method: 'POST',
                headers: {
                    "Content-Type": "application/json" //будем читать данные в формате json
                },
                body: JSON.stringify(data) //тело запроса кооторое приходит на свер и с которым мы там работаем через req.body
            })
                .then(result => result.json())
                //.catch(error => this.$refs.error.setError(error))
        },
        putJson(url, data) {
            return fetch(url, {
                method: 'PUT',
                headers: {
                    "Content-Type": "application/json" //будем передавать данные в формате json
                },
                body: JSON.stringify(data)
            })
                .then(result => result.json())
                //.catch(error => this.$refs.error.setError(error))
        },
        deleteJson(url, data) {
            return fetch(url, {
                method: 'DELETE',
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            }).then(result => result.json())
        }
    },

});

app.mount('#app');