// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

class Garden {
	constructor(obj) {
		this.name = obj.name,
		this.id = obj.id,
		this.userId = obj.user_id,
		this.plants = obj.plants
	}
}

$(document).ready(function(){
  attachGardensListeners();
});

function attachGardensListeners() {
	console.log('gardens listener')
	addGardenInput();
	loadGardenPlants();
	getGardens()
}

// FUNCTIONS TO ADD INPUT FORM AND MAKE NEW GARDEN

function addGardenInput() {
	$("a#newGarden").on("click", function(e) {
		e.preventDefault();
		$("div#new-garden-form").append("<form action='/gardens' onsubmit='newGardenSubmit(event)' id='garden_name' name='garden'><input type='text' id='name' placeholder='New Name' size='10'><button>Make Garden</button></form>");
		$("a#new-garden").off();
		removeGardenInput();
	})
}

function removeGardenInput() {
	$("a#newGarden").one("click", function(e) {
		e.preventDefault();
		$("div#new-garden-form").empty();
		addGardenInput();
	});
}

function newGardenSubmit(e) {
	e.preventDefault();
	const input = $("input#name").val();
	const gardenName = {"garden": {"name": input}};
	$(".alert_class").empty();
	  if (input) {
		$.post('/gardens', gardenName)
			.then(function(res) {
				$("div#garden-plants").append(gardenListMaker(res));
				$("form").remove();
				$(".alert-class").html("<h1>Garden Successfully Added!</h1>");
		})} else {
				$(".alert-class").html("Name Can't Be Blank");
		}
}

// FUNCTION TO LOAD GARDEN

function getGardens() {
	$("#garden-plants").empty();

	fetch('/gardens.json', {credentials: 'same-origin'})
		.then(function(res) {
			return res.json();
		})
		.then(function(json) {
			json.forEach((garden) => {
				$("#garden-plants").append(gardenListMaker(garden));
		});
	});
}

function gardenListMaker(el) {
	const garden = new Garden(el);
	return `<div><a href='/gardens/${garden.id}' class='garden_list'>${garden.name}</a> - ${garden.plants.length} Plants</div>`;
}

// FUNCTIONS TO LOAD GARDEN PLANTS

function loadGardenPlants() {
	$('div.garden-list a').one('click', function(e){
		e.preventDefault();
		const li = $(this.parentNode);
		const url = $(this).attr('href');
		fetch(`${url}.json`, {credentials: 'same-origin'})
			.then(res => { return res.json() } )
			.then(object => {
				const sortedPlants = object.plants.sort((a, b) => { return a.plant.name > b.plant.name });
				sortedPlants.forEach(function(plant) {
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
	return `<li><a href='/garden_plants/${plant.garden_plant_id}'>${plant.plant.name}</a></li>`;
}

function loadGardenPlantPartial(el) {
	const url = el.childNodes[1].href;
	fetch(url, {credentials: 'same-origin'})
		.then((res) => res.text())
		.then((html) => $('#garden-plant-viewer').html(html))
		.then((html) => console.log(html));
}


function editGardenName() {
	$("span#garden_name").one("click", function() {
		const url = `/gardens/${$(this).attr('data-id')}`
		$(this).append(`<form id="garden_edit" onsubmit="updateGardenName(); return false"><input type='text' id=${url}' placeholder='Type Garden Name Here'></form>`)
	})
}

function updateGardenName(garden_url) {
	let garden_data = $("input").val();
	if (garden_data) {
		$("div.alert_class").empty();
		$.ajax({
			method: 'PUT',
			url: garden_url,
			data: {"garden": {"name": garden_data}}
		}).done(
			() => $("form#garden_edit").remove()
		);

		$("span#garden_name").html(garden_data);
		editGardenName();
	}
	
}

// Possible Features

// function removeGardenPlants(node) {
// 	$(this.parentNode);
// }