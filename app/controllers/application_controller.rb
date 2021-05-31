
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end
#index
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  #new
  get '/articles/new' do
    @article = Article.new
    erb :new
  end
#create
  post '/articles' do
    # binding.pry
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
    # erb :show
  end
#show
get "/articles/:id" do
  @article = Article.find(params[:id])
  erb :show
end
#edit
get "/articles/:id/edit" do
  @article = Article.find(params[:id])
  erb :edit
end
#update
patch "/articles/:id" do
  @article = Article.find(params[:id])
  @article.update(params[:article])
  redirect to "/articles/#{ @article.id }"
end

  #destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end




# Create the get '/articles' controller action. This action should use Active Record to grab all of the articles and store them in an instance variable, @articles. Then, it should render the index.erb view. That view should use ERB to iterate over @articles and render them on the page.

# Create the get '/articles/:id' controller action. This action should use Active Record to grab the article with the id that is in the params and set it equal to @article. Then, it should render the show.erb view page. That view should use ERB to render the @article's title and content.