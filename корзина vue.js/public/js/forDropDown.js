export const ForDropDown = {
    data() {
        return {
            show: false,
        }
    },
    methods: {

    },
    computed: {
        showMenu() {
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
        <button class="Browse">
             Browse
             <i class="fas fa-caret-down" @click="show=!show" :style="rotate"></i>
             <div class="drop_down_menu" :style="showMenu">
                 <ul class="drop_down_list" :style="showList">
                     <li><a href="#">WOMEN</a></li>
                     <li><a href="#">Dresses</a></li>
                     <li><a href="#">Tops</a></li>
                     <li><a href="#">Sweaters/Knits</a></li>
                     <li><a href="#">Jackets/Coats</a></li>
                     <li><a href="#">Blazers</a></li>
                     <li><a href="#">Denim</a></li>
                     <li><a href="#">Leggins/Pants</a></li>
                     <li><a href="#">Skirts/Shorts</a></li>
                     <li><a href="#">Accessories</a></li>
                 </ul>
                 <ul class="drop_down_list" :style="showList">
                     <li><a href="#">MEN</a></li>
                     <li><a href="#">Tees/Tank tops</a></li>
                     <li><a href="#">Shirts/Polos</a></li>
                     <li><a href="#">Sweaters</a></li>
                     <li><a href="#">Sweatshirts/Hoodies</a></li>
                     <li><a href="#">Blazers</a></li>
                     <li><a href="#">Jackets/vests</a></li>
                 </ul>
             </div>
         </button>
    `
}