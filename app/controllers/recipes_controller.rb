class RecipesController < ApplicationController

  get '/recipes' do
    authenticate
    @user = current_user
    erb :'/recipes/index'
  end

  get '/recipes/new' do
    authenticate
    erb :'/recipes/new'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    authorize(@recipe)
    erb :'recipes/show'
  end

  post '/recipes' do
    authenticate
    @recipe = Recipe.create(name: params[:name], 
      serving_size: params[:serving_size], 
      cook_time: params[:cook_time], 
      ingredients: params[:ingredients], 
      instructions: params[:instructions], 
      user: current_user)
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
    authorize(@recipe)
    erb :'/recipes/edit'
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by(id: params[:id])
    authorize(@recipe)
    @recipe.update(name: params[:name], 
      serving_size: params[:serving_size], 
      cook_time: params[:cook_time], 
      ingredients: params[:ingredients], 
      instructions: params[:instructions])
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    authorize(recipe)
    recipe.destroy
    redirect '/recipes'
  end
end


#category info
# for recipes/show
# <h3>Categories</h3>
# <ul>
#   <% @recipe.categories.each do |category| %>
#     <li><%= category.name %></li>
#   <% end %>
# </ul>

#for recipes/new
# <label for="category">Choose a Category:</label><br>
# <% Category.all.each do |category| %>
#   <input type="checkbox" name="category[name][]" id="category_<%= category.id %>" value="<%= category.id %>"><%= category.name %></input><br>
# <% end %>
# <br>
# <p>Or Create a Category:</p>
#   <label for="new_category">Category Name:</label>
#   <input type="text" name="category[name]">
# <br><br>
# 