require 'unirest'

class TwitchAPI

  def game_stream search
    response = Unirest.get "https://api.twitch.tv/kraken/search/streams",
    headers:{
      "Accept" => "application/vnd.twitchtv.v3+json"
    },
    parameters:{
      :q => search,
      :hls   => true
    }

    streams = response.body["streams"].map { |m| m.values_at("_id", "game", "viewers", "preview", "links")}
    #s = response.body["streams"]["channel"].select { |s| s["url"]}
    # t = response.body["streams"].first
    #  v = t["channel"]["url"]
    streams.each do |r|
      Twitch.where(stream_id: r[0], game: r[1], viewers: r[2], preview: r[3], links: r[4]).first_or_create!
    end 
  end

  # def steam_url     
  #   url = []
  #   t = response.body["streams"]
  #   t.each do |r|
  #     a = r["channel"]["url"]
  #     a.to_s
  #     url.push a
  #   end
  # end
end