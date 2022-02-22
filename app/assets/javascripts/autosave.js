
$(".input").on('keyup', function() {
	console.log(3)
})

// function saveTODB(){
// 	console.log("save!!")
// 	$.ajax({
// 		  type: "POST",
//       url: "/autosave",    
// 	})
// }


function saveToDB()
{
    console.log('Saving to the db');
    form = $('.contact-form');
		$.ajax({
			url: "/autosave",
			type: "POST",
			data: form.serialize(), // serializes the form's elements.
			success: function(data) {
		
	   		setTimeOut("saveToDB()", 1000)
			},
		});
}