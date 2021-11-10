<div class="enter_page">
    <!--<h3>Enter</h3><br>-->
    <h4><?=$text?></h4>
    <form method="post" action="index.php?c=user&act=enter">
        <p>Login:</p>
        <input name="login" type="text"><br>
        <p>Password:</p>
        <input name="password" type="password"><br>
        <input class="submit" name="submit" type="submit" value="submit">
    </form><br>
    <a href="index.php?c=user&act=signup">Sign up</a>
</div>
