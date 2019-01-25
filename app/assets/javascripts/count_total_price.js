$( document ).ready(function() {
	$("#order_count").on('input',function(){
    	total_price = total_price = $('#price').text().split(' ')[4] * parseInt($("#order_count").val())
    	if (isNaN(total_price)){
    		total_price = ""
    	}
    	$('#total_price').text("Total price: " + total_price)
});
});