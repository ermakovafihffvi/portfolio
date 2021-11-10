<div class="usual_box prod_item">
    <div class="img_block">
        <img src="data/big/<?=$prod_item[0]['photo']?>" alt="error">
    </div>
    <h1><?=$prod_item[0]['title']?></h1>

    <div class="buy_block">
        <p>Price: <span><?=$prod_item[0]['price']?></span></p>
        <button onclick="addItem(<?=$prod_item[0]['id']?>)" class="buy_btn">Buy</button>
    </div>

    <p><?=$prod_item[0]['info']?></p>
</div>

<script defer src="js/cart.js"></script>