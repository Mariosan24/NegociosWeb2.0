<div class="page-table">
        <br>
        <div class="action-title">
            <h1 class="row col-s-12">Mis Ordenes</h1>
        </div>
        <div class="pagination">
            <ul>
                {{foreach pagination}}
                    <li><a href="index.php?page=Historial&n={{cod}}" class="{{selected}}">{{cod}}</a></li>
                {{endfor pagination}}
            </ul>
        </div>
        <div class="table">
            <table class="col-s-12 no-margin no-padding">
                <thead>
                    <th colspan="4">Descripcion de Orden #{{codFactura}}</th>
                </thead>
                <tbody>
                    {{foreach userOrders}}
                            <tr class="order-detail">
                            <td class="data"> Nombre {{userName}} </td>
                            <td class="data"><b>Telefono<br></b> {{orderCell}} </td>
                            <td class="data"><b>Subtotal<br></b> {{subtotal}} </td>
                            <td class="data"><b>Total<br></b> {{orderTotal}} </td>
                        </tr>
                        {{foreach orderDetail}}
                        <tr class="order-detail">
                            <td class="data"><b>Orden</b></td>
                            <td class="data" ><b>Comida<br></b> {{nombreProducto}} </td>
                            <td class="data"><b>Precio<br></b> {{precioProducto}} </td>
                            <td class="data"><b>x {{cartQuantity}}<br></b></td>
                        </tr>
                        {{endfor orderDetail}}
                    {{endfor userOrders}}                   
                    {{ifnot userOrders}}
                     <tr>
                        <td colspan="6" style="padding: 8em;">No tienes Ordenes Disponibles</td>
                        </td> 
                    </tr>
                    {{endifnot userOrders}}
                    
                </tbody>
            </table>
        </div>
    </div>