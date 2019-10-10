module ApplicationHelper
    def authenticate_landscaper_or_user!
        !!current_user || !!current_landscaper
    end
end
