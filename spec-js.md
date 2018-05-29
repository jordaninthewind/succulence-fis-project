Specifications for the Rails with jQuery Assessment
Specs:

 X - Use jQuery for implementing new requirements
 	- Used jQuery & vanilla JS
 X - Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
 	- Garden_plants in garden
 X - Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
 	- Plants & Gardens
 X - Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
 	- Garden_plants in Garden View
 X - Use your Rails API and a form to create a resource and render the response without a page refresh.
 	- Garden Form, but also make Plant form
 X - Translate JSON responses into js model objects.
 	- Change class back to constructor function
 X - At least one of the js model objects must have at least one method added by your code to the prototype.
 	- Change class back to constructor function


Confirm

 You have a large number of small Git commits
 Your commit messages are meaningful
 You made the changes in a commit that relate to the commit message
 You don't include changes in a commit that aren't related to the commit message


--------------

Requirements from Assignment Page:

Requirements:

* Must render at least one index page (index resource - 'list of things') via jQuery and an Active Model Serialization JSON Backend. For example, in a blog domain with users and posts, you might display the index of the users posts on the users show page, fetching the posts via an AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page.
    * This app renders the index page dynamically for GardenPlants. It lists each garden and attaches listeners to the gardens which will load each garden plant in a subsection. By clicking on the plant, a plant instance is created through a JS constructor function (plants) or a class method (gardens). 
* Must render at least one show page (show resource - 'one specific thing') via jQuery and an Active Model Serialization JSON Backend. For example, in the blog domain, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched and rendered via JQuery/AJAX.
    * In the plant index, each plant show page is rendered into a column section where the plant, when clicked on, sends a fetch request for the JSON of the plant. When a success response is received, the JSON is processed, this processed data becomes a Plant object through a constructor function, and it uses a method on the prototype to inject the template literal into a container for each plant. 
* The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page. For example if each of those posts has many comments, you could render those comments as well on that show page.
    * A garden has many plants. This is revealed through the serialized information in the JSON. Each plant is actually an instance of garden plants and the data for the plant is passed, which includes a foreign key ID and the respective plant information. 
* Must use your Rails API and a form to create a resource and render the response without a page refresh. For example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM using JavaScript (ES6 Template Literals can help out a lot with this).
    * A new garden is able to be created by clicking on the ‘Add New Garden’ link. The link uses JS to append an input to the page which, when submitted, posts a new garden to the create route and, upon completion, adds the new garden to the list of gardens. 
* Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype. Formatters work really well for this. Borrowing from the previous example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.
    * As listed above, each model has a class or a constructor function, they are used 