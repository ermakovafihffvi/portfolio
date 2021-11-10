<!DOCTYPE html>
<html>
    <head>
        <title><?=$title?></title>
        <link rel="stylesheet" type="text/css" href="view/styles/style.css">
        <script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://i.icomoon.io/public/temp/4cb6920ffd/UntitledProject/style-svg.css">
        <script defer src="https://i.icomoon.io/public/temp/4cb6920ffd/UntitledProject/svgxuse.js"></script>
    </head>
    <body>
        <div id="content_max">
            <div id="header">
                <h1>Name of the shop</h1>
                <?php
                if ($user):?>
                    <div>
                    <a class="main_a" href="index.php?c=user&act=enter">My lk</a>
                    <p>///</p>
                    <a class="main_a" href="index.php?c=user&act=logout">Exit</a>
                    </div>
                <?php else: ?>
                    <a class="main_a" href="index.php?c=user&act=enterPage">Sing in/up</a>
                <?php endif; ?>
                <a class="main_a" href="index.php?c=cart&act=showCart">
                    <svg class="cart_i icon-shopping-cart">
                    <use xlink:href="#icon-shopping-cart"></use>
                    <symbol id="icon-shopping-cart" viewBox="0 0 24 24">
                        <path d="M20.756 5.345c-0.191-0.219-0.466-0.345-0.756-0.345h-13.819l-0.195-1.164c-0.080-0.482-0.497-0.836-0.986-0.836h-2.25c-0.553 0-1 0.447-1 1s0.447 1 1 1h1.403l1.86 11.164c0.008 0.045 0.031 0.082 0.045 0.124 0.016 0.053 0.029 0.103 0.054 0.151 0.032 0.066 0.075 0.122 0.12 0.179 0.031 0.039 0.059 0.078 0.095 0.112 0.058 0.054 0.125 0.092 0.193 0.13 0.038 0.021 0.071 0.049 0.112 0.065 0.116 0.047 0.238 0.075 0.367 0.075 0.001 0 11.001 0 11.001 0 0.553 0 1-0.447 1-1s-0.447-1-1-1h-10.153l-0.166-1h11.319c0.498 0 0.92-0.366 0.99-0.858l1-7c0.041-0.288-0.045-0.579-0.234-0.797zM18.847 7l-0.285 2h-3.562v-2h3.847zM14 7v2h-3v-2h3zM14 10v2h-3v-2h3zM10 7v2h-3c-0.053 0-0.101 0.015-0.148 0.030l-0.338-2.030h3.486zM7.014 10h2.986v2h-2.653l-0.333-2zM15 12v-2h3.418l-0.285 2h-3.133z"></path>
                        <path d="M10 19.5c0 0.828-0.672 1.5-1.5 1.5s-1.5-0.672-1.5-1.5c0-0.828 0.672-1.5 1.5-1.5s1.5 0.672 1.5 1.5z"></path>
                        <path d="M19 19.5c0 0.828-0.672 1.5-1.5 1.5s-1.5-0.672-1.5-1.5c0-0.828 0.672-1.5 1.5-1.5s1.5 0.672 1.5 1.5z"></path>
                    </symbol>
                    </svg>
                </a>
                <div class="cart_numb isnumb">
                    <p><?=$numer_cart_items?></p>
                </div>
            </div>
            
            <div id="menu" class="menu container">
                <a class="main_a menu_item" href="index.php">Main Page</a>
                <a class="main_a menu_item" href="index.php?c=page&act=showCatalog">Catalog</a>
                <input class="search_field" type="text" value="search">
                <!--<div class="search_btn">-->
                <a href="#">
                    <svg class="search_i icon-search"><use xlink:href="#icon-search"></use></svg>
                </a>
                <!--</div>-->
            </div>
            
            <div id="content" class="container">
                <?=$content?>
            </div>
        </div>

        <div id="footer" class="footer container">
            <p><?= date('j M Y') ?></p>
            <a class="main_a" href="index.php">About Us</a>
        </div>   
    </body>
</html>