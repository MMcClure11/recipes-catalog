u = User.create(name: "Meg", username: "Meg", email: "meg@email.com", password: "password")

r = Recipe.create(user: u, name: "Green Smoothie", ingredients: "green foods", instructions: "blend to snot", serving_size: "2", cook_time: "infinity")

c = Category.create(name: "Fun foods")