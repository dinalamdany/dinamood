# Dina's Animal App

require 'sinatra'
require 'rubygems'
require 'json'
require 'net/http'

def get_tweet(username)
	base_url = "http://api.twitter.com/1/users/show.json"
	url = "#{base_url}?screen_name=#{username}"
	resp = Net::HTTP.get_response(URI.parse(url))
	data = resp.body

	result = JSON.parse(data)

	if result.has_key? 'Error'
		raise "Something went horribly wrong error"
	end
	return result
end

get '/' do
	print get_tweet("kylehardgrave")
end
