class VidrevController < ApplicationController
  def index
    if params[:search]

     start = Time.now

     meta, yt, twi = [],[],[]
    t1 = Thread.new do
      m = MetacriticAPI.new
      meta = m.search_function params[:search]
    end

    t2 = Thread.new do
      y = YoutubeAPI.new
      yt = y.video_review params[:search]
    end

    t3 = Thread.new do
      t = TwitchAPI.new
      twi = t.game_stream params[:search]
    end
  else
    flash[:failure] =  "Nothing found"
  end

  t1.join
  t2.join
  t3.join

  @metacritic = meta
  @youtube = yt
  @twitch = twi

  stop = Time.now

  @time = stop - start
  end

end
