# Dina's Animal App

require 'sinatra'
require 'rubygems'
require 'json'
require 'net/http'

#Function to get most recent tweet of a user
def get_tweet(username)
  base_url = "http://api.twitter.com/1/users/show.json?screen_name=#{username}"
  #Request the text from the URL
  resp = Net::HTTP.get_response(URI.parse(base_url))
  data = resp.body
  result = JSON.parse(data)
	
	if result.has_key? 'Error'
    raise "Something went horribly wrong error"
  end
  
	status = result['status']['text']
  return status
end
	
get '/' do
	get_tweet("kylehardgrave")
end

