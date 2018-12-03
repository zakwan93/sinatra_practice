require "sinatra"
# URI use to remove white spacr in url
require "uri"
# Use to run app remotly on other server
# set :bind, "0.0.0.0"

# erb stands for embedeb ruby

def page_content(title)
	File.read("pages/#{title}.txt")
# rescue Errno::ENOENT
# 	return nil
end

def save_content(title,content)
	File.open("pages/#{title}.txt", "w") do |file|
		file.print(content)
	end
end

def delete_content(title)
	File.delete("pages/#{title}.txt")
end
# by default root path when you run app
get "/" do
	erb :welcome, layout: :page
end

get "/new" do
	erb :new, layout: :page
end

# this get method will return the file name
# get "/:title" do
# 	params[:title]
# end

# this get method will return the content of that file
get "/:title" do
	@title = params[:title]
	@content = page_content(@title)
	erb :show, layout: :page
end

get "/:title/edit" do
	@title = params[:title]
	@content = page_content(@title)
	erb :edit, layout: :page
end

put "/:title/edit" do
	save_content(params["title"], params["content"])
	redirect URI.escape("/#{params[:title]}")
end

post "/create" do
	# this method is use to inspect the values we are passsing in parameteres with it's name.
	# params.inspect
	save_content(params["title"], params["content"])
	# we are using URI to escape WHITE SPACE in between title from URL
	redirect URI.escape("/#{params[:title]}")
end
 
delete "/:title" do
	delete_content(params[:title])
	redirect "/"
end
