Specifications for the Rails Assessment
Specs:

X - Using Ruby on Rails for the project
0 - Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
	- Gardens & Plants 
0 - Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
	- Users & Gardens
0 - Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
	- garden_plants
0 - The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
	- Watered Time?????
0 - Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
	- Presence & Uniqueness
0 - Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
	- 'Gardens with plant'
 Include signup (how e.g. Devise)
 	- Devise
 Include login (how e.g. Devise)
 	- Devise
 Include logout (how e.g. Devise)
 	- Devise
 Include third party signup/login (how e.g. Devise/OmniAuth)
 	- Omniauth
 Include nested resource show or index (URL e.g. users/2/recipes)
 	- Garden Plants
 Include nested resource "new" form (URL e.g. recipes/1/ingredients)
	- HOW TO CORRECT IDS?	
 Include form display of validation errors (form URL e.g. /recipes/new)
 	- FIELDS WITH ERRORS CLASS FOR VALIDATIONS
 Add README with requirements
 Add plant seeds
Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate
 NO NESTED FORMS REQUIRED AT PRESENT
 Incorporate .build / activerecord methods

Keep it....

 SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE SIMPLE 