<!--<p> <?php /*echo $text; */?></p><br> -->
<!--<a href="index.php?c=user&act=enterPage">Sing in/up</a>-->
<div class="banner">
    <img src="data\banner\DSC02409.JPG">
</div>
<h3 class="pop">Popular</h3>
<div class="popular">
    <?php 
        foreach($popular as $item):?>
            <a href="index.php?c=page&act=showItem&id=<?=$item['id']?>"><div class="popular_item">
                <img src="data/small/<?=$item['photo']?>" alt="error">
                <p>Name: <span><?=$item['title']?></span></p>
                <p>Price: <span><?=$item['price']?></span></p>
                <div class="buy_btn_block">
                    <button onclick="addItem(<?=$item['id']?>)" class="buy_btn">Buy</button>
                </div>
            </div></a>
    <?php endforeach;?>
</div>

<script defer src="js/cart.js"></script>