import {ProductItem} from "./productItem.js";

export const Products = {
    //inject: ['API', 'getJson'],
    inject: ['getJson'],
    components: {
        ProductItem
    },
    data() {
        return {
            products: [],
        }
    },
    mounted() {
        this.getJson(`/api/products`)
            .then(data => {
                for (let el of data) {
                    if (!el.also_like) {
                        this.products.push(el);
                    }
                }
            });
    },
    template: `
        <div class="products">
                <ProductItem 
                v-for="el of products" 
                :key="el.id_product"
                :product="el"
                >
                </ProductItem>
            </div>
    `
};