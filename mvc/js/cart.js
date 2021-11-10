function addItem(id) {
    $.ajax({
        url: '../model/Cart.php',
        type: 'POST',
        data: "id="+id,
        error: function(text, error){
            console.log(text + "  " + error);
        },
        success: (answer) => {
            console.log(answer);
            drawNumber(answer);
        }
    });
}

function drawNumber(num){
    let cart_numb = document.querySelector('.cart_numb');
    cart_numb.children[0].innerText = num;
    //cart_numb.classList.add("isnumb");
}

function plusOne(id, priceOne){
    $.ajax({
        url: '../model/Cart.php',
        type: 'POST',
        data: "idPlus="+id,
        error: function(text, error){
            console.log(text + "  " + error);
        },
        success: (answer) => {
            console.log(answer);
            let num = document.querySelector(".num"+id);
            num.innerText = Number(num.innerText) + 1;
            let price = document.querySelector(".price_mult_num"+id);
            price.innerText = Number(Number(num.innerText) * priceOne);
            let sumCost = document.querySelector(".sum_cost");
            sumCost.innerText = Number(sumCost.innerText) + priceOne;
            drawNumber(answer);
        }
    });
}

function minusOne(id, priceOne){
    $.ajax({
        url: '../model/Cart.php',
        type: 'POST',
        data: "idMinus="+id,
        error: function(text, error){
            console.log(text + "  " + error);
        },
        success: (answer) => {
            if(answer == 0){
                document.querySelector('.cart_list').innerHTML = `
                <p>Нет товаров в корзине</p>
                `;
                document.querySelector('.clear_cart_btn').style.display = "none";
            } else {
                let num = document.querySelector(".num"+id);
                if(num.innerText != "1") {
                    num.innerText = Number(num.innerText) - 1;
                    let price = document.querySelector(".price_mult_num"+id);
                    price.innerText = Number(Number(num.innerText) * priceOne);
                    let sumCost = document.querySelector(".sum_cost");
            sumCost.innerText = Number(sumCost.innerText) - priceOne;
                } else {
                    let cart_item = document.getElementById(id);
                    cart_item.style.display = "none";
                }
            }
            drawNumber(answer);
        }
    });
}

function clearCart(){
    $.ajax({
        url: '../model/Cart.php',
        type: 'POST',
        data: "clearCart="+true,
        error: function(text, error){
            console.log(text + "  " + error);
        },
        success: (answer) => {
            console.log(answer);
            document.querySelector('.cart_list').innerHTML = `
            <p>Нет товаров в корзине</p>
            `;
            document.querySelector('.clear_cart_btn').style.display = "none";
            drawNumber(0);
        }
    });
}
