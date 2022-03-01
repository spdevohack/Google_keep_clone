var timeoutId;
$('.input').on('input propertychange change', function() {	
  console.log('Textarea Change');
  clearTimeout(timeoutId);	
    timeoutId = setTimeout(function() {  
      autoSavePost();
  }, 1000);
});



var notebookId = document.querySelector('#notebook_id');
function autoSavePost(){
  console.log('Saving to the db');
  if (notebookId.value == ''){
		$.ajax({
			url: "/create",
			type: "POST",
			data: $('.input').serialize(),
			success: function(data) {
				notebookId.value = data
	   		console.log('create');
	   	
			},
		});
  }
  else{
  	$.ajax({
			url: "/update",
			type: "POST",
			data: $('.input').serialize(),
			success: function(data) {
	   		console.log('success');
			},
		});
  }
}


