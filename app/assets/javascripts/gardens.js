// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

class Garden {
	constructor(obj) {
		this.name = obj.name,
		this.id = obj.id,
		this.user_id = obj.user_id,
		this.plants = obj.plants
	}
}

var gardens = [];
var gardenLoadTimes = 0;

$(window).on('load', function(){
// document.addEventListener("DOMContentLoaded", function(event) { 
  attachGardensListeners()
});


function attachGardensListeners() {
	console.log('gardens listener')
	addGardenInput();
	loadGardenPlants();
	gardenLoadTimes++;
	// getGardens()
}

// FUNCTIONS TO ADD INPUT FORM AND MAKE NEW GARDEN

function addGardenInput() {
	$("a#newGarden").on("click", function(e) {
		e.preventDefault();
		$("#newGarden").after("<div><form action='/gardens' id='garden_name' name='garden'><input type='text' id='name' placeholder='Garden Name' size='10' onsubmit='newGardenSubmit(event)'><button onclick='newGardenSubmit(event)'>Make Garden</button></form></div>");
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
			})
		
	  } else {
		console.log("You got it wrong.");
	  }
}

// FUNCTIONS TO LOAD GARDEN PLANTS - Not necessary because of event listener complications

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
	attachGardensListeners();
}

// function addGardenPlantListener() {

// }

function loadGardenPlants() {
	$('#garden_plants li a').on('click', function(e){
		e.preventDefault();
		const li = $(this.parentNode);
		var url = $(this).attr('href');
		fetch(`${url}.json`, {credentials: 'same-origin'})
			.then((res) => res.json())
			.then(function (object){
				object.plants.forEach(function(plant) {
					li.append(gardenPlantsLiMaker(plant));
					$(li.context.lastChild).on('click', function(e) {
						e.preventDefault();
						const li = this;
						loadGardenPlantPartial(li);
					})
				})
			})		//$(this).after(plantLiMaker(object)))

	$(this).off();
	});
}

function removeGardenPlants(node) {
	$(this.parentNode);
}

function gardenLiMaker(el) {
	var garden = new Garden(el);
	gardens.push(garden);
	return `<div><li><a href='/gardens/${garden.id}' class='garden_li'>${garden.name}</a> - ${garden.plants.length} Plants</li></div>`;
}

function gardenPlantsLiMaker(plant) {
	return `<div>   - <a href='/garden_plants/${plant.garden_plant_id} '>${plant.plant.name}</a></div>`;
}

function loadGardenPlantPartial(el) {
	const url = el.childNodes[1].href;
	fetch(url, {credentials: 'same-origin'})
		.then((res) => res.text())
		.then((html) => $('#garden_plant_viewer').html(html))
		.then((html) => console.log(html));
}