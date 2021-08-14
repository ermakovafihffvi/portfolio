export const TotalPrice = {
    inject: ['productsInCart'],
    methods: {
        goToCheckout() {
            window.location = "./Chekout.html";
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
    template: `
        <fieldset class="total">
            <div>
                <p class="p1">Sub total<span>&#36{{ sumPrice }}</span></p><br />
                <p class="p2">GRAND TOTAL<span>&#36{{ sumPrice }}</span></p>
            </div>
            <button class="proceed" @click="goToCheckout">proceed to checkout</button>
        </fieldset>
    `
}