<?php

    require_once("vendor/autoload.php");
                            
    use Razorpay\Api\Api;

    $key_id = "rzp_test_61f92xYr6yY19d";
    $secret = "nHm4CcqRkLYbvqMQCyHzlV0B";

    $api = new Api($key_id, $secret);

    $data = $api->order->create([
        'receipt' => '123', 
        'amount' => 100, 
        'currency' => 'INR', 
        'notes'=> [
            'key1'=> 'value3',
            'key2'=> 'value2'
        ]
    ]);

    $order_id = $data["id"];

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "<?php echo($key_id); ?>", // Enter the Key ID generated from the Dashboard
    "amount": "100", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "Acme Corp", //your business name
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
    "order_id": "<?php echo($order_id) ?>", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "callback_url": "https://eneqd3r9zrjok.x.pipedream.net/",
    "prefill": { //We recommend using the prefill parameter to auto-fill customer's contact information especially their phone number
        "name": "Gaurav Kumar", //your customer's name
        "email": "gaurav.kumar@example.com",
        "contact": "9000090000" //Provide the customer's phone number for better conversion rates 
    },
    "notes": {
        "address": "Razorpay Corporate Office"
    },
    
};
var rzp1 = new Razorpay(options);
// document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
// }
</script>
</body>
</html>