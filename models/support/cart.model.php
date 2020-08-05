<?php
    require_once 'models/security/product.model.php';
    function getCartTotal(){
        $cart = array();
        $cartTotal = 0;
        if(!empty($_SESSION["cart"])){
            array_splice($_SESSION["cart"],0,0);
            /*Convierte la Informacion de la Session["cart] a los productos de la base */
            foreach($_SESSION["cart"] as $key => $value){
                $cart["items"][]=$_SESSION["cart"][$key]["codProducto"];
                if (strpos($cart["items"][$key], '_') !== false) {
                    $str=$cart["items"][$key];
                    $cart["items"][$key]=explode('_',$str);
                }
            }
            foreach($cart["items"] as $key => $value){
                    $cart["products"][$key]=getProductByCode($cart["items"][$key]);
                    $cart["products"][$key]["cartQuantity"]=$_SESSION["cart"][$key]["cartQuantity"];
                    $cartTotal+=floatval(floatval($cart["products"][$key]["precioProducto"])*floatval($cart["products"][$key]["cartQuantity"]));
            }//Foreach 
        }
        
        return $cartTotal;
    }
    function getCartItems($page=''){
        $cart = array();
        $cartItems= array();
        if(!empty($_SESSION["cart"])){
            array_splice($_SESSION["cart"],0,0);
            /*Convierte la Informacion de la Session["cart] a los productos de la base */
            foreach($_SESSION["cart"] as $key => $value){
                $cart["items"][]=$_SESSION["cart"][$key]["codProducto"];
                if (strpos($cart["items"][$key], '_') !== false) {
                    $str=$cart["items"][$key];
                    $cart["items"][$key]=explode('_',$str);
                }
            }   
            foreach($cart["items"] as $key => $value){
                    $cartItems["products"][$key]=getProductByCode($cart["items"][$key]);
                    $cartItems["products"][$key]["cartQuantity"]=$_SESSION["cart"][$key]["cartQuantity"];
                    $cartItems["products"][$key]["cartCod"]=$_SESSION["cart"][$key]["cartCod"];
                    $cartItems["products"][$key]["variations"]=false;
                    $cartItems["products"][$key]["page"]=$page;
            }//Foreach 
        }
     
        return $cartItems;
    }
    function addCart($codProducto,$cod){
        $array = $codProducto;
        $valid = true;
        $stock = getStock($codProducto);
        removeStock($codProducto,1);
        $stock = getStock($codProducto);
        if($stock["stockProducto"]<0){
            $valid = false;
            addStock($codProducto,1);
            
        }
        if($valid){
            $codeExists = false;
            foreach($_SESSION["cart"] as $key => $value){
                if($_SESSION["cart"][$key]["codProducto"]==$codProducto){
                    $codeExists = true;
                    $cod = $key;
                break;
                }       
            }
            if($codeExists){
                $_SESSION["cart"][$cod]["cartQuantity"]++;
                $_SESSION["cartSize"]++;
            }
            else{
                $size = count($_SESSION["cart"]);
                $_SESSION["cart"][$size+1]["cod"]=$cod;
                $_SESSION["cart"][$size+1]["codProducto"]=$codProducto;
                $_SESSION["cart"][$size+1]["cartQuantity"]=1;
                $_SESSION["cartSize"]++;
                $_SESSION["cart"][$size+1]["cartCod"]=$size+1;
            }
            
            return false;
        }
        return true;
    }
    function plusCart($cartCod,$prdQuantity){
        $valid = true;
        foreach($_SESSION["cart"] as $key => $value){
            if($cartCod == $_SESSION["cart"][$key]["cartCod"]){
                $codProducto = $_SESSION["cart"][$key]["codProducto"];
                break;
            }
        }
        removeStock($codProducto,1);
        $stock = getStock($codProducto);
        if($stock["stockProducto"]<0){
            $valid = false;
            addStock($codProducto,1);
        }
        if($valid){
            foreach($_SESSION["cart"] as $key => $value){
                if($_SESSION["cart"][$key]["cartCod"]==$cartCod){
                    $_SESSION["cart"][$key]["cartQuantity"]++;
                    $_SESSION["cartSize"]++;
                }
            }
            return false;    
        }
        return true;
    }
    function removeCart($cartCod){
        $valid = false;
        foreach($_SESSION["cart"] as $key => $value){
            if($cartCod == $_SESSION["cart"][$key]["cartCod"]){
                $codProducto = $_SESSION["cart"][$key]["codProducto"];
                break;
            }
        }

        $stock = getStock($codProducto);
        $valid = true;
        addStock($codProducto,1);
        if($valid){
            foreach($_SESSION["cart"] as $key => $value){
                if($_SESSION["cart"][$key]["cartCod"]==$cartCod){
                    $_SESSION["cart"][$key]["cartQuantity"]--;
                    $_SESSION["cartSize"]--;
                }
                if($_SESSION["cart"][$key]["cartQuantity"]<=0){
                    unset($_SESSION["cart"][$key]);
                    array_splice($_SESSION["cart"],0,0);
                }
            }
            return false;    
        }
        return true;
    }
    function trashCart($cartCod,$prdQuantity){
        foreach($_SESSION["cart"] as $key => $value){
            if($_SESSION["cart"][$key]["cartCod"]==$cartCod){
                addStock($_SESSION["cart"][$key]["codProducto"],$_SESSION["cart"][$key]["cartQuantity"]);
                $_SESSION["cartSize"]-=$_SESSION["cart"][$key]["cartQuantity"];
                unset($_SESSION["cart"][$key]);
                array_splice($_SESSION["cart"],0,0);
            } 
        }
        
        echo showErrors();
    }
    function resetCart(){
        $products = getCartItems();
        $products=$products["products"];
        foreach($products as $products){                
            addStock($products["codProducto"],1);
        }
        $_SESSION["cartSize"] = 0;
        unset($_SESSION["cart"]);
    }
    function checkCartStock(){
        $products = getCartItems();
        $invalidStock = array();
        $products=$products["products"];
        foreach($products as $products){
            addStock($products["codProducto"],1); 
            $stock = getStock($products["codProducto"]);
            $stock = $stock["stockProducto"];
            if(($stock - 1)<0){
                $invalidStock[] = $products["codProducto"];
            }
            removeStock($products["codProducto"],1);              
        }
        if(!empty($invalidStock)){
            foreach($_SESSION["cart"] as $keyCart => $cart){
                foreach($invalidStock as $invalidStock){
                    if($cart["cod"]==$invalidStock){
                        unset($_SESSION["cart"][$keyCart]);
                        $_SESSION["cartSize"]--;

                    }
                }
            }
            return true;
        }
        return false; 
    }
    
?>