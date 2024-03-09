require "sinatra"

set :bind, "0.0.0.0"
port = ENV["PORT"] || "8080"
set :port, port

get "/" do
  erb :index
end

# a comment added to trigger a build
