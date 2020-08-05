<div class="">
    <br>

    <div class="">
        <h1>{{mode}}</h1>
    </div>

    <div class="">

        <form class="" action="index.php?page=Producto&act={{act}}&cod={{codProducto}}" method="POST"
            enctype="multipart/form-data">

            <input type="hidden" name="token" id="token" value="{{token}}">
            <input type="hidden" name="codProducto" value="{{codProducto}}">
            <input type="hidden" name="btnConfirmar" value="confirmar">
            <input type="hidden" name="imagenProducto" value="{{imagenProducto}}">

            <div class="">
                <br>
                <label class="" for="imagenProducto">Imagen de Producto</label><br>
                <img class="" src="{{imagenProducto}}" alt="Foto Comida">

                <input class="" type="file" name="imagenProducto" id="imagenProducto"
                    placeholder="Codigo de Producto" value="{{imagenProducto}}" {{readonly}}>
            </div>
            <div class="">
                <br>
                <label class="" for="nombreProducto">Nombre del Medicamento</label><br>
                <input class="" type="text" name="nombreProducto" id="nombreProducto"
                    placeholder="Nombre del Producto" value="{{nombreProducto}}" {{readonly}}>
            </div>
            <div class="">
                <br>
                <label class="" for="precioProducto">Precio del Producto</label><br>
                <input class="" type="text" name="precioProducto" id="precioProducto"
                    placeholder="Precio del Producto" value="{{precioProducto}}" {{readonly}}>
            </div>
            <div class="">
                <br>
                <label class="" for="stockProducto">Stock Disponible</label><br>
                <input class="" type="text" name="stockProducto" id="stockProducto"
                    placeholder="Stock del Producto" value="{{stockProducto}}" {{readonly}}>
            </div>
            <div class="">
                {{ifnot readonly}}<button class="" type="submit" id="btnConfirmar">Confirmar</button>&nbsp;
                {{endifnot readonly}}
                <button class="" type="submit" id="btnCancelar">Cancelar</button>
            </div>
            <br>
        </form>
        {{if hasErrors}}
        <ul>
            {{foreach errors}}
            <li>{{this}}</li>
            {{endofr errors}}
        </ul>
        {{endif hasErrors}}
    </div>
</div>

<script>
    $().ready(function () {
        $("#btnCancelar").click(function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Productos");
        });
        $("#btnConfirmar").click(function (e) {
            e.preventDefault();
            e.stopPropagation();
            document.forms[0].submit();
        });
    });
</script>