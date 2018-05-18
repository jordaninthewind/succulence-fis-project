// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var gardens = "This has access to gardens."
const gardenInputs = 0;

document.addEventListener("DOMContentLoaded", function(event) { 
  attachListeners();
});


function attachListeners() {
	addGardenInput();
}

function addGardenInput() {
	$("#new-garden").on("click", function(e) {
		e.preventDefault();
		if (gardenInputs === 0){
			$("#new-garden").append("<br><input type='text' id='garden-name'><button onclick='createGarden()'>Add Garden</button>");
			gardenInputs++;
		}
	});
}

function createGarden() {
	const gardenName = $("#garden-name").val();
	if (gardenName) {
		$.ajax({
 		   url: '/gardens',
		   type: 'POST',
		   data: {'name': gardenName}
		});
 
	} else {
		console.log("You got it wrong.");
	}
}

function getGardens() {
	$.get('/gardens.json', function(res) {
		$("#garden_plants").empty();
		res.forEach((garden) => {
			var html = `<li><a href='/gardens/${garden.id}'>${garden.name}</a> - ${garden.garden_plants.length} Plants in Garden</li>`
			$("#garden_plants").append(html);
		});
	});

// 	gardens.forEach((garden) => {
// 	var html = `<li><a href='/gardens/${garden.id}'>${garden.name}<\a><\li>`;
// 	$("ul").append(html);
// });
}