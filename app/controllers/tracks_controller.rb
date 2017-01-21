require 'net/http'
require 'json'

class TracksController < ApplicationController
  def index
    @url = "http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=#{ENV["LAST_FM_KEY"]}&format=json&limit=100"
    @json = Net::HTTP.get(URI.parse(@url))
    @parse = JSON.parse(@json)

    @tracks = @parse["tracks"]["track"]
    @track = @tracks.sample
  end
end
