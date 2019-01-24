$( document ).ready(function() {
	$("#proceed").removeAttr('href');
	$('input').click(function() {
		updateLink();
	});
});

function updateLink(){
	first = $('input[name=first]:checked').val();
	main = $('input[name=main]:checked').val();
	drink = $('input[name=drink]:checked').val()
	if (typeof first !== 'undefined'
	 && typeof main !== 'undefined'
	 && typeof drink !== 'undefined') {
    	link = '/orders/new/?first=' + first + '&main=' + main + '&drink=' + drink 
    	$("#proceed").attr('href', link);
	}
}
