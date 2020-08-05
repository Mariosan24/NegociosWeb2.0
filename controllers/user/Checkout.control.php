<?php 
    require_once 'models/support/cart.model.php';
    require_once 'models/security/pagos.model.php'; 
    require_once 'models/orders.model.php';
    require_once 'libs/paypal.php';
    require_once "libs/sendmail.php";
    include_once "libs/validadores.php";
function run(){
    $viewData = array();
    $viewData["userCell"] = false;
    $viewData["subtotal"]=getCartTotal();
    $viewData["shipping"] = 0.99;
    $viewData["total"] = $viewData["subtotal"]+$viewData["shipping"];
    $viewData["show"]="hidden";
    $viewData["userCod"] = $_SESSION["userCod"];
    if(!empty($viewData["userHood"])){
        $viewData["show"]="";
    }
    $viewData["payments"]=getActivePayments();

    
    $viewData["total"]= sprintf('%0.2f', $viewData["total"]);
   
    if(isset($_SESSION["userCell"]) && !empty($_SESSION["userCell"])){
        $viewData["userCell"] = $_SESSION["userCell"];
    }


    if(isset($_GET["page"])){
        $viewData["page"]=$_GET["page"];
    }

    $products = getCartItems($viewData["page"]);
    //echo '<pre>'.print_r($products).'</pre>';

    mergeFullArrayTo($products,$viewData);
    
    if($_SERVER["REQUEST_METHOD"]=="POST"){
        
        $varBody = $_POST;
        if(isset($_POST["btnPayment"])){
            
            $validated = true;
            mergeFullArrayTo($varBody, $viewData);
            //echo '<pre>'.print_r($varBody).'</pre>';
            if($varBody["token"]!=$_SESSION["checkout_token"]){
                error_log("Critical Token Error");
                redirectWithMessage("Parece que algo se quemo en la cocina, vuelve a intentar", "index.php?page=Checkout");
            }
            if(!validPhone($varBody["orderCell"])){
                $viewData["cellErr"]="Telefono Invalido";
                $viewData["cErr"]="error";
                $validated=false;
            }
            if(!validDirection($varBody["directStreet"])){
                $viewData["directStreet"] = "";
                $viewData["direErr"]="La dirección es muy corta, intente una mas especifica con mas de 20 caracteres";
                $viewData["dErr"]="error";
                $validated=false;
            }
            if(empty($_SESSION["cart"]) || $_SESSION["cartSize"]==0){
                redirectWithMessage("Parece que tu canasta esta vacia", "index.php?page=cartL");
            }
            if(checkCartStock()){
                redirectWithMessage("Parece que algo en tu canasta ya no se encuentra disponible", "index.php?page=cartL");
            }
            if($validated){
                //Este de Abajo
                $orderDirection = "\Direccion : ".$varBody["directStreet"];
                $result2=newOrder($_SESSION["userCod"],$varBody["orderDeliveryTime"],$varBody["btnPayment"],
                $varBody["orderCell"],$orderDirection,$viewData["shipping"],$viewData["total"],$products["products"]);
                echo showErrors().'<br>';
                //Si se pudo crear la orden prosigue
                if($result2){
                    $_SESSION["userCell"] = $varBody["orderCell"];
                    $payPalReturn=createPaypalTransacction($viewData["products"],$viewData["subtotal"],$viewData["shipping"],$viewData["total"]);
                    //Si todo salio bien paypal y tiene un url redirect
                    if ($payPalReturn) {
                        redirectToUrl($payPalReturn);
                    }
                    //si ni a paypal pudo ir
                    $viewData["returndata"] = $payPalReturn;
                    echo $viewData["returndata"];

                }else{
                    $viewData["hasErrors"]=true;
                    $viewData["errors"][]="No se pudo ordenar";
                }
            }
        }
    }
    $viewData["token"] = md5("checkout_token".time());
    $_SESSION["checkout_token"] = $viewData["token"];
    
    renderizar("user/Checkout",$viewData);
}

run();
?>