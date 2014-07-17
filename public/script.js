// $.get('sinatra/URL', function(result) {alert(result);})

var k = 0;

$('#searchbutton').on('click', function(){
	console.log("Start search");

	$.post('/results', {task: $("#taskText").val()}, function() {
			event.preventDefault();
	});

	$.get('/api/items', function(res) {
		var container = document.getElementById("container");
		for (var i = k; i < res.length; i++) {
			$(container).append('<input type="checkbox" name="task_item" class="checks" value=' + res[i] + '"/>' + res[i] + "<br>");
		console.log(res[i]);
		k++;
		}
	}, "json");
});