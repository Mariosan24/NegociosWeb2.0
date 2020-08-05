<div class="">

        <div class="">
            <table class="">
                <thead>
                    <th>Codigo</th>
                    <th>IMG URL</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th><a href="index.php?page=Producto&act=INS"></a></th>
                </thead>
                <tbody>
                   {{foreach product}}
                     <tr>
                        <td>{{codProducto}}</td>
                        <td>{{imagenProducto}}</td>
                        <td>{{nombreProducto}}</td>
                        <td>{{precioProducto}}</td>
                        <td>{{stockProducto}}</td>
                        <td>
                           <a href="index.php?page=Producto&act=UPD&cod={{codProducto}}"></a>
                           <a href="index.php?page=Producto&act=DSP&cod={{codProducto}}"></a>
                        </td>
                    </tr>
                   {{endfor product}}
                </tbody>
            </table>
        </div>
    </div>
<script>
  $().ready(function(){
    $("#btnFiltrar").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      document.forms[0].submit();
    });
  });
</script>