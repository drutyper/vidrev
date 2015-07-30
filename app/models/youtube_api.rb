require 'unirest'

class YoutubeAPI

  Token = ENV["key"]

  def video_review query
    if Youtube.where(query: query).any?
      query
    else

      response = Unirest.get "https://zazkov-youtube-grabber-v1.p.mashape.com/search.video.php",
      headers:{
        "X-Mashape-Key" => Token,
        "Accept" => "application/json"
      },
       parameters:{
         :query => "#{query} review"
       }
        
      videos = response.body["data"].map { |c| c.values_at("videoId", "title", "description", "img")}
      videos.each do |r|
        Youtube.where(videoId: r[0], title: r[1], description: r[2], image: r[3].to_s).first_or_create!
      end
    end
  end
end
