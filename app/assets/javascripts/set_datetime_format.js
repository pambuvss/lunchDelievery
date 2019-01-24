$( document ).ready(function() {
		$('#order_delivery_time_1i').parent().contents().filter(function () {
     		return this.nodeType === 3; 
		}).remove();
		$('#order_delivery_time_1i').hide();
		$('#order_delivery_time_2i').hide();
		$('#order_delivery_time_3i').hide();	
});
