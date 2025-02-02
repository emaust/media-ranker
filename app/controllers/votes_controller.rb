class VotesController < ApplicationController
    
    
    def create
        @vote = Vote.new(work_id: params[:id], user_id: session[:user_id])
        
        if session[:user_id] == nil
            flash[:error] = "You must be logged in to upvote this work."
            redirect_back(fallback_location: :back)
            return
        elsif session[:user_id] && @vote.valid?
            @vote.save 
            flash[:success] = "This work has recieved your upvote!"
            redirect_back(fallback_location: :back)
            return
        elsif @vote.valid? == false
            flash[:error] = "You have already voted for this work."
            redirect_back(fallback_location: :back)
            return
        end 
        
    end
    
    
end
