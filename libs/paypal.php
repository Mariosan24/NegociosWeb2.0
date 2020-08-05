<?php
require_once 'vendor/libPaypal/autoload.php';

function getApiContext()
{
    $apiContext = new \PayPal\Rest\ApiContext(
        new \PayPal\Auth\OAuthTokenCredential(
            ' aqui va tu otra llave',     // ClientID
            'AQUI VA TU LLAVE'      // ClientSecret
        )
    );
    return $apiContext;
}
function createPaypalTransacction($products, $subtotal,$shipping,$total)
{
    $apiContext = getApiContext();
    $payer = new \PayPal\Api\Payer();
    $payer->setPaymentMethod('paypal');

    $items = new \PayPal\Api\ItemList();
    foreach ($products as $products) {
        $item = new \PayPal\Api\Item();
        $item->setSku($products["codProducto"]);
        $item->setName($products["nombreProducto"]);
        $item->setQuantity($products["cartQuantity"]);
        $item->setPrice($products["precioProducto"]);
        $item->setCurrency('USD');
        $items->addItem($item);
    }
    $details = new \PayPal\Api\Details();
    $details->setSubtotal($subtotal);
    $details->setShipping($shipping);

    $amount = new \PayPal\Api\Amount();
    $amount->setDetails($details);
    $amount->setTotal(strval($total));
    $amount->setCurrency('USD');

    $transaction = new \PayPal\Api\Transaction();
    $transaction->setAmount($amount);
    $transaction->setNoteToPayee("Venta de comida de la empresa foodService");
    $transaction->setItemList($items);

    $redirectUrls = new \PayPal\Api\RedirectUrls();

    $redirectUrls
        ->setReturnUrl("http://localhost/nw/foodService/index.php?page=Approved")
        ->setCancelUrl("http://localhost/nw/foodService/index.php?page=Canceled");

    $payment = new \PayPal\Api\Payment();
    $payment->setIntent('sale')
        ->setPayer($payer)
        ->setTransactions(array($transaction))
        ->setRedirectUrls($redirectUrls);

    try {
        $payment->create($apiContext);
        $_SESSION["paypalTrans"] = $payment;
        return $payment->getApprovalLink();
    } catch (\PayPal\Exception\PayPalConnectionException $ex) {
        // This will print the detailed information on the exception.
        //REALLY HELPFUL FOR DEBUGGING
        error_log($ex->getData());
        return false;
    }
}

?>
