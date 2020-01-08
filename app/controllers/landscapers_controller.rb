class LandscapersController < ApplicationController
    before_action :landscaper_or_user_signed_in?

    def index
        if params[:landscaper]
            @landscapers = Service.find(params[:landscaper][:service_ids]).landscapers
        elsif params[:commit] == "Sort A-Z"
            @landscapers = Landscaper.alphabetical
        elsif params[:commit] == "Sort Z-A"
            @landscapers = Landscaper.reverse_alphabetical
        else
            @landscapers = Landscaper.all
        end
    end

    def popular
        @popular = Landscaper.popular[0]
    end
end