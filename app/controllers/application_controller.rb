class ApplicationController < ActionController::Base
    def index
    end

    def landscaper_or_user_signed_in?
        if !current_landscaper 
            flash[:notice] = "Please sign in or sign up"
            redirect_to root_url
        end
    end
end
