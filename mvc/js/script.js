document.addEventListener("DOMContentLoaded", function (){
    alert("Ready");
    uploadItems(1);
});

function uploadItems(start_id) {
    let limit = 3;
    //start_id = start_id + 1;
    $.ajax({
        url: '../model/module.php',
        type: 'POST',
        data: "start_id="+start_id+"&limit="+limit,
        error: function (req, text, error) {
            console.log(text + "  " + error)
        },
        success: function(answer) {
            console.log(answer);
            htmlInsert(answer);
        }
    });
}


function htmlInsert (jsonArr) {
    let arr =  JSON.parse(jsonArr);
    //console.log(arr.length);
    let box = document.querySelector('.catalog');
    for(let i = 0; i < arr.length; i++){
        let htmlSrt = `
        <a href="#" class="catalog_item">
            <img src="data/small/${arr[i]['photo']}" alt="error">
            <p>Name: <span>${arr[i]['title']}</span></p>
            <p>Price: <span>${arr[i]['price']}</span></p>
        </a>
        `;
        box.insertAdjacentHTML("beforeend", htmlSrt);
        start_id = Number(arr[i].id) + 1;
    }
}