<div class="">
            <div class="">
                {{if hasItems}}
                    {{foreach products}}
                    <div class=""> 
                            <img class="" src="{{imagenProducto}}" alt="">
                            <div class="">
                                <h2> {{nombreProducto}} </h2>
                                <form action="index.php?page={{page}}" method="post">
                                    <input type="hidden" name="codProducto" value="{{codProducto}}">
                                    <input type="hidden" name="cartCod" value="{{cartCod}}">
                                    <input type="hidden" name="prdQuantity" value="{{prdQuantity}}">
                                    <p>Cantidad: {{prdQuantity}}</p>
                                    <p>Precio: ${{precioProducto}}</p>
                                    <p class=""><button id="btnLess" name="btnLess" type="submit">-</button>&nbsp;{{cartQuantity}}&nbssp;
                                    <button id="btnAdd" name="btnAdd" type="submit">+</button></p>
                                    <p class=""><button id="btnTrash" name="btnTrash" type="submit">(-)</button></p>
                                </form>
                            </div>
                    </div>
                    {{endfor products}}
                {{endif hasItems}} 

                {{ifnot hasItems}}
                            <div class="">
                                <div class="" style="font-size: 2em;">
                                    <p>No hay nada en carreta</p>
                                </div>
                                
                            </div>
                {{endifnot hasItems}}
            </div>
            {{if hasItems}}
            <div class="">
                <h2>Subtotal:   ${{subtotal}}</h2>
                	&nbsp;
                <div class=""></div>
                &nbsp;
                <form action="index.php?page={{page}}" method="post">
                        <input type="hidden" name="btnPagar">
                        <button class="" id="btnPagar">Pagar</button>
                </form>
            </div>
            {{endif hasItems}}
</div>
<script>
    $().ready(function(){
    $("#btnAdd").click(function(e){
      e.stopPropagation();
    });
  });
</script>