var timeoutId;
$('.input').on('input propertychange change', function() {	
  console.log('Textarea Change');
  clearTimeout(timeoutId);
    timeoutId = setTimeout(function() {  
      autoSavePost();
  }, 5000);
});



function autoSavePost(){
  console.log('Saving to the db');

	$.ajax({
		url: "/autosave",
		type: "POST",
		data: $('.input').serialize(),
		success: function(data) {
   		console.log(data);
   		// $(".my-form").submit();
   		// event.preventDefault();
		},
	});
}


