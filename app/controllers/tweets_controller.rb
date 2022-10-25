class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    user = User.find_by(uid: session[:uid])
    tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current, user_id: user.id)
    if tweet.save
      redirect_to tweets_path
    else
      render new_tweet_path
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end
end
