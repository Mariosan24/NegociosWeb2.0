<?php

require_once 'libs/dao.php';


function getProducts()
{
    $product = array();
    $sqlStr = "SELECT * FROM `producto`;";
    $product = obtenerRegistros($sqlStr);
    return $product;
}
function getProductByCode($codProducto){
    $sqlStr = "SELECT * FROM `producto` where `codProducto` = '%s';";
    $products = array();
    $products = obtenerUnRegistro(sprintf($sqlStr, $codProducto));
    return $products;
}
function newProduct($imagenProducto,$nombreProducto,$precioProducto,$stockProducto){
    $sqlIns = "INSERT INTO `producto` (`imagenProducto`,`nombreProducto`,`precioProducto`,`stockProducto`)
     VALUES ('%s','%s',%f,%d);";
     $result = ejecutarNonQuery(sprintf($sqlIns,$imagenProducto,$nombreProducto,$precioProducto,$stockProducto));
     echo showErrors();
     if($result)
        
        return TRUE;
    else
        return FALSE;
}
function updateProduct($codProducto,$imagenProducto,$nombreProducto,$precioProducto,$stockProducto){
    $sqlUpd = "UPDATE `producto` SET `imagenProducto`='%s',`nombreProducto` = '%s' ,`precioProducto`= %f,
    `stockProducto`=%d WHERE (`codProducto` = '%s');";
    $result = ejecutarNonQuery(sprintf($sqlUpd,$imagenProducto,$nombreProducto,$precioProducto,$stockProducto,$codProducto));
    return ($result > 0);
}
function getStock($codProducto){
    $sqlStr = "SELECT `stockProducto` FROM `producto` WHERE codProducto = %d; ";
    $stockInfo = obtenerUnRegistro(sprintf($sqlStr,$codProducto));
    return $stockInfo;
}

function removeStock($codProducto,$prdQuantity){
    $sqlUpd = "UPDATE `producto` SET `stockProducto` = `stockProducto` - %d WHERE `codProducto` = %d; ";
    $result = ejecutarNonQuery(sprintf($sqlUpd,intval($prdQuantity),intval($codProducto)));
    return ($result > 0);
}
function addStock($codProducto,$prdQuantity){
    $sqlUpd = "UPDATE `producto` SET `stockProducto` = `stockProducto` + %d WHERE `codProducto` = %d; ";
    $result = ejecutarNonQuery(sprintf($sqlUpd,intval($prdQuantity),intval($codProducto)));
    return ($result > 0);
}

?>
