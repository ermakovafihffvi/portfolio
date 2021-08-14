export const ProductItem = {
    props: ['product'],
    methods: {
        toSinglePage() {
            window.location = "./SinglePage.html";
        },
    },
    template: `
    <div class="product-item" @click="toSinglePage">

    <div class="image">
        <img :src="product.img" alt=product.product_name />
        <div class="hover_image">
            <div class="hover_box" @click.stop @click="$root.$refs.cartRef.addProduct(product)">
                <div class="addToCart"><img src="img/cart_hover.svg" alt=""><span>Add to Cart</span></div>
            </div>
        </div>
    </div>

    <div class="product-item-text">{{product.product_name}}<br />
        <span>&#36{{product.price}}</span>
    </div>
    </div>
    
    `
};