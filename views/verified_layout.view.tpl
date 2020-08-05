<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>{{page_title}}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.css">
    <link rel="stylesheet" href="public/scss/style.css">
    <script src="public/js/jquery.min.js"></script>
    {{foreach css_ref}}
    <link rel="stylesheet" href="{{uri}}" />
    {{endfor css_ref}}
</head>

<body>
    <header>
        <nav id="menu-barra" class=" ">
            <div class="title col-s-1 col-m-5 col-9 no-margin no-padding">
                <a href="index.php?page=start">
                    <p><img src="public/imgs/logo.png" alt="">&nbsp;Food Service</p>
                </a>
            </div>
            <div class="burger" id="hmb">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <ul class="">
                <li class=""><a href="#slide"></a></li>
            </ul>
            <ul class="">
                <div class="">+</div>
                <li>
                    <p><b> <br>{{userName}}</b></p>
                </li>
                <li><a class="" href="index.php?page=cartL">{{cartItems}}</a></li>
                <li><a class="" href="index.php?page=storeL"><i
                            class="fas fa-prescription-bottle-alt"></i>&nbsp;Medicamentos</a></li>
                {{foreach appmenu}}
                <li><a href="index.php?page={{mdlCod}}">{{mdlDsc}}</a></li>
                {{endfor appmenu}}
                <li class="logout"><a href="index.php?page=logout">Cerrar Sesión</a>
                </li>
            </ul>
        </nav>
    </header>
    <div class="contenido">
        {{{page_content}}}
    </div>

    {{foreach js_ref}}
    <script src="{{uri}}"></script>
    {{endfor js_ref}}
</body>

</html>