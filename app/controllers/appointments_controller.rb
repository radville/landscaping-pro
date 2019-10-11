class AppointmentsController < ApplicationController
    before_action :authenticate_landscaper!, only: [:create, :new]
    before_action :landscaper_or_user_signed_in?, only: [:index, :destroy]

    def new
        @appointment = Appointment.new
        @landscaper = current_landscaper
    end

    def create
        appointment = Appointment.new(appointment_params)
        if appointment.save
            redirect_to appointments_path
        else
            redirect_to appointments_new_path
        end
    end

    def index
        if params[:user_id]
            if params[:user_id] == current_user.id.to_s
                @appointments = User.find(params[:user_id]).appointments
            else
                flash[:notice] = "Invalid URL for current user."
                redirect_to user_appointments_path(current_user)
            end
        elsif params[:landscaper_id]
            if params[:landscaper_id] == current_landscaper.id.to_s
                @appointments = Landscaper.find(params[:landscaper_id].appointments)
            else
                flash[:notice] = "Invalid URL for current user."
                redirect_to landscaper_appointments_path(current_landscaper)
            end
        end
    end

    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to root_url
    end

    private
        def appointment_params
            params.require(:appointment).permit(:landscaper_id, :user_id, :datetime, :frequency, :recurring, :price)
        end
end