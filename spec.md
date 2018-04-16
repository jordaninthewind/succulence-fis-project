Specifications for the Rails Assessment
Specs:

X - Using Ruby on Rails for the project
X - Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
	- Gardens & Plants
X - Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
	- Users & Gardens
X - Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
	- garden_plants

X - The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
	- Watered Time which updates automatically when watered (plant picture to come in JS version)
X - Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
	- Presence & Uniqueness for Plant Entry
0 - Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
	- 'Gardens with plant'
X - Include signup (how e.g. Devise)
 	- Devise
X - Include login (how e.g. Devise)
 	- Devise
X - Include logout (how e.g. Devise)
 	- Devise
X - Include third party signup/login (how e.g. Devise/OmniAuth)
 	- Omniauth
X - Include nested resource show or index (URL e.g. users/2/recipes)
 	- gardens/:garden_id/garden_plants/:id
<!-- X - Include nested resource "new" form (URL e.g. recipes/1/ingredients)
	- HOW TO CORRECT IDS?	NO LONGER A REQUIREMENT -->
X - Include form display of validation errors (form URL e.g. /recipes/new)
 	- FIELDS WITH ERRORS CLASS FOR VALIDATIONS
0 - Add README with requirements
X - Add plant seeds
Confirm:

0 - The application is pretty DRY
0 - Limited logic in controllers
0 - Views use helper methods if appropriate
0 - Views use partials if appropriate
0 - NO NESTED FORMS REQUIRED AT PRESENT
X - Incorporate .build / activerecord methods
 Make sure no orphan data from plant deletion

Keep it....

 SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE 