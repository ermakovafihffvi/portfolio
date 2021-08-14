export const CatalogList = {
    data() {
        return {
            show: false,
        }
    },
    methods: {

    },
    computed: {
        showList() {
            if (this.show) {
                return {
                    'maxHeight': "600px"
                }
            } else {
                return {
                    'maxHeight': "0px"
                }
            }
        },
        rotate() {
            if (this.show) {
                return {
                    'transform': 'rotate(180deg)'
                }
            } else {
                return {
                    'transform': 'rotate(0deg)'
                }
            }
        }
    },
    template: `
    <div class="block-item">
        <div class="slidebar-title" @click="show=!show">
            <div class="slidebar-title-stick"></div>
            <div class="title" :class="{activeTitle: show}">CATEGORIE</div>
            <div class="slidebar-arrow">
                <!--<i class="fas fa-caret-up" :style="rotate"></i>-->
                <i class="fas fa-caret-down" :style="rotate"></i>
            </div>
        </div>
        <ul class="slidebar-list" :style="showList">
            <li><a class="text" href="#">Accessories</a></li>
            <li><a class="text" href="#">Bags</a></li>
            <li><a class="text" href="#">Denim</a></li>
            <li><a class="text" href="#">Hoodies & Sweatshirts</a></li>
            <li><a class="text" href="#">Jackets & Coats</a></li>
            <li><a class="text" href="#">Pants</a></li>
            <li><a class="text" href="#">Polos</a></li>
            <li><a class="text" href="#">Shirts</a></li>
            <li><a class="text" href="#">Sweaters & Knits</a></li>
            <li><a class="text" href="#">T-Shirts</a></li>
            <li><a class="text" href="#">Tanks</a></li>
        </ul>
    </div>
    `
}