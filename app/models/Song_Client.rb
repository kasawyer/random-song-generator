require 'httparty'

class SongClient
  include HTTParty
  base_uri "http://ws.audioscrobbler.com/2.0/"
  default_params {
    api_key: Rails.application.secrets.last_fm_key,
    method: gettoptracks,
    limit: 150
  }
  format :json
end

return SongClient
