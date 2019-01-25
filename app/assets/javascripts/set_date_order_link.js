$( document ).ready(function() {
	$('#change_date').click( function(e) {
		e.preventDefault(); 
		if ($('#date').val()!=''){
			location.href = "/orders/?date=" + $('#date').val();	
		}
		else {
			location.href = "/orders/";	
		}
		return false; })
});