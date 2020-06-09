u = User.create(name: "Meg", username: "Meg", email: "meg@email.com", password: "password")

r = Recipe.create(user: u, name: "Green Smoothie", instructions: "Peel and chop fruits. Blend spinach and milk until smooth. Add fruits one at a time and continue to blend until smooth.", serving_size: "1", cook_time: "10 minutes")
i = Ingredient.create(name: "green apple")
i2 = Ingredient.create(name: "banana")
i3 = Ingredient.create(name: "spinach")
i4 = Ingredient.create(name: "almond milk")
i5 = Ingredient.create(name: "mango")
i6 = Ingredient.create(name: "pineapple")

RecipeIngredient.create(ingredient: i, recipe: r, quantity: "1")
RecipeIngredient.create(ingredient: i2, recipe: r, quantity: "1")
RecipeIngredient.create(ingredient: i3, recipe: r, quantity: "1 Cup")
RecipeIngredient.create(ingredient: i4, recipe: r, quantity: "1 Cup")
RecipeIngredient.create(ingredient: i5, recipe: r, quantity: "1/2")
RecipeIngredient.create(ingredient: i6, recipe: r, quantity: "several pieces")

c = Category.create(name: "Beverage")
r.categories << c