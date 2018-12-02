# In the get route for the "/greet/:name" path, 
# respond with a string reading "Hello" 
# followed by the contents of the name URL parameter.


require "sinatra"

get "/greet/:name" do
  # YOUR CODE HERE
 	"Hello #{params[:name]}"
end
