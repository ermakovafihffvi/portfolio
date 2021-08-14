import { AlsoLikeItem } from "./alsoLikeItem.js";

export const AlsoLike = {
    inject: ['getJson'],
    components: {
        AlsoLikeItem
    },
    data() {
        return {
            alsoLikeProducts: [],
        }
    },
    mounted() {
        this.getJson(`/api/products`)
            .then(data => {
                for (let el of data) {
                    if (el.also_like) {
                        this.alsoLikeProducts.push(el);
                    }
                }
            });
    },
    template: `
        <div class="products">
                <AlsoLikeItem 
                v-for="el of alsoLikeProducts" 
                :key="el.id_product"
                :product="el"
                >
                </AlsoLikeItem>
            </div>
    `
};