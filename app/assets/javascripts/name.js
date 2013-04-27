$('.greeting').on('click', function() { 
	if($('.greeting').html() == "Hey there!") {
		$('.greeting').html("Hey dude!"); 
	} else {
		$('.greeting').html("Hey there!");
	}

	 });