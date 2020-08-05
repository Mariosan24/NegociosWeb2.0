<?php 
    require_once 'models/support/management.model.php';
    require_once 'models/support/cart.model.php';
    require_once 'models/security/neighborhood.model.php';
    require_once 'models/security/pagos.model.php'; 
    require_once 'models/orders.model.php';
    require_once 'libs/paypal.php';
    require_once "libs/sendmail.php";
    use PayPal\Api\Payment;
    use PayPal\Api\PaymentExecution;
    use PayPal\Api\Transactions;

    function run(){
        $viewData = array();
        $viewData["hasErrors"]=false;
        $viewData["total"]=getCartTotal()+0.99;
        $viewData["total"]= sprintf('%0.2f', $viewData["total"]);
        if(isset($_GET["page"])){
            $viewData["page"]=$_GET["page"];
        }

        $products = getCartItems($viewData["page"]);
        $payment = executePaypal();
        if($payment){
            $viewData["paymentId"] = $payment->getId();
            $viewData["paymentState"] = $payment->getState();
            $viewData["shippingFee"] = $payment->getTransactions()[0]->getAmount()->getDetails()->getShipping();
            $viewData["total"]= $payment->getTransactions()[0]->getAmount()->getTotal();
            $html = makeHtmlReceipt($products["products"], $viewData["shippingFee"], $viewData["total"]);
            sendemail($_SESSION["userEmail"], 'Gracias por tu compra', $html);
            unset($_SESSION["cart"]);
            unset($_SESSION["cartSize"]);
        } else {
            $viewData["hasErrors"]=true;
        }
        mergeFullArrayTo($products,$viewData);
        renderizar('user/Approved', $viewData);
    }
    function executePaypal()
    {
        if (isset($_GET['PayerID'])) {
            $apiContext = getApiContext();

            $paymentId = $_GET['paymentId'];
            $payment = Payment::get($paymentId, $apiContext);

            $execution = new PaymentExecution();
            $execution->setPayerId($_GET['PayerID']);

            try {
                // error_log($payment->toJSON());
                $result = $payment->execute($execution, $apiContext);
                
                error_log($result);
                try {
                    $payment = Payment::get($paymentId, $apiContext);
                } catch (Exception $ex) {
                    error_log($ex);
                    return false;
                }
            } catch (Exception $ex) {
                error_log($ex);
            }
            return $payment;
        } else {
            error_log("Usuario cancelo transacción o no es un a peticio adecuada");
            return false;
        }
    }
    run();
?>