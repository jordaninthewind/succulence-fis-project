// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

class Plant {
  constructor(obj) {
	this.name = obj.name,
	this.genus = obj.genus,
	this.water_frequency = obj.water_frequency,
	this.image_url = obj.image_url
  }

  dataBlob() {
	var html = `<div><em><strong>Name:</strong> ${this.name}</em></div>
			<div><em><strong>Genus:</strong> ${this.genus}</em></div>
			<div><em><strong>Watering Frequency:</strong> ${this.water_frequency}</em></div>`

	// if (this.image_url) {
		// debugger;
		html += `<div><img src='${this.image_url}' width="150px" height="150px"></div>`;
	// }
	// console.log(html);
	// debugger;
	return html;
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

// function plantLiMaker(plant) {
// 	return `<br><div><strong>Genus:</strong> ${plant.genus} - <strong>Watering Frequency:</strong> Every ${plant.water_frequency} Days</div><br>`
// }

function getPlantInfo() {
	$("ul#plants-index li a").on('click', function(e) {
		e.preventDefault();

		var url = $(this).attr('href');
		fetch(`${url}.json`, {credentials: 'same-origin'})
			.then((res) => res.json())
			// .then((object) => $(this).after(plantLiMaker(object)))
			.then((object) => $(this).after(plantPartialUpdater(object)))
			});

		// var newPlant = new Plant(plant);
		// console.log(newPlant)
	};


function plantPartialUpdater(plant) {
	debugger;
	var currentPlant = new Plant(plant);
	$("div.plant_show_partial").html(currentPlant.dataBlob());
}