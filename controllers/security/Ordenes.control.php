<?php 
    require_once 'models/orders.model.php';
    function run(){
        $viewData = array();
        if(isset($_GET["page"])){
            $viewData["page"]= $_GET["page"];
        }
        $viewData["cod"] = "";
        $viewData["orders"]=getOrders();
        if(!empty($viewData["orders"])){
            foreach($viewData["orders"] as $key => $value){
                $viewData["orders"][$key]["orderDeliverTime"] = date('d/m/y h:i A',$viewData["orders"][$key]["orderDeliverTime"]);
                $viewData["orders"][$key]["orderMade"] = date('d/m/y h:i A',$viewData["orders"][$key]["orderMade"]);
                $viewData["orders"][$key]["subtotal"] = sprintf('%0.2f',$viewData["orders"][$key]["orderTotal"] -($viewData["orders"][$key]["orderIsv"] + $viewData["orders"][$key]["orderShippingFee"]));
                $viewData["orders"][$key]["orderDetail"] = getDetailOrder($viewData["orders"][$key]["orderCod"]);
            }
        }
        renderizar('security/Ordenes', $viewData);
    }
    run();
?>