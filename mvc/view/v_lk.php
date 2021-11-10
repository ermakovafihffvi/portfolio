<div class="personal_account">
    <h1>About me:</h1>
    <div class="personal_account_info">
        <p>Name: <span><?=$name?></span></p>
        <p>Tel: <span><?=$tel?></span></p>

        <p>Login: <span><?=$login?></span></p>
        <p>Email: <span><?=$email?></span></p>
        
        <p class="adress">Adress: <span><?=$adress?></span></p>
        
    </div>

    <h1>My orders:</h1>
    <?php foreach($orders as $item):?>
        <div class="order_item" onclick="ordercart(<?=$item['no_of_order']?>)" id="<?=$item['no_of_order']?>">
            <p>&#8470;: <span><?=$item['no_of_order']?></span></p>
            <p>date: <span><?=$item['date']?></span></p>
            <p>status: <span><?=$item['status']?></span></p>
        </div>
    <?php endforeach;?>
</div>
<!--<a href="index.php?c=user&act=logout">Exit</a>-->

<script defer src="js/orders.js"></script>
