<div class="sign_up_page">
<h3><?=$text?></h3>
<form class="form_sign_up" method="post" action="index.php?c=user&act=signup">
	<p>Введите свё имя:</p>
	<input name="name" type="text">
	<p>Введите логин</p>
	<input name="login" type="text">
	<p>Введите пароль</p>
	<input name="pass" type="password">
	<p>Введите телефон</p>
	<input name="tel" type="tel">
	<p>Введите email</p>
	<input name="email" type="email">
	<p>Введите адрес</p>
	<input name="adress" type="text">
	<input  class="submit" type="submit" name="submit" value="submit">
</form>
<a href="index.php?c=user&act=enterPage">Sign in</a>
</div>
<!--<a href="index.php?c=user&act=checkoutPage">//$return_to_checkout//</a>-->