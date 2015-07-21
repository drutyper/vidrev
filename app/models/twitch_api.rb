require 'unirest'

class TwitchAPI

  def game_stream search
    response = Unirest.get "https://api.twitch.tv/kraken/search/streams",
    headers:{
      "Accept" => "application/vnd.twitchtv.v3+json"
    },
    parameters:{
      :query => "#{search}",
      :hls   => true
    }

    streams = response.body["streams"].map { |m| m.values_at("_id", "game", "viewers", "preview", "_links")}
    streams.each do |r|
      Twitch.create! stream_id: r[0], game: r[1], viewers: r[2], preview: r[3], links: r[4]
    end 
  end
end