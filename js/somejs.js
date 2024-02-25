
function logQtyValue() {
    var qtyValue = document.getElementById('qtyc').value;
    var qtyval1=qtyValueFromPHP;
 

    // Send qtyValue to the server using AJAX
    $.ajax({
        type: 'POST',
        url: 'action.php',
        data: { qtyValue: qtyval1 },
        success: function(response) {
            // Update DOM element or input value with the response
            $('#qtyval1').val(qtyValue); // Assuming qtyval1 is an input field
            alert(qtyval1); // Alert the response from the server
        }
    });

    console.log(qtyValue);
}

function updateQtyValue() {
    var qtyValue = $('#qty').val();
    var prod = document.getElementById("valu").value;
    var url = 'http://localhost/PHP/Urban%20Vogue%20E-Commerce%20(PHP)/product.php?p=' + encodeURIComponent(prod);
    // Send the quantity value to the server using AJAX
    $.ajax({
        type: 'GET',
        url: url,
        data: { qtyValue: qtyValue },
        success: function(response) {
            // Handle success if needed
            // alert(response);
        },
        error: function(xhr, status, error) {
            console.error("Error storing quantity value in session:", error);
        }
    });
}

