class TracksController < ApplicationController
  def index
    @url = "http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=#{ENV["LAST_FM_KEY"]}&format=json&limit=100"
    @json = Net::HTTP.get(URI.parse(@url))
    # if @json already exists don't keep pulling it, no need to hammer the server for the same data
    # maybe that means making a constant?
    # or this could be a job for ajax/react/etc? 
    @parse = JSON.parse(@json)

    @tracks = @parse["tracks"]["track"]
    @track_1 = @tracks.sample
    #add to tracks db if not in there
    @track_2 = nil

    while @track_2.nil? || @track_1 == @track_2 do
      @track_2 = @tracks.sample
    end
    #add to tracks db if not in there
  end

  def winner
    #add winning outcome to db
    #set @track_1 to winner_icon
    #get new @track_2
    #render :index
  end
end
