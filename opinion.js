$(document).ready( function() {
	} );

$(document).on( 'click', '#shop', function() {
		var opinion_input = $('#opinion_input').val();
		
		$.ajax({
			method:'POST',
			url: '/opinion2.php',
			data: { name: opinion_input },
			success: function(response) {
				response = JSON.parse(response);
				console.log(response);
				$('#opinions').html(response.message);
			}
		});
	
} );
