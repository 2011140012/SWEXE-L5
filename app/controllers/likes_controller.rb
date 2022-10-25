class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        unless tweet.liked?(current_user)
            tweet.like(User.find_by(uid: session[:uid]))
        end
        redirect_to root_path
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        if tweet.liked?(current_user)
            tweet.unlike(User.find_by(uid: session[:uid]))
        end
        redirect_to tweets_path
    end
end
