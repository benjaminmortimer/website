require "sinatra"

require './lib/post.rb'

set :bind, "0.0.0.0"
port = ENV["PORT"] || "8080"
set :port, port

get "/" do
  erb :index
end

get '/posts/:post_path' do
  @post = Post.find(params[:post_path])
  if @post
    erb :post
  else
    error 404
  end
end

error 404 do
  erb :'errors/404'
end
  
