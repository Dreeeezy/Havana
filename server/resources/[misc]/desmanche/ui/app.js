$(document).ready(function(){
	window.addEventListener("message",function(event){
		if (event.data.active == true){
			$("#listagem").html(event.data.listagem).show();
		} else {
			$("#listagem").html("").hide();
		}
	})
});