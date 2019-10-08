class LandscapersController < ApplicationController
    before_action :authenticate_user!

    def show
        @landscaper = Landscaper.find(params[:id])
    end

    def index
        @landscapers = Landscaper.all
    end
end