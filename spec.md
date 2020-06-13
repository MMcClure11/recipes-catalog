# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - used Sinatra
- [x] Use ActiveRecord for storing information in a database - used ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category) - has 6 model classes
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - many - many relationship between recipes and ingredients, as well as recipes and categories. Users also have many recipes and a recipe belongs to a user.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - recipe-ingredients belong to ingredient and recipe, category-recipes belong to category and ingredient. Recipe belongs to a user. 
- [x] Include user accounts with unique login attribute (username or email) - validates uniqueness of username and email
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying -  a user can create, read, update and destory a recipe
- [x] Ensure that users can't modify content created by other users - helper methods of authorize and authenticate prevent users from making patch and delete requests to recipes that do not belong to them
- [x] Include user input validations - validates for presence of name, username, and email for user signup and editing their account. validates for presence of name, cook_time, serving_size and instructions when making a recipe.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - uses validation failures to display error messages on sign up, editing user account, making and editing a recipe.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - license is in root directory.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
