<?php 
require_once 'models/security/product.model.php';
     $viewData = array();
    $viewData["states"]=array(
        array("stateCod"=>"ACT", "stateDsc"=>"Activo"),
        array("stateCod"=>"INA", "stateDsc"=>"Inactivo")
    );
    $viewData["act"] = "";
    $viewData["readonly"]="";
    $viewData["updating"]="";
    $viewData["mode"]= "";
    $viewData["token"]="";
    $viewData["hasErros"] = false;
    $viewData["errors"]=array();
    $viewData["modeDsc"] = array("INS"=>"Agregando Nuevo Producto", "UPD"=>"Actualizando Producto", "DSP"=>"Mostrando Producto");

    if(isset($_GET["act"])){
        $viewData["act"] = $_GET["act"];
        $viewData["mode"] = $viewData["modeDsc"][$viewData["act"]];
    }

    switch($viewData["act"]){
        case "INS":
            break;
        case "UPD":
            $viewData["updating"]="updating";
            break;
        case "DSP":
            $viewData["readonly"]="readonly disabled";
            break;
        default:
            redirectWithMessage("El cocinero no encontro tu pedido", "index.php?page=Producto");
    }
    if($_SERVER["REQUEST_METHOD"]=="POST"){
        
        if(isset($_POST["btnConfirmar"])){
            $varBody = array();
            $varBody = $_POST;
            
            mergeFullArrayTo($varBody, $viewData);
            $validated = true;
            if($varBody["token"]!=$_SESSION["productos_token"]){
                error_log("Critical Token Error");
                redirectWithMessage("Parece que algo se quemo en la cocina, vuelve a intentar", "index.php?page=Productos");
            }
            if($validated){
                switch($viewData["act"]){
                    case "INS":
                        $result = "";

                        $errors= array();
                        $file_name = $_FILES['imagenProducto']['name'];
                        $file_size =$_FILES['imagenProducto']['size'];
                        $file_tmp =$_FILES['imagenProducto']['tmp_name'];
                        $file_type=$_FILES['imagenProducto']['type'];
                        $fileExt = pathinfo($_FILES['imagenProducto']['name'], PATHINFO_EXTENSION);
                        $file_upload_to = "public/imgs/";
                        //echo $fileExt;
                        $extensions= array("jpeg","jpg","png");
                        
                        if(in_array($fileExt,$extensions)=== false){
                            $errors[]="extension not allowed, please choose a JPEG or PNG file.";
                        }
                        
                        if($file_size > 2097152){
                            $errors[]='File size must be excately 2 MB';
                        }
                        
                        if(empty($errors)==true){
                            move_uploaded_file($file_tmp,$file_upload_to.$file_name);
                            echo "Success";
                        }else{
                            print_r($errors);
                        }
                    
                        /*
                        $result=newProduct($varBody["imagenProducto"],$varBody["nombreProducto"],$varBody["prdDscEN"],$varBody["precioProducto"],$varBody["prdCategory"],
                        $varBody["stockProducto"],$varBody["prdState"]);*/

                        $result=newProduct($file_upload_to.$file_name,$varBody["nombreProducto"],$varBody["precioProducto"],$varBody["stockProducto"]);

                        if($result){
                            redirectWithMessage("Producto Creado Correctamente","index.php?page=Productos");
                        }else{
                            $viewData["hasErrors"]=true;
                            $viewData["errors"][]="No se pudo crear el Producto";
                        }
                        
                        break;
                    case "UPD":
                        $result = "";
                        if(!empty($_FILES['imagenProducto']['name'])){
                            //echo '<pre>'.print_r($_FILES).'</pre>';
                            $errors= array();
                            $file_name = $_FILES['imagenProducto']['name'];
                            $file_size =$_FILES['imagenProducto']['size'];
                            $file_tmp =$_FILES['imagenProducto']['tmp_name'];
                            $file_type=$_FILES['imagenProducto']['type'];
                            $fileExt = pathinfo($_FILES['imagenProducto']['name'], PATHINFO_EXTENSION);
                            $file_upload_to = "public/imgs/";
                            //echo $fileExt;
                            $extensions= array("jpeg","jpg","png");
                            
                            if(in_array($fileExt,$extensions)=== false){
                                $errors[]="extension not allowed, please choose a JPEG or PNG file.";
                            }
                          
                            if(empty($errors)==true){
                                move_uploaded_file($file_tmp,$file_upload_to.$file_name);
                                echo "Success";
                            }else{
                                print_r($errors);
                            }
                            $result=updateProduct($varBody["codProducto"],$file_upload_to.$file_name,$varBody["nombreProducto"],
                            $varBody["precioProducto"],$varBody["stockProducto"]);
                        }
                        else{
                            $result=updateProduct($varBody["codProducto"],$varBody["imagenProducto"],$varBody["nombreProducto"],
                            $varBody["precioProducto"],$varBody["stockProducto"]);
                        }
                        
                        if($result){
                            redirectWithMessage("Producto Modificado Correctamente","index.php?page=Productos");
                        }else{
                            $viewData["hasErrors"]=true;
                            $viewData["errors"][]="No se pudo modificar el Producto";
                            echo showErrors();
                        }
                        break;
                }
            }
        }
    }
    $viewData["token"] = md5("token_productos".time());
    $_SESSION["productos_token"] = $viewData["token"];

    if(isset($_GET["cod"]) && $viewData["act"]!="INS"){
        $products = array();
        $products = getProductByCode($_GET["cod"]);
        mergeFullArrayTo($products, $viewData);
    }
    renderizar("security/Producto", $viewData);
?>