function ordercart(id){  //id = id of the order
    let item = document.getElementById(id);
    console.log(item);
    if(item.classList.contains("marked")){
        item.classList.remove("marked");
        let info_block = document.querySelector("#info_block"+id);
        info_block.classList.add("hide");
        info_block.style.display = "none";
    } else {
        $.ajax({
            url: '../model/Order.php',
            type: 'POST',
            data: "id="+id,
            error: function(text, error){
                console.log(text + "  " + error);
            },
            success: (answer) => {
                console.log(answer);
                
                answer = JSON.parse(answer);
                let el = `<div class="order_item_info" id="info_block${id}">
                            <p>Name</p> <p>Quantity</p>`;
                for(let i = 0; i < answer.length; i++){
                    console.log(answer[i]);
                    el = el + `<p>${answer[i]['title']}</p>
                                <p>${answer[i]['quantity']}</p>`;
                }
                el = el + `</div>`;
                item.insertAdjacentHTML('afterend', el);
                item.classList.add("marked");
            }
        });
    }
}