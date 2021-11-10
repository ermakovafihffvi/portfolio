<?php 
if($text):?>
<div class="usual_box">
<p><?=$text?></p></div>
<?php else: ?>
<div class="cart_list">
    <div></div> <p>Name</p> <div></div> <p>Number</p> <div></div> <p>Number*Price</p>
    <div class="line"></div>
    <?php foreach($cart_items as $itemId => $infoArr):?>
        <div class="cart_item" id="<?=$infoArr['id']?>">
            
            <img src="data/small/<?=$infoArr['photo']?>" alt="error">
            <p><?=$infoArr['title']?></p>

            <button class="cart_button minus" onclick="minusOne(<?=$infoArr['id']?>, <?=$infoArr['price']?>)">-</button>
            <p class="num<?=$infoArr['id']?>"><?=$infoArr['num']?></p>
            <button class="cart_button plus" onclick="plusOne(<?=$infoArr['id']?>, <?=$infoArr['price']?>)">+</button>
            
            <p class="price_mult_num<?=$infoArr['id']?>"><?=$infoArr['price']*$infoArr['num']?></p>

        </div>
    <?php endforeach; ?>
</div>

<div class="clear_checkout_block">
    <p class="p_sum">Sum:</p>
    <p class="sum_cost"><?=$sumPrice?></p>
    <div class="clear_checkout_buttons">
        <button class="btn clear_cart_btn" onclick="clearCart()">Clear basket</button>
        <a href="index.php?c=cart&act=checkoutPage"><button class="btn checkout_btn">Go to checkout</button></a>
    </div>
</div>

<?php endif;?>

<script defer src="js/cart.js"></script>