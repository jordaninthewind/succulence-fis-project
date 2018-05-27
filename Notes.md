Notes for JS FE:

To Dos for JS FE:
	<!-- - Update Readme/Install Guide/Contributors Guide -->
	<!-- - Update Seed File -->
	- Clean Up gardens.js
	- Work in Listeners Reattach
	- Add Plant in JS
	- Edit Garden Name in JS
	- Add 'high maintenance/low maintenance' in view
	- Add Photo to Garden, make space in view

V2 To Dos:
	- Fix Admin Functionality
	- Add Plant Pictures either in DB or via IMGUR/3rd Party Hosting

<!-- Notes during assessment:

- Refer URL in Partial	


----------------------------------------------------------------------------------------------------------------------------

- Start with ability to select collection plant and draw association from there.
- Later add ability to make new plant that has association in controller (or restrict to only admin flow)
- # work in belongs to that allows plants through garden_plants (User model)
- Add authorization manually
A user is able to make gardens.
	-	Should be able to edit gardens and garden_plants in gardens
	

A garden can have plants associated with it.
	-	A garden should be able to make a new plant and associate the plant with itself
	-	A garden is able to delete plants 

A plant can only belong to one garden.

First Phase

When a user logs in, they are presented with an index page that shows their gardens and an option to make a new garden. By clicking on the garden link, they will be shown details about the garden, including any garden_plants that are present. There is also the ability to add a plant to a garden.

---

Second Phase

Plants have a time period that they are to be watered during, X, when the timestamp and the current time are greater than X number of days, an overdue reminder is updated on the page. By clicking on the button 'watered', the timestamp is updated to current time and the timer is restarted.

---
Big Details

X - Implement garden_plants join table to enable plants as single entries
X - Add User Logic
- Add Omniauth with new instructions from Lab
X - Add more information to views for UI flow
- Begin to work in control flow and authentication/authorization

Little Details

- Add time formatting for views

V2 Ideas
- Add regions for dynamic watering schedules -->