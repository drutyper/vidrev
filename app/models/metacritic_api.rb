require 'unirest'

class MetacriticAPI

  Token = ENV["key"]

  def search_game title
    response = Unirest.get "https://metacritic-2.p.mashape.com/search/game",
  headers:{
    "X-Mashape-Key" => "#{Token}",
    "Accept" => "application/json"
  },
  parameters:{
    :title => title
  }
 
  # s = Array.new
  # s.push(response.body["results"]["url"])
  # game = response.body["results"].map { |a| a.values_at("url") }

  tophit = response.body["results"].first 
  tophit["url"]
  end
 

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
  
  def search_function search
    url = search_game(search)
    critic_review(url)
  end
end

