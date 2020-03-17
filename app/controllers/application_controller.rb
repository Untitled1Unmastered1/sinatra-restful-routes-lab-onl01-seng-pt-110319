require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do 
    
    erb :new 
  end 
  
  post '/recipes' do 
    @recipe = Recipe.create(:name => params[:recipe_name], :ingredients => params[:recipe_ingredients], :cook_time => params[:recipe_cook_time])
  redirect to "/recipes/#{@recipe.id}"
  end 
  
  get '/recipes' do 
    @recipes = Recipe.all 
    
    erb :index
  end 
  
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    
    erb :show 
  end 

end
