require "sinatra"
require "haml"

get "/" do
  haml :index
end

post '/login' do
  halt 401, failed_login_header, File.open("public/fail.gif")
end

get "/users/1337" do
  haml :user_page
end

get "/users/*" do
  halt 404, {"Content-Type" => "text/plain"}, "Unknown user"
end

def failed_login_header
  Hash[
    "Content-Type" => "image/gif",
    "UserId" => "1337"
  ]
end
