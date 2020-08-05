<div class="">

    <div class="">
        <table class="">
            <thead>
                <th colspan="4">Descripcion de Orden #{{codFactura}}</th>
            </thead>
            <tbody>
                {{foreach orders}}

                <tr class="">
                    <td class=""> {{userName}} </td>
                    <td class=""><b>Telefono<br></b> {{orderCell}} </td>
                    <td class=""><b>Subtotal<br></b> {{subtotal}} </td>
                    <td class=""><b>Total<br></b> {{orderTotal}} </td>
                </tr>
                <tr class="">
                    <td class="" colspan="6"><b>Dirección: <br></b> {{orderDirection}} </td>
                </tr>
                {{foreach orderDetail}}
                <tr class="">
                    <td class=""><b>Orden</b></td>
                    <td class=""><b>Comida<br></b> {{nombreProducto}} </td>
                    <td class=""><b>Precio<br></b> {{precioProducto}} </td>
                    <td class=""><b>x {{cartQuantity}}<br></b></td>
                </tr>
                {{endfor orderDetail}}
                {{endfor orders}}
                {{ifnot orders}}
                <tr>
                    <td colspan="6" style="padding: 8em;">No tienes Ordenes Disponibles</td>
                    </td>
                </tr>
                {{endifnot orders}}

            </tbody>
        </table>
    </div>

</div>