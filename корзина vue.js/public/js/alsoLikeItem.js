export const AlsoLikeItem = {
    props: ['product'],
    template: `
    <div class="also-like-item">
        <a href="#">
            <div class="image">
                <img :src="product.img" alt="product.product_name" />

            </div>

            <div class="text">{{product.product_name}}<br />
                <span>&#36{{product.price}}</span>
            </div>
        </a>
    </div>`
};

/*                <div class="hover_stars">

                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>*/

/*                <div class="hover_image">
                    <div class="hover_box">
                        <a href="#"><img src="img/cart_hover.svg" alt=""/><span>Add to Cart</span></a>
                    </div>
                </div>*/
