json.Metacritic @meta do |m|
json.critic  m[0]
json.score   m[1]
json.excerpt m[2]
json.date    m[3]
json.link    m[4]
end

json.Youtube @youtube do |y|
json.videoId      y[0]
json.title        y[1]
json.description  y[2]
json.image        y[3]
end