// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

class GardenPlant {
	constructor(object) {
		this.id = id;
		this.name = name;
		this.genus = genus;
		this.water_frequency = water_frequency;
	}
}

var plants = "Plants.js is accessible.";

document.addEventListener("DOMContentLoaded", function(event) { 
  attachPlantsListeners();
  // getPlants();
});

function attachPlantsListeners() {
	console.log('plants listener')
	getPlantInfo();
	
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
	return `<br><div><strong>Genus:</strong> ${plant.genus} - <strong>Watering Frequency:</strong> Every ${plant.water_frequency} Days</div><br>`
}

function getPlantInfo() {
	$("ul#plants-index li a").on('click', function(e) {
		e.preventDefault();

		var url = $(this).attr('href');
		fetch(`${url}.json`, {credentials: 'same-origin'})
			.then((res) => res.json())
			.then((object) => $(this).after(plantLiMaker(object)))
			});

		// var newPlant = new Plant(plant);
		// console.log(newPlant)
	};

