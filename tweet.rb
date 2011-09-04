require './lib/twitter'

hashtag = ARGV.first
if hashtag.nil?
  puts "Please provide tag you want to fetch. Example 'rails'"
  exit
else
 hashtag = '#'+hashtag
end

twitter = Twitter.new(hashtag)
puts "fetching tweets for hashtag : #{hashtag} ......"
twitter.search.each_with_index do |tweet, index|
  index += 1
  puts sprintf('%s. %8s',index, tweet)
end
