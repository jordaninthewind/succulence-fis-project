// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

class Plant {
	constructor(name) {
		this.name = name;
	}
}

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

