$(function () {
	$("#user-search-field").on("keyup",function(){
		var input = $("#user-search-field").val()
		console.log(input);
		url = location.href
		$.ajax({
			type: "GET",
			url: url,
    		dataType: "json",
    		data:{keyword: input}
		})
		.done(function(data){
			console.log(data);
		})
	})
});