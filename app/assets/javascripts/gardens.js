// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var gardens = "Gardens.js is accessible."

document.addEventListener("DOMContentLoaded", function(event) { 
  attachGardensListeners();
});

var gardenInputs = 0;

function attachGardensListeners() {
	console.log('gardens listener')
	addGardenInput();
	loadGardenPlants();
}

function addGardenInput() {
	$("a#newGarden").on("click", function(e) {
		e.preventDefault();
		// if (!gardenInputs){
			$("#newGarden").after("<form action='/gardens' id='garden_name' name='garden'><input type='text' id='name' placeholder='Garden Name' onsubmit='newGardenSubmit(event)'><button onclick='newGardenSubmit(event)'>Make Garden</button></form>");
			// gardenInputs++;
			$("a#newGarden").off();
			removeGardenInput();
	})
}

function removeGardenInput() {
	$("a#newGarden").one("click", function(e) {
		e.preventDefault();
		$("form#garden_name").empty();
		addGardenInput();
	});
}

function newGardenSubmit(e) {
	e.preventDefault();

	let input = $("input#name").val();
	const gardenName = {"garden": {"name": input}};

	  if (input) {
		$.post('/gardens', gardenName)
			.then(function(res) {
				$("ul#garden_plants").append(gardenLiMaker(res));
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
				$("ul#garden_plants").append(gardenLiMaker(garden));
			});
		  });
}

function loadGardenPlants() {
	$('#garden_plants li a').on('click', function(e) { //find out how to remove event listener
		e.preventDefault();
		const li = $(this.parentNode);
		var url = $(this).attr('href')
		var returnHTML;
		fetch(`${url}.json`, {credentials: 'same-origin'})
			.then((res) => res.json())
			.then(function (object){
				object.plants.forEach(function(plant) {
					li.append(gardenPlantsLiMaker(plant));
					// console.log(gardenPlantsLiMaker(plant));
				})
			})		//$(this).after(plantLiMaker(object)))

	$(this).off();

	$(this).on('click', function(e) {
		e.preventDefault();
		debugger;
		// var li = this;
		// alert('you fucked up.');
		// removeGardenPlants(node);
	})
	});
}

function removeGardenPlants(node) {
		// debugger;
		$(this.parentNode);
}

function gardenLiMaker(garden) {
	return `<li><a href='/gardens/${garden.id}'>${garden.name}</a> - ${garden.plants.length} Plants Live Here</li>`;
}

function gardenPlantsLiMaker(plant) {
	return `<div>   - <a href='/plants/${plant.plant.id}'>${plant.plant.name}</a>GP ID: ${plant.garden_plant_id}</div>`; //- ${plant.last_watered}</div>
}

