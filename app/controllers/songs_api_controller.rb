class SongsApiController < ApplicationController

  def api
    response = SongClient('/' + params[:request])
    render json: response
  end
end
