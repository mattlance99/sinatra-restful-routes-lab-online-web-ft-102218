class ApplicationController < Sinatra::Base
  
require 'pry'
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do 
    erb :welcome
  end
  
  post '/project/login' do
    @user = User.find_by(username: params["username"], password: params["password"])
    binding.pry
    if @user
     session[:user_id] = @user.id
      redirect '/account'
    else
          "Hello World error"
    end

  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get "/recipes/new" do 
    erb :new
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
 
  patch '/recipes/:id' do
    @recipe = Article.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingedients = params[:ingedients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  
  post "/recipes" do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end
  
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
 