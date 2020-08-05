<?php 
    require_once 'models/security/product.model.php';
    require_once 'models/support/cart.model.php';
    function run(){
        $viewData = array();
        $viewData["products"] = getProducts();
        $codeExists = "";
        if(!isset($_SESSION["cart"])){
            $_SESSION["cart"]=array();
        }
        if(isset($_GET["page"])){
            $viewData["page"]=$_GET["page"];
        }
        if($_SERVER["REQUEST_METHOD"]=="POST"){
            $varBody = $_POST;
            if(isset($_POST["btnCart"])){
                if(addCart($varBody["radio"],$varBody["codProducto"])){ // Aqui tenes que poner la llave de tu producto
                    redirectWithMessage("Lo que ordenaste ya no se encuentra disponible", "index.php?page=".$viewData["page"]);
                }
                echo $viewData["page"];
                //redirectToUrl("index.php?page=".$viewData["page"]);
            }//btnCart   
            if(isset($_POST["btnCheckout"])){
                resetCart();
                if(addCart($varBody["radio"],$varBody["codProducto"])){// Aqui tenes que poner la llave de tu producto
                    redirectWithMessage("Lo que ordenaste ya no se encuentra disponible", "index.php?page=".$viewData["page"]);
                }
                redirectToUrl("index.php?page=Checkout");     
            }//btnCheckout    
        }
        
        renderizar("store",$viewData);    
    }
    
    run();

?>