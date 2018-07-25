// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

let plants = [];

class Plant {
  constructor(obj) {
	this.name = obj.name,
	this.genus = obj.genus,
	this.water_frequency = obj.water_frequency,
	this.image_url = obj.image_url
	plants.push(this);
  }	
}
// function Plant(obj) {
// 	this.name = obj.name,
// 	this.genus = obj.genus,
// 	this.water_frequency = obj.water_frequency,
// 	this.image_url = obj.image_url
// }

Plant.prototype.dataBlobPic = function() {
		return `<div>
					<img class="viewer" src='${this.image_url}'>
				</div>`;
}

Plant.prototype.dataBlobInfo = function() {
		return `<div id="plant-info"><br><br><br>
					<div><em><strong>Name: </strong>${this.name}</em></div><br />
			    	<div><em><strong>Watering Frequency:</strong> Every ${this.water_frequency}</em> Days</div><br />
					<div><em><strong>Genus:</strong> ${this.genus}</em></div>
				</div>`;
}

function bindPlantsListeners() {
	console.log('plants listener')
	getPlantInfo();
}

function getPlants() {
	$("div#plant-container").empty();
	fetch('/plants.json', {credentials: 'same-origin'})
		.then(res => { res.json() })
		.then(function(json) {
			json.forEach((obj) => {
				plantLiMaker(plant)
		});
	});
}

function getPlantInfo() {
	$("div#plant-container div a").on('click', function(e) {
		e.preventDefault();

		var url = $(this).attr('href');
		fetch(`${url}.json`, {credentials: 'same-origin'})
			.then((res) => {return res.json()})
			.then((object) => $(this).after(plantPartialUpdater(object)))
			});
	};


function plantPartialUpdater(obj) {
	var currentPlant = new Plant(obj);
	$("div.plant-show").html(currentPlant.dataBlobPic());
	$("div.plant-show-detail").html(currentPlant.dataBlobInfo());
}

// Possible Features to Add

// function addNewPlantForm() {
// 	$("div#plant_form")
// }