require 'unirest'

class MetacriticAPI

  Token = ENV["key"]

  def critic_review url
    response = Unirest.get "https://metacritic-2.p.mashape.com/reviews",
    headers:{
      "X-Mashape-Key" => "#{Token}",
      "Accept" => "application/json"
    },
    parameters:{
      :url => "#{url}"
    }
    
    reviews = response.body["results"].map { |c| c.values_at("critic", "score", "excerpt", "date", "link")}
    reviews.each do |r|
      Metacritic.create! critic: r[0], score: r[1], excerpt: r[2], date: r[3], link: r[4]
    end
  end
end