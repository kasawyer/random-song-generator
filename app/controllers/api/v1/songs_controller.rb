class Api::V1::SongsController < ApiController

  def index
  end

  def environment_variables
    @last_fm_key = ENV['LAST_FM_KEY']
  end
end
