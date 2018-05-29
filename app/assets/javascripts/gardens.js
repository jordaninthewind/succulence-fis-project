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

// $(document).ready(function(){
// document.addEventListener("DOMContentLoaded", function(event) { 
  // attachGardensListeners()
// });


function attachGardensListeners() {
	console.log('gardens listener')
	addGardenInput();
	loadGardenPlants();
	// getGardens()
}

// FUNCTIONS TO ADD INPUT FORM AND MAKE NEW GARDEN

function addGardenInput() {
	$("a#newGarden").on("click", function(e) {
		e.preventDefault();
		$("#newGarden").after("<div><form action='/gardens' id='garden_name' name='garden'><input type='text' id='name' placeholder='New Name' size='10' onsubmit='newGardenSubmit(event)'><button onclick='newGardenSubmit(event)'>Make Garden</button></form></div>");
		$("a#newGarden").off();
		removeGardenInput();
	})
}

function removeGardenInput() {
	$("a#newGarden").one("click", function(e) {
		e.preventDefault();
		$("form#garden_name").empty();
		$(".alert_class").empty();
		addGardenInput();
	});
}

function newGardenSubmit(e) {
	e.preventDefault();
	let input = $("input#name").val();
	const gardenName = {"garden": {"name": input}};
	$(".alert_class").empty();
	  if (input) {
		$.post('/gardens', gardenName)
			.then(function(res) {
				$("ul#garden_plants").append(gardenLiMaker(res));
				$("form").remove();
		})} else {
				$(".alert_class").html("Name Can't Be Blank");
		}
}

// FUNCTION TO LOAD GARDEN

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

function gardenLiMaker(el) {
	var garden = new Garden(el);
	return `<div><li><a href='/gardens/${garden.id}' class='garden_li'>${garden.name}</a> - ${garden.plants.length} Plants</li></div>`;
}

// FUNCTIONS TO LOAD GARDEN PLANTS

function loadGardenPlants() {
	$('#garden_plants li a').one('click', function(e){
		e.preventDefault();
		const li = $(this.parentNode);
		var url = $(this).attr('href');
		fetch(`${url}.json`, {credentials: 'same-origin'})
			.then(res => res.json())
			.then(object => {
				object.plants.forEach(function(plant) {
					li.append(gardenPlantsLiMaker(plant));
					$(li.context.lastChild).on('click', function(e) {
						e.preventDefault();
						const li = this;
						loadGardenPlantPartial(li);
					})
				})
			})
	});
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


function editGardenName() {
	$("span#garden_name").one("click", function() {
		const url = `/gardens/${$(this).attr('data-id')}`
		$(this).append(`<form id="garden_edit" onsubmit="updateGardenName(); return false"><input type='text' id=${url}' placeholder='${$(this).html()}'></form>`)
	})
}

function updateGardenName(garden_url) {
	let garden_data = $("input").val();
	$.ajax({
		method: 'PUT',
		url: garden_url,
		data: {"garden": {"name": garden_data}}
	}).done(
	() => $("form#garden_edit").remove()
	)

	$("span#garden_name").html(garden_data)
	editGardenName();
}

// Possible Features

// function removeGardenPlants(node) {
// 	$(this.parentNode);
// }