<?php
    require_once 'models/security/product.model.php';
    $viewData["error"] = "";
    $viewData["product"] =getProducts();
    echo showErrors();
    renderizar("security/Productos", $viewData);
?>