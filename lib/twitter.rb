require 'rubygems'
require 'json'
require 'net/http'

class Twitter
	
  attr_accessor :hashtag,:search_options
  RECORD_PER_PAGE = 100

	def initialize(hashtag=nil)
		@hashtag = hashtag 
		@search_options = initialize_options
	end	
	
	def initialize_options
    {
      :result_type => 'mixed',
      :include_entities=> true,
      :include_rts=> true,
      :q => @hashtag,
      :rpp => RECORD_PER_PAGE
    }
	end	
	
	def connect_url
		base_url = 'http://search.twitter.com/search.json?'
    search_options.each { |k, v| base_url+="#{k}=#{v}&" }
		URI.escape(base_url)
	end	
	
	def connect
		resp = Net::HTTP.get_response(URI.parse(connect_url))
		data = resp.body
		JSON.parse(data)
	end
	
	def search
    resp = connect
    unique_urls = []
    resp["results"].each do |result|
      text =  result["text"]
      url_regexp = /\bhttps?:\/\/\S+\b/
      unique_urls <<  text.scan(url_regexp).flatten if text =~ url_regexp
    end
    return unique_urls.uniq
	end
end
