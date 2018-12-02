require "sinatra"

# Use to run app remotly on other server
# set :bind, "0.0.0.0"

# erb stands for embedeb ruby

def page_content(title)
	File.read("pages/#{title}.txt")
# rescue Errno::ENOENT
# 	return nil
end

# by default root path when you run app
get "/" do
	erb :welcome
end


# this get method will return the file name
# get "/:title" do
# 	params[:title]
# end

# this get method will return the content of that file
get "/:title" do
	@title = params[:title]
	@content = page_content(@title)
	erb :show
end