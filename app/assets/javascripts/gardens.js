// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("DOMContentLoaded", function(event) { 
  attachListeners();
});

var gardenInputs = 0;

function attachListeners() {
	addGardenInput();
}

function addGardenInput() {
	$("#newGarden").on("click", function(e) {
		e.preventDefault();
		if (gardenInputs === 0){
			$("#newGarden").append("<form action='/gardens' id='garden_name' name='garden'><input type='text' id='name' onsubmit='newGardenSubmit(event)'><button onclick='newGardenSubmit(event)'>Make Garden</input></form>");
			gardenInputs++;
			// attachGardenSubmit();
		}
	});
}

function newGardenSubmit(event) {
	// Stop form from submitting normally
	event.preventDefault();
	const gardenName = {"garden": {"name": $("input#name").val()}};

	  if (gardenName) {
		$.post('/gardens', gardenName)
		gardenInputs = 0;
		$("form").remove()
	  } else {
		console.log("You got it wrong.");
	  }

	getGardens();	
}

// function createGarden() {
// 	const gardenName = {"garden": {"name": $("#garden-name").val()}};
// 	if (gardenName) {
// 		$.post('/gardens', gardenName.serialize());
 
// 	} else {
// 		console.log("You got it wrong.");
// 	}
// }

function getGardens() {
	$.get('/gardens.json', function(res) {
		$("#garden_plants").empty();
		res.forEach((garden) => {
			var html = `<li><a href='/gardens/${garden.id}'>${garden.name}</a> - ${garden.garden_plants.length} Plants Live Here</li>`
			$("#garden_plants").append(html);
		});
	});

// 	gardens.forEach((garden) => {
// 	var html = `<li><a href='/gardens/${garden.id}'>${garden.name}<\a><\li>`;
// 	$("ul").append(html);
// });
}
