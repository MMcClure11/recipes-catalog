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

r2 = Recipe.create(user: u, name: "Yogi Tea", instructions: "Boil Water. Add peppercorns, clove, cinnamon, caradamom, and ginger; let sit 2 minutes at rolling boil. Add tea, stir it in. Cover with lid, reduce heat to simmer; brew minimum 30 minutes, up to two hours for stronger caffeine. Strain into pot or pitcher. Serve with milk and honey to taste.", serving_size: "12", cook_time: "2 hours")
i7 = Ingredient.create(name: "whole cloves")
i8 = Ingredient.create(name: "black peppercorns")
i9 = Ingredient.create(name: "cinnamon sticks")
i10 = Ingredient.create(name: "whole cardamon pods")
i11 = Ingredient.create(name: "ginger slices")
i12 = Ingredient.create(name: "black tea")
i13 = Ingredient.create(name: "water")
 
RecipeIngredient.create(ingredient: i7, recipe: r2, quantity: "15")
RecipeIngredient.create(ingredient: i8, recipe: r2, quantity: "20")
RecipeIngredient.create(ingredient: i9, recipe: r2, quantity: "3")
RecipeIngredient.create(ingredient: i10, recipe: r2, quantity: "20")
RecipeIngredient.create(ingredient: i11, recipe: r2, quantity: "8")
RecipeIngredient.create(ingredient: i12, recipe: r2, quantity: "1/2 teaspoon")
RecipeIngredient.create(ingredient: i13, recipe: r2, quantity: "2 quarts")

r2.categories << c

r3 = Recipe.create(user: u, name: "Sandwich Bread", instructions: "Dissolve sugar in warm water, stir in yeast, proof until creamy foam. Mix in salt and oil. Add flour one cup at a time turning with dough hook, once all flour incorporated knead by hand until smooth elastic dough. Place in well oiled bowl, turn dough to coat, cover with damp cloth, let rise until doubled; about 1 hour. Punch dough down, knead for a few minutes, divide in half. Shape into loaves and place in well oiled and floured 9x5 inch pans. Rise 30 minutes or until dough is one inch above pans. Bake 350F for 30 minutes.", serving_size: "24", cook_time: "3.5 hours")
i14 = Ingredient.create(name: "warm water")
i15 = Ingredient.create(name: "white sugar")
i16 = Ingredient.create(name: "yeast")
i17 = Ingredient.create(name: "sea salt")
i18 = Ingredient.create(name: "olive oil")
i19 = Ingredient.create(name: "all purpose flour")
 
RecipeIngredient.create(ingredient: i14, recipe: r2, quantity: "2 C")
RecipeIngredient.create(ingredient: i15, recipe: r2, quantity: "2/3 C")
RecipeIngredient.create(ingredient: i16, recipe: r2, quantity: "1 1/2 T")
RecipeIngredient.create(ingredient: i17, recipe: r2, quantity: "1 1/2 t")
RecipeIngredient.create(ingredient: i18, recipe: r2, quantity: "1/4 C")
RecipeIngredient.create(ingredient: i19, recipe: r2, quantity: "6 C")

c2 = Category.create(name: "Bread")
r3.categories << c2