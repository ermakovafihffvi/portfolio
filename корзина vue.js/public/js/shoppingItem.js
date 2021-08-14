export const ShoppingItem = {
    props: ['product'],
    emits: ['deleteItem'],
    template: `
    <div class="item">
        <div class="right">
            <img :src="product.img" alt="не отображается" />
           <div class="details">
                <h5>{{product.product_name}}</h5>
                <p>Color:<span>Red</span></p>
                <p>Size:<span>Xll</span></p>
            </div>
        </div>
        <div class="left">
            <p class="unit">&#36{{product.price}}</p>
            <div class="Quan"><input type="text" pattern="[1-5]" v-model="product.quantity"/></div>
            <p class="ship">FREE</p>
            <p class="sub">&#36{{product.price * product.quantity}}</p>
            <i class="fas fa-times-circle act" @click="$emit('deleteItem', product)"></i>
        </div>
    </div>
    `
};