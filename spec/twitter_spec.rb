require 'spec_helper'

describe Twitter, "twitter hashtag" do
  context "initialize twitter" do
    it "Should set hashtag" do
      twitter = Twitter.new("#rails")
      twitter.hashtag.should == "#rails"
    end
  end
end

describe Twitter, "twitter hashtag tweets" do
  before(:each) do
    @twitter = Twitter.new("#rails")
    @tweets = @twitter.stub!(:search).and_return(some_tweets)
  end

  it "Should return tweets array" do
    
  end

  

  private

  def some_tweets
    ["Some text http://rubyonrails.org #rails",
     "Some duplicate url text http://rubyonrails.org #rails",
    "Some more tweet without url but have hashtag #rails"].map {|item| Hashie::Mash.new(:text => item)}
  end
end
