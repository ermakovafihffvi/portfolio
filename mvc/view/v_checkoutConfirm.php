<div class="confirm_data">
    <h3>Check and confirm your data:</h3><br>
    <div class="personal_account_info">
        <p>Name: <span><?=$user_info[0]['name']?></span></p>
        <p>Tel: <span><?=$user_info[0]['tel']?></span></p>

        <p>Login: <span><?=$user_info[0]['login']?></span></p>
        <p>Email: <span><?=$user_info[0]['email']?></span></p>
        
        <p class="adress">Adress: <span><?=$adress?></span></p>
        
    </div>
    <a href="index.php?c=cart&act=confirmorder">    
        <button class="confirm_btn">  Confirm order!  </button>
    </a>
</div>
<script defer src="js/cart.js"></script>