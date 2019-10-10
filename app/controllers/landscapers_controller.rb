class LandscapersController < ApplicationController
    before_action :authenticate_landscaper_or_user!

    def index
        @landscapers = Landscaper.all
    end
end