class VidrevController < ApplicationController
  def index
    if params[:search]
      m = MetacriticAPI.new
      @meta = m.search_function params[:search]

      y = YoutubeAPI.new
      @youtube = y.video_review params[:search]

      t = TwitchAPI.new
      @twitch = t.game_stream params[:search]
    else
      flash[:failure] =  "Nothing found"
    end
  end
end