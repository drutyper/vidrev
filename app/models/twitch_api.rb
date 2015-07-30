require 'unirest'

class TwitchAPI

  def game_stream search
    if Twitch.where(search: search).any?
      search
    else
        response = Unirest.get "https://api.twitch.tv/kraken/search/streams",
      headers:{
        "Accept" => "application/vnd.twitchtv.v3+json"
        },
        parameters:{
          :q => search,
      #:hls   => true
      }
    streams = response.body["streams"].map do |m| 
      part = m.values_at("_id", "game", "viewers", "preview")
      part.push m["channel"]["url"]
    end

    streams.each do |id, game, viewers, preview, url|
      Twitch.where(stream_id: id, game: game, viewers: viewers, preview: preview.to_s, links: url).first_or_create!
    end 
  end
end