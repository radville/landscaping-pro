class LandscapersController < ApplicationController
    before_action :landscaper_or_user_signed_in?

    def index
        @landscapers = Landscaper.all
    end
end