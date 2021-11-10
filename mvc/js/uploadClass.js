class Upload {
    start_id = 0;
    limit = 3;
    uploadItems() {
        $.ajax({
            url: '../model/module.php',
            type: 'POST',
            data: "start_id="+this.start_id+"&limit="+this.limit,
            error: function (req, text, error) {
                console.log(text + "  " + error)
            },
            success: (answer) => {
                console.log(answer);
                this._htmlInsert(answer);
            }
        });
    }
    _htmlInsert(jsonArr) {
        let arr =  JSON.parse(jsonArr);
        //console.log(arr.length);
        let box = document.querySelector('.catalog');

        if(arr[arr.length - 1] == "end"){
            let button = document.querySelector('.upload');
            button.style.display = "none";
            arr.pop();
        }

        for(let i = 0; i < arr.length; i++){
            let htmlSrt = `
            <div class="catalog_item">
                <img src="data/small/${arr[i]['photo']}" alt="error">
                <p>Name: <span>${arr[i]['title']}</span></p>
                <p>Price: <span>${arr[i]['price']}</span></p>
                <div class="buy_btn_block">
                    <button onclick="addItem(${arr[i]['id']})" class="buy_btn">Buy</button>
                </div>
            </div>
            `;
            box.insertAdjacentHTML("beforeend", htmlSrt);
            this.start_id = Number(arr[i].id) + 1;
        }
    }
}

let a = new Upload();
document.addEventListener("DOMContentLoaded", function (){
    //alert("Ready");
    a.uploadItems();
});

let button = document.querySelector('.upload');
button.addEventListener('click', () => a.uploadItems());