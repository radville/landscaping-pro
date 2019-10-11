class ApplicationController < ActionController::Base
    helper_method :signed_in_with_google

    def index
    end

    def landscaper_or_user_signed_in?
        if !current_landscaper && !current_user
            flash[:notice] = "Please sign in or sign up"
            redirect_to root_url
        end
    end

    def signed_in_with_google
        current_user.provider == "google_oauth2"
    end
end
