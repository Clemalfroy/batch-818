require "json"
require "open-uri"

url = "https://api.github.com/users/clemalfroy"

user_serialized = URI.open(url).read

user_hash = JSON.parse(user_serialized)

p user_hash["login"]