// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("DOMContentLoaded", function(event) { 
  attachListeners();
  // getGardens();
});

var gardenInputs = 0;

function attachListeners() {
	addGardenInput();
}

function addGardenInput() {
	$("#newGarden").on("click", function(e) {
		e.preventDefault();
		if (!gardenInputs){
			$("#newGarden").append("<form action='/gardens' id='garden_name' name='garden'><input type='text' id='name' placeholder='Garden Name' onsubmit='newGardenSubmit(event)'><button onclick='newGardenSubmit(event)'>Make Garden</button></form>");
			gardenInputs++;
		}
	});
}

function newGardenSubmit(e) {
	e.preventDefault();

	let input = $("input#name").val();
	const gardenName = {"garden": {"name": input}};

	  if (input) {
		$.post('/gardens', gardenName)
			.then(function(res) {
				gardenLiMaker(res);
				$("form").remove();
				gardenInputs = 0;
			})
		
	  } else {
		console.log("You got it wrong.");
	  }
}

function getGardens() {
	$("#garden_plants").empty();
	fetch('/gardens.json', {credentials: 'same-origin'})
		.then(function(res) {
			return res.json();
		})
		.then(function(json) {
			json.forEach((garden) => {
				// var html = `<li><a href='/gardens/${garden.id}'>${garden.name}</a> - ${garden.garden_plants.length} Plants Live Here</li>`
				// $("ul#garden_plants").append(html);
				gardenLiMaker(garden);
			});
		  });
}

function gardenLiMaker(garden) {
	var html = `<li><a href='/gardens/${garden.id}'>${garden.name}</a> - ${garden.garden_plants.length} Plants Live Here</li>`
	$("ul#garden_plants").append(html);
}