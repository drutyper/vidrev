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
  end
end