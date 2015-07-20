class VidrevController < ApplicationController
  def index
    m = MetacriticAPI.new
    @meta = m.critic_review "http://www.metacritic.com/game/playstation-4/rory-mcilroy-pga-tour"

    y = YoutubeAPI.new
    @youtube = y.video_review "batman arkham knight review"
  end
end