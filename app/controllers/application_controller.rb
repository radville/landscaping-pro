class ApplicationController < ActionController::Base
    def index
    end

    def landscaper_or_user_signed_in?
        :authenticate_user! || :authenticate_landscaper!
        redirect_to root_url if false
    end
end
