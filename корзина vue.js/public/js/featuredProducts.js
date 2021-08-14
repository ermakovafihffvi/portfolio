import { ProductItem } from "./productItem.js";

export const FeaturedProducts = {
    inject: ['getJson'],
    components: {
        ProductItem
    },
    data() {
        return {
            featuredProducts: [],
        }
    },
    mounted() {
        this.getJson(`/api/products`)
            .then(data => {
                for (let el of data) {
                    if (el.featured) {
                        this.featuredProducts.push(el);
                    }
                }
            });
    },
    template: `
        <div class="products">
                <ProductItem 
                v-for="el of featuredProducts" 
                :key="el.id_product"
                :product="el"
                >
                </ProductItem>
            </div>
    `
};