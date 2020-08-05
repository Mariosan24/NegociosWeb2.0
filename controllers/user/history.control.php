<?php 
    require_once 'models/orders.model.php';
    
    function run(){
        $viewData = array();
            $viewData["userOrders"]=getUserOrders($_SESSION["userCod"]);
            foreach($viewData["userOrders"] as $key => $value){
                $viewData["userOrders"][$key]["orderDeliverTime"] = date('d/m/y h:i A',$viewData["userOrders"][$key]["orderDeliverTime"]);
                $viewData["userOrders"][$key]["orderMade"] = date('d/m/y h:i A',$viewData["userOrders"][$key]["orderMade"]);
                $viewData["userOrders"][$key]["subtotal"] = sprintf('%0.2f',$viewData["userOrders"][$key]["orderTotal"] -($viewData["userOrders"][$key]["orderIsv"] + $viewData["userOrders"][$key]["orderShippingFee"]));
                $viewData["userOrders"][$key]["orderDetail"] = getDetailOrder($viewData["userOrders"][$key]["orderCod"]);
            }
        
        renderizar('user/history', $viewData);
    }
    run();
?>