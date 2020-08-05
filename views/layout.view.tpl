<!DOCTYPE html>
    <html>
        <head>
            <title>{{page_title}}</title>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.css">
            <link rel="stylesheet" href="public/scss/style.css">
            <script src="public/js/jquery.min.js"></script>
        </head>
<body>
     <header>
        <nav id="menu-barra" class=" ">
            <div class="">
                <a href="index.php?page=home">
                    <p>Titulo</p>
                </a>
            </div>
            <div class="burger" id="hmb">
                <div></div>
                <div></div>
                <div></div>
            </div>     
            <ul class="">
                <li><a class="" href="index.php?page=store">Menu</a></li>
                <li><a class="" href="index.php?page=cart">+{{cartItems}}</a></li>
                <li class=""><a href="index.php?page=login">Registrate</a></li>
            </ul>
        </nav>
    </header>
            <div class="">
                {{{page_content}}}
            </div>

            <!--<div class="footer">
                Derechos Reservados 2018
            </div>!-->
            {{foreach js_ref}}
                <script src="{{uri}}"></script>
            {{endfor js_ref}}
        
</body>
</html>
