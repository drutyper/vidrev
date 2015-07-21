class VidrevController < ApplicationController
  def index
    m = MetacriticAPI.new
    @meta = m.search_function "batman arkham knight"

    y = YoutubeAPI.new
    @youtube = y.video_review "batman arkham knight review"

    t = TwitchAPI.new
    @twitch = t.game_stream "dota 2"
  end
end