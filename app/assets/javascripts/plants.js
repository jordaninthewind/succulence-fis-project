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
	return     `<div><img class="image_border" src='${this.image_url}' width="170px" height="170px"></div>
			<br><div><em><strong>Name:</strong>${this.name}</em></div>
			    <div><em><strong>Watering Frequency:</strong> ${this.water_frequency}</em></div>
				<div><em><strong>Genus:</strong> ${this.genus}</em></div>`;
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

// function removeGardenPlants () {
//
// }

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

function getPlantInfo() {
	$("ul#plants-index li a").on('click', function(e) {
		e.preventDefault();

		var url = $(this).attr('href');
		fetch(`${url}.json`, {credentials: 'same-origin'})
			.then((res) => res.json())
			.then((object) => $(this).after(plantPartialUpdater(object)))
			});
	};


function plantPartialUpdater(plant) {
	debugger;
	var currentPlant = new Plant(plant);
	$("div.plant_show_partial").html(currentPlant.dataBlob());
}