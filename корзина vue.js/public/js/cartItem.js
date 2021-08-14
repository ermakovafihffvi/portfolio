export const CartItem = {
    props: ['product'],
    emits: ['deleteItem'],
    methods: {
    },
    template: `
    <div class="cartWindow-item">

    <div class="image">
        <img :src="product.img" alt="product.name" />
    </div>

    <div class="cartWindow-item-text">
        <p>{{product.name}}</p><br />
        <span>{{product.quantity}} x &#36{{product.price}}</span>
    </div>
    
    <div class="removebtn">
        <i class="fas fa-times-circle act" @click="$emit('deleteItem', product)"></i>
    </div>
    
    <!--<button @click="$emit('addOne', product)">+</button>
    <button @click="$emit('deleteOne',product)">-</button>-->
    <div class="line"></div>
    
    </div>
    
    `
};