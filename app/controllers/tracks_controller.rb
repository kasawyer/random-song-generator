class TracksController < ApplicationController
  def index
    @url = "http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=#{ENV["LAST_FM_KEY"]}&format=json&limit=100"
    @json = Net::HTTP.get(URI.parse(@url))
    @parse = JSON.parse(@json)

    @tracks = @parse["tracks"]["track"]
    @track_1 = @tracks.sample
    @track_2 = nil

    while @track_2.nil? || @track_1 == @track_2 do
      @track_2 = @tracks.sample
    end
    #@video = search_youtube('talking heads this must be the place')
  end
end

# DEVELOPER_KEY = ENV["GOOGLE_KEY"]
# YOUTUBE_API_SERVICE_NAME = 'youtube'
# YOUTUBE_API_VERSION = 'v3'
#
# def get_service
#   client = Google::APIClient.new(
#     :key => DEVELOPER_KEY,
#     :authorization => nil,
#     :application_name => $PROGRAM_NAME,
#     :application_version => '1.0.0'
#   )
#   youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
#
#   return client, youtube
# end
#
# def search_youtube(search_term)
#   opts = Trollop::options do
#     opt :q, search_term, :type => String, :default => 'Google'
#     opt :max_results, 'Max results', :type => :int, :default => 1
#   end
#   client, youtube = get_service
#
#   begin
#     search_response = client.execute!(
#       :api_method => youtube.search.list,
#       :parameters => {
#         :part => 'snippet',
#         :q => opts[:q],
#         :maxResults => opts[:max_results]
#       }
#     )
#
#     @videos = []
#     search_response.data.items.each do |search_result|
#       case search_result.id.kind
#         when 'youtube#video'
#           @videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
#       end
#     end
#     @videos
#end
