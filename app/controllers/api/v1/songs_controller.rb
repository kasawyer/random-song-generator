class Api::V1::SongsController < ApiController

  def index
    render json: @songs
  end
end
