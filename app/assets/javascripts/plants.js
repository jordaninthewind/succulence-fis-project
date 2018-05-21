// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var plants = "Plants.js is accessible.";

document.addEventListener("DOMContentLoaded", function(event) { 
  attachPlantsListeners();
  // getPlants();
});

function attachPlantsListeners() {
	console.log('plants listener')
}

// function addNewPlantForm() {
// 	$("#")

// }

function getPlants() {
	$("ul#plants-index").empty();
	fetch('/plants.json', {credentials: 'same-origin'})
		.then(function(res) {
			return res.json();
		})
		.then(function(json) {
			json.forEach((plant) => {
				plantLiMaker(plant)
				// var html = `<li><a href='/gardens/${garden.id}'>${garden.name}</a> - ${garden.garden_plants.length} Plants Live Here</li>`
				// $("ul#garden_plants").append(html);
			});
		  });
}

function plantLiMaker(plant) {
	var html = `<li><a href='/plants/${plant.id}'>${plant.name}</a></li>`
	$("ul#plants-index").append(html);
}