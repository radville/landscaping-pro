class LandscapersController < ApplicationController
    before_action :landscaper_or_user_signed_in?

    def index
        if params[:landscaper]
            # @landscapers = Landscaper.all.select do |landscaper|
            #     landscaper.service_ids.include?(params[:landscaper][:service_ids].to_i)
            # end
            @landscapers = Landscaper.joins(:landscaper_services).where(landscaper_services: {service_id: params[:landscaper][:service_ids]})
        else
            @landscapers = Landscaper.all
        end
    end

    # def service 

    # end
end