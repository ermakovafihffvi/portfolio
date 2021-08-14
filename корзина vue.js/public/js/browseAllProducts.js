export const BrowseAllProducts = {
    methods: {
        browse() {
            window.location = "./catalog.html";
        },
    },
    template: `<button class="button browseAllProducts" @click="browse">
                    Browse All Products
               </button>`
}